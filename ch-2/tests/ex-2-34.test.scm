(load "test-manager/load.scm")
(load "ch-2/ex-2-34.scm")


(define-each-test
(check (= 79 (horner-eval 2 (list 1 3 0 5 0 1))) "should evaluate the polynomial in x for the given sequence")
)




(run-registered-tests)