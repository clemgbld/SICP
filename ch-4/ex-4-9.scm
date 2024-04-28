(load "ch-4/ex-4-4.scm")

(define (make-define parameters body)
    (list 'define parameters body))

(define (make-cond clauses)
    (list 'cond clauses))

(define (make-cond-clause predicate action)
    (cons predicate action))

(define (while-predicate exp)
    (cadr exp))

(define (while-action exp)
    (caddr exp))

(define (while->combination exp)
    (make-begin 
        (list (make-define 
        '(iter) 
        (make-cond
            (make-cond-clause (while-predicate exp) 
                (append (while-action exp) '((iter)))))) 
            '(iter))))

; (define (sum nums)
;     (define sum 0)
;     (while 
;     (not (null? nums)) 
;     ((set! sum (+ sum (car nums)))
;      (set! nums (cdr nums)))))

(define (install-while-package)

(define (eval-while exp env)
    (eval (while->combination exp) env))

((table 'insert-proc!) 
    (list 'while) 
    eval-while)
    
    'done)

(install-while-package)