(load "test-manager/load.scm")
(load "ch-4/ex-4-9.scm")



(define-each-test
(check (equal? (list (cons 'lambda (cons '() (list 'begin (list 'define '(iter) '(cond ((not (null? nums)) (set! sum (+ sum (car nums))) (set! nums (cdr nums) ) (iter)))) '(iter))) )) (while->combination '(while (not (null? nums)) (set! sum (+ sum (car nums))) (set! nums (cdr nums))))) "should translate the while expression into a procedure")
(check (equal? (list (cons 'lambda (cons '() (cons 'begin '((define i 1) (define (iter) (cond ((<= i n) (set! sum (+ sum i)) (set! i (+ i 1)) (iter)))) (iter)))))) (for->combination'(for (define i 1) (<= i n) (set! i (+ i 1)) (set! sum (+ sum i)) ))) "should translate the for expression into a procedure")
)




(run-registered-tests)