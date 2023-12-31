(load "test-manager/load.scm")
(load "ch-2/ex-2-20.scm")

(define-each-test 
(check (equal? '(1) (same-parity 1)) "should be the same list")
(check (equal? '(1 3 5) (same-parity 1 3 2 4 5)) "should filter out non odd numbers when the first number is odd")
(check (equal? '(2 4 6) (same-parity 2 4 5 3 6)) "should filter out non even numbers when the first number is even")

)

(run-registered-tests)