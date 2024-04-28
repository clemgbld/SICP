(load "ch-4/ex-4-4.scm")

(define (make-lambda parameters body) 
  (cons 'lambda (cons parameters body)))

(define (make-define parameters body)
    (list 'define parameters body))

(define (make-cond clauses)
    (list 'cond clauses))

(define (make-cond-clause predicate action)
    (cons predicate action))

(define (while-predicate exp)
    (cadr exp))

(define (while-action exp)
    (cddr exp))

(define (while->combination exp)
    (list (make-lambda 
        '() 
        (make-begin 
            (list (make-define 
            '(iter) 
            (make-cond
                (make-cond-clause (while-predicate exp) 
                    (append (while-action exp) '((iter)))))) 
                '(iter))))))

;while usage:
;  (define (sum nums)
;      (define sum 0)
;      (while 
;      (not (null? nums)) 
;      (set! sum (+ sum (car nums)))
;       (set! nums (cdr nums)))
;       sum)

(define (install-while-package)

(define (eval-while exp env)
    (eval (while->combination exp) env))

((table 'insert-proc!) 
    (list 'while) 
    eval-while)
    
    'done)



; for usage:
; (define (sum n)
;     (define sum 0)
;     (for 
;         (i 1) 
;         (<= i n) 
;         (+ i 1)
;         (set! sum (+ sum i))))

(install-while-package)