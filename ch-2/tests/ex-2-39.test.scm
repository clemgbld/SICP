(load "test-manager/load.scm")
(load "ch-2/ex-2-39.scm")


(define-each-test
(check (equal? (list 3 2 1) (reverse-fold-left (list 1 2 3))) "should reverse the list")
(check (equal? (list 3 2 1) (reverse-fold-right (list 1 2 3))) "should reverse the list")
)




(run-registered-tests)