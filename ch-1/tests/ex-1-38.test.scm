(load "test-manager/load.scm")
(load "ch-1/ex-1-38.scm")


(define-each-test
 (check ( = 1 (euler-expension 1))  "should be 1")
(check ( = 2 (euler-expension 2))  "should be 2")
(check ( = 1 (euler-expension 3))  "should be 1")
(check ( = 1 (euler-expension 4))  "should be 1")
(check ( = 4 (euler-expension 5))  "should be 4")
(check ( = 1 (euler-expension 6))  "should be 1")
(check ( = 1 (euler-expension 7))  "should be 1")
(check ( = 6 (euler-expension 8))  "should be 8")
(check ( = 8 (euler-expension 11))  "should be 8"))




(run-registered-tests)