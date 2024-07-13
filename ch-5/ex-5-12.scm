(load "ch-5/ch5-regsim.scm")

(define (make-new-machine controller-text)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '()))
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
                ((instruction-execution-proc (car insts)))
                (execute)))))

      (define labels (filter symbol? controller-text))

      (define (remove-labels controller-text) 
          (filter (lambda (t) (not (symbol? t)) )
                  controller-text))


      (define (remove-duplicates l)
        (define  (iter l without-dup)
          (if (null? l) without-dup
            (let ((first (car l)))
              (iter 
                (cdr l) 
                (if (member first without-dup) 
                  without-dup 
                (append without-dup (list first))))))) 
        (iter l '()))


      (define instructions-without-duplicate (remove-duplicates (remove-labels controller-text)))

      (define assigns (filter (lambda (t) (eq? (car t) 'assign)) instructions-without-duplicate))

      (define branches (filter (lambda (t) (eq? (car t) 'branch)) instructions-without-duplicate))

      (define gotos (filter (lambda (t) (eq? (car t) 'goto)) instructions-without-duplicate))

      (define tests (filter (lambda (t) (eq? (car t) 'test)) instructions-without-duplicate))

      (define saves (filter (lambda (t) (eq? (car t) 'save)) instructions-without-duplicate))

      (define restores (filter (lambda (t) (eq? (car t) 'restore)) instructions-without-duplicate))




      (define all-instructions (append assigns 
                                       (append branches 
                                               (append gotos 
                                                       (append tests 
                                                               (append saves 
                                                                       (append restores labels)))))))

      (define restored-and-saved-registers (remove-duplicates (append (map cadr saves) (map cadr restores))))
                                                                                           
      (define entry-point-registers (map (lambda (g) (cadr(cadr g))) (filter (lambda (g) (eq? (car (cadr g)) 'reg)) gotos)))


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
              ((eq? message 'list-of-instructions ) all-instructions)
              ((eq? message 'restored-and-saved-registers ) restored-and-saved-registers)
              ((eq? message 'entry-point-registers ) entry-point-registers)
              ((eq? message 'register-assigned-sources ) 
                (lambda (reg-name) (filter (lambda (a)(eq? (cadr a) reg-name)) assigns)))
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))

(define (make-machine register-names ops controller-text)
  (let ((machine (make-new-machine controller-text)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    ((machine 'install-operations) ops)    
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))
(define (entry-point-registers machine) (machine 'entry-point-registers))

(define (register-assigned-sources machine reg-name) ((machine 'register-assigned-sources) reg-name))

(define (restored-and-saved-registers machine) (machine 'restored-and-saved-registers))

(define (list-of-instructions machine) (machine 'list-of-instructions))
