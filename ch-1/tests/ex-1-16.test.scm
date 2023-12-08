(load "test-manager/load.scm")
(load "ch-1/ex-1-16.scm")

(define-each-test
(check (= 2 (fast-expt 2 1)) "should be the first arg of the exponent when the second arg is one")
(check (= 4 (fast-expt 2 2)) "2 exponent 2 should be 4")
(check (= 8 (fast-expt 2 3)) "2 exponent 3 should be 8")
(check (= 3125 (fast-expt 5 5)) "with impair exponent")
(check (=  256 (fast-expt 4 4)) "4 exponent 4 should be 256")
(check (= 46656 (fast-expt 6 6)) "acceptance test")
)


(run-registered-tests)