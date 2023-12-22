(load "test-manager/load.scm")
(load "ch-2/ex-2-4.scm")



(define-each-test 
(check (= 1 (cdr-bis (cons-bis 2 1))) "should get the second data of the pair"))




(run-registered-tests)