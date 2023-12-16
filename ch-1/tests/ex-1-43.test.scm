(load "test-manager/load.scm")
(load "ch-1/ex-1-43.scm")


(define-each-test
 (check ( = 1 (square-then-inc 0))  "should be 2")
  (check ( = 49 (square-then-inc 6))  "should be 49")
)




(run-registered-tests)