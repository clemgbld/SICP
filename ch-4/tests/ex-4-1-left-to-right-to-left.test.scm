(load "test-manager/load.scm")
(load "ch-4/ex-4-1-left-to-right.scm")



(define-each-test
(check (equal? '() (list-of-values '() (interaction-environment))) "should be an empty list")
(check (equal? '(1) (list-of-values '(1) (interaction-environment))) "should be able to produce a list of 1 evaluated element from left to right")
(check (equal? '(1 2) (list-of-values '(1 2) (interaction-environment))) "should be able to produce a list of multiple evaluated elements form from to right")
)


(run-registered-tests)