(load "test-manager/load.scm")
(load "ch-3/ex-3-55.scm")


(define-each-test
(check (= 1 (stream-ref (partial-sums integers) 0)) "should get the first element of the partials sum stream of integers")
(check (= 3 (stream-ref (partial-sums integers) 1)) "should get the second element of the partials sum stream of integers")
(check (= 6 (stream-ref (partial-sums integers) 2)) "should get the third element of the partials sum stream of integers")
(check (= 15 (stream-ref (partial-sums integers) 4)) "should get the fifth element of the partials sum stream of integers")
(check (= 21 (stream-ref (partial-sums integers) 5)) "should get the sixth element of the partials sum stream of integers")
)



(run-registered-tests)