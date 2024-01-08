(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-37.scm")


(define-each-test
(check (equal? (list 13 31) (matrix-*-vector (list (list 1 2 3) (list 4 5 6)) (list 2 1 3))) "should be the product of the vector and the matrix")
(check (deep-equal? (list (list 1 4) (list 2 5) (list 3 6)) (transpose (list (list 1 2 3) (list 4 5 6)))) "should transpose the matrix")
(check (deep-equal? (list (list 19 22) (list 43 50) ) (matrix-*-matrix (list (list 1 2) (list 3 4)) (list (list 5 6) (list 7 8)))) "should multiply the first matrix with the second matrix")
)




(run-registered-tests)