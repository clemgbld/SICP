(load "test-manager/load.scm")
(load "ch-1/ex-1-12.scm")

(define-each-test
(check (= 1 (pascal 1 1)) "should be 1 for the 1th column of the 1th row")
(assert-false (pascal 3 2) "should be false when the column is above the max possible column")
(check (= 2 (pascal 2 3)) "should be 2 for the 2th column of the 3th row")
(check (= 1 (pascal 2 2)) "should be 1 for the 3th column of the 3th row")
(check (= 3 (pascal 2 4)) "should be 3 for the 2th column of the 4th row")
)



(run-registered-tests)