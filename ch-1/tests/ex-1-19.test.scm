(load "test-manager/load.scm")
(load "ch-1/ex-1-19.scm")

(define-each-test
(check (= 0 (fib 0)) "fib 0 should 1")
(check (= 1 (fib 1)) "fib 1 should 1")
(check (= 5 (fib 5)) "fib 5 should 5")
(check (= 13 (fib 7)) "fib 7 should 13")
(check (= 1597 (fib 17)) "fib 17 should 1597")

)

(run-registered-tests)