(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-27.scm")

(define-each-test 
(check (deep-equal? '(6 5 4 3 2 1) (deep-reverse (list 1 2 3 4 5 6))) "should reverse a simple list")
(check (deep-equal? (list (list 4 3) (list 2 1)) (deep-reverse (list (list 1 2) (list 3 4)))) "should reverse a deep list")
)

(run-registered-tests)