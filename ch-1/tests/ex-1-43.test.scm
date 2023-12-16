(load "test-manager/load.scm")
(load "ch-1/ex-1-43.scm")


(define-each-test
(check (= 5   ((repeated square 0) 5))  "should square zero time")
(check (= 25   ((repeated square 1) 5))  "should square 1 time")
(check (= 625   ((repeated square 2) 5))  "should square 2 times")
(check (= 390625   ((repeated square 3) 5))  "should square 3 times"))




(run-registered-tests)