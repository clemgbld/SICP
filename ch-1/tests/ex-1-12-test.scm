(load "test-manager/load.scm")
(load "ch-1/ex-1-12.scm")

(define-each-test
(check (= 1 (pascal 1 1)) "should be 1 for the 1th column of the 1th row")
(assert-false (pascal 3 2)) "should be false when the column is above the max possible column")


(run-registered-tests)