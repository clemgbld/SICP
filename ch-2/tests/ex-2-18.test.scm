(load "test-manager/load.scm")
(load "ch-2/ex-2-18.scm")

(define-each-test 
(check (equal? '() (rev '())) "should still be an empty list when there is nothing to reverse")
(check (equal? '(1) (rev '(1))) "should still be the same list when there is only one element in the list")
(check (equal? '(3 2 1) (rev '(1 2 3))) "should reverse the list")
)

(run-registered-tests)