(load "test-manager/load.scm")
(load "ch-2/ex-2-35.scm")


(define-each-test
(check (= 2 (count-leaves (list 1 2))) "should count leaves")
(check (= 4 (count-leaves (list (list 1 2) 3 4))) "should count leaves")
(check (= 6 (count-leaves (list (list 1 2 (list 5 6)) 3 4))) "should count leaves")
)




(run-registered-tests)