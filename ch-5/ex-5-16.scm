(load "ch-5/ch5-regsim.scm")

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '())
        (instruction-count 0)
        (is-tracing #f))
    (let ((the-ops
           (list (list 'initialize-stack
                       (lambda () (stack 'initialize)))
                 ;;**next for monitored stack (as in section 5.2.4)
                 ;;  -- comment out if not wanted
                 (list 'print-stack-statistics
                       (lambda () (stack 'print-statistics)))))
          (register-table
           (list (list 'pc pc) (list 'flag flag))))
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
                (if is-tracing 
                  (begin 
                    (display (caar insts))
                    (newline)))
                ((instruction-execution-proc (car insts)))
                (set! instruction-count (+ instruction-count 1))
                (execute)))))


      (define (reset-instruction-count) 
        (set! instruction-count 0)
        (display "INSTRUCTION COUNT RESET TO 0")
        (newline))

      (define (print-instruction-count)
        (display (list "INSTRUCTION COUNT=" instruction-count ) ))

      (define (trace-on)
        (set! is-tracing #t)
        (display "TRACING TURNED ON" ))


      (define (trace-off)
        (set! is-tracing #f)
        (display "TRACING TURNED OFF" ))



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
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ((eq? message 'reset-instruction-count) reset-instruction-count)
              ((eq? message 'print-instruction-count) print-instruction-count)
              ((eq? message 'trace-on) trace-on)
              ((eq? message 'trace-off) trace-off)
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))

(define (reset-instruction-count machine) ((machine 'reset-instruction-count)))

(define (print-instruction-count machine) ((machine 'print-instruction-count)))

(define (trace-on machine) ((machine 'trace-on)))
(define (trace-off machine) ((machine 'trace-off)))

(define iter-expt-machine 
  (make-machine 
    '(n b c p) 
    (list (list '* *) (list '- -) (list '= =)) 
    '((assign p (const 1))
  (assign c (reg n))
  expt-loop
  (test (op =) (reg c) (const 0))
  (branch (label done))
  (assign p (op *) (reg p) (reg b))
  (assign c (op -) (reg c) (const 1))
  (goto (label expt-loop))
  done)))
