(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-31.scm")


(define-each-test
(check (deep-equal? (list 1 (list 4 (list 9 16) 25) (list 36 49))  (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))))  "should square each item of the tree")
)




(run-registered-tests)