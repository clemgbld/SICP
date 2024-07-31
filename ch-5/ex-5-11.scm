(load "ch-5/ch5-regsim.scm")

(define (fib n) (if (< n 2) 
                  1 
                  (+ (fib (- n  1) ) (fib (- n 2) ))))

(define fib-machine 
  (make-machine '(n continue val) 
  (list (list '+ +) (list '- -) (list '< <) )
'((assign continue (label fib-done))
fib-loop
(test (op <) (reg n) (const 2))
(branch (label immediate-answer))
(save continue)
(assign continue (label afterfib-n-1))
(save n) 
(assign n (op -) (reg n) (const 1)) 
(goto (label fib-loop))
afterfib-n-1
(restore n)
(assign n (op -) (reg n) (const 2))
(assign continue (label afterfib-n-2))
(save val) 
(goto (label fib-loop))
afterfib-n-2 
(restore n)
(restore continue)
(assign val (op +) (reg val) (reg n))
  (goto (reg continue))
immediate-answer
  (assign val (reg n))
  (goto (reg continue))
fib-done)))


;b

(define (make-save inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst)) 
         (reg (get-register machine reg-name)))
    (lambda ()
      (push stack (cons reg-name (get-contents reg)))
      (advance-pc pc))))


(define (make-restore inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst)) 
         (reg (get-register machine reg-name)))
    (lambda ()
      (let ((result (pop stack)))
       (if (eq? (car result) reg-name) 
         (begin (set-contents! reg (cdr result) )    
          (advance-pc pc))
       (error "the value is not from the register:" reg-name ))))))

;c


(define (make-register name)
  (let ((contents '*unassigned*) (stack (make-stack)))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value) (set! contents value)))
            ((eq? message 'stack) stack)
            (else
             (error "Unknown request -- REGISTER" message))))
    dispatch))

(define (make-machine register-names ops controller-text)
  (let ((machine (make-new-machine)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    ((machine 'install-operations) ops)    
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))


(define (update-insts! insts labels machine)
  (let ((pc (get-register machine 'pc))
        (flag (get-register machine 'flag))
        (ops (machine 'operations)))
    (for-each
     (lambda (inst)
       (set-instruction-execution-proc! 
        inst
        (make-execution-procedure
         (instruction-text inst) labels machine
         pc flag ops)))
     insts)))

(define (make-execution-procedure inst labels machine
                                  pc flag  ops)
  (cond ((eq? (car inst) 'assign)
         (make-assign inst machine labels ops pc))
        ((eq? (car inst) 'test)
         (make-test inst machine labels ops flag pc))
        ((eq? (car inst) 'branch)
         (make-branch inst machine labels flag pc))
        ((eq? (car inst) 'goto)
         (make-goto inst machine labels pc))
        ((eq? (car inst) 'save)
         (make-save inst machine  pc))
        ((eq? (car inst) 'restore)
         (make-restore inst machine  pc))
        ((eq? (car inst) 'perform)
         (make-perform inst machine labels ops pc))
        (else (error "Unknown instruction type -- ASSEMBLE"
                     inst))))

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (the-instruction-sequence '()))
    (let* ((register-table
           (list (list 'pc pc) (list 'flag flag)))
           (the-ops
           (list (list 'initialize-stacks
                       (lambda () 
                         (for-each (lambda (reg) (((cadr reg) 'stack) 'initialize)) register-table)))
                 ;;**next for monitored stack (as in section 5.2.4)
                 ;;  -- comment out if not wanted
                 (list 'print-stack-statistics
                       (lambda () (stack 'print-statistics)))))
          )
      (define (allocate-register name)
        (if (assoc name register-table)
            (error "Multiply defined register: " name)
            (set! register-table
                  (cons (list name (make-register name))
                        register-table)))
        'register-allocated)
      (define (lookup-register name)
        (let ((val (assoc name register-table)))
          (if val
              (cadr val)
              (error "Unknown register:" name))))
      (define (execute)
        (let ((insts (get-contents pc)))
          (if (null? insts)
              'done
              (begin
                ((instruction-execution-proc (car insts)))
                (execute)))))
      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents! pc the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq) (set! the-instruction-sequence seq)))
              ((eq? message 'allocate-register) allocate-register)
              ((eq? message 'get-register) lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops) (set! the-ops (append the-ops ops))))
              ((eq? message 'stacks) stacks)
              ((eq? message 'operations) the-ops)
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))

(define (make-save inst machine pc)
  (let* ((reg-name (stack-inst-reg-name inst))
         (reg (get-register machine
                           reg-name))
         (stack (reg 'stack)))
    (push stack (get-contents reg))
    (lambda ()
      (advance-pc pc))))

(define (make-restore inst machine  pc)
  (let* ((reg-name (stack-inst-reg-name inst))
         (reg (get-register machine
                           reg-name))
         (stack (reg 'stack))
         )
    (lambda ()
      (set-contents! reg (pop stack))    
      (advance-pc pc))))
