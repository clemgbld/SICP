(load "test-manager/load.scm")
(load "ch-4/ex-4-9.scm")



(define-each-test
(check (equal? (list 'begin (list 'define '(iter) '(cond ((not (null? nums)) (set! sum (+ sum (car nums))) (set! nums (cdr nums) ) (iter)))) '(iter)) (while->combination '(while (not (null? nums)) ((set! sum (+ sum (car nums))) (set! nums (cdr nums)))))) "should translate the while expression into a procedure")
)




(run-registered-tests)