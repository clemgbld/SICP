(load "ch-5/ch5-regsim.scm")
(load "ch-2/ex-2-28.scm")

(define (make-machine ops controller-text)
  (let ((machine (make-new-machine controller-text)))
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

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

    (define assigns (filter (lambda (t) (and (pair? t) (eq? (car t) 'assign))) controller-text))



      (define (get-register-names controller-text)
        (if (null? controller-text) '() (let ((first (car controller-text)))
          (if (pair? first) 
            (cons (map cadr (filter (lambda (c) (and (pair? c) (eq? (car c) 'reg ) ) ) first)) (get-register-names (cdr controller-text) ))
          (get-register-names (cdr controller-text))
          ))))


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

      (define reg-names (remove-duplicates (append (map cadr assigns) (fringe (get-register-names controller-text)))) )

      (for-each (lambda (r) (allocate-register r)) reg-names)


      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents! pc the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq) (set! the-instruction-sequence seq)))
              ((eq? message 'get-register) lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops) (set! the-ops (append the-ops ops))))
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ((eq? message 'reg-names) reg-names)
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))
