
(load "test-manager/load.scm")
(load "ch-4/ex-4-1-right-to-left.scm")



(define-each-test
(check (equal? '() (list-of-values '() (interaction-environment))) "should be an empty list")
(check (equal? '(1) (list-of-values '(1) (interaction-environment))) "should be able to produce a list of 1 evaluated element from left to right")
(check (equal? '(2 1) (list-of-values '(1 2) (interaction-environment))) "should be able to produce a list of multiple evaluated elements form from to right")
(check (equal? '(3 2 1) (list-of-values '(1 2 3) (interaction-environment))) "should pass the acceptance test")
)


(run-registered-tests)