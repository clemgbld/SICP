(load "test-manager/load.scm")
(load "ch-3/ex-3-56.scm")


(define-each-test
(check (= 1 (stream-ref S 0))"the first element of the stream should be 1")
(check (= 2 (stream-ref S 1))"the second element of the stream should be the first element of a stream of powers of 2")
(check (= 3 (stream-ref S 2))"the third element of the stream should be the first element of a stream of powers of 3")
(check (= 5 (stream-ref S 4))"the fourth element of the stream should be the first element of a stream of powers of 5")
)



(run-registered-tests)