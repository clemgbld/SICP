(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-37.scm")


(define-each-test
(check (equal? (list 13 31) (matrix-*-vector (list (list 1 2 3) (list 4 5 6)) (list 2 1 3))) "should be the product of the vector and the matrix")
)




(run-registered-tests)