(load "test-manager/load.scm")
(load "ch-1/ex-1-41.scm")


(define-each-test
 (check ( = 3 ((double inc) 1))  "should inc 2 times")
)




(run-registered-tests)