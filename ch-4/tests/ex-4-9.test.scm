(load "test-manager/load.scm")
(load "ch-4/ex-4-9.scm")



(define-each-test
(check (equal? (list (cons 'lambda (cons '() (list 'begin (list 'define '(iter) '(cond ((not (null? nums)) (set! sum (+ sum (car nums))) (set! nums (cdr nums) ) (iter)))) '(iter))) )) (while->combination '(while (not (null? nums)) (set! sum (+ sum (car nums))) (set! nums (cdr nums))))) "should translate the while expression into a procedure")
;(check (equal? (list (cons 'lambda (cons '() '()))) (for->combination'(for (i 1) (<= i n) (+ i 1) ()))) "should translate the for expression into a procedure")
)




(run-registered-tests)