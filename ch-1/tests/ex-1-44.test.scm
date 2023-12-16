(load "test-manager/load.scm")
(load "ch-1/ex-1-44.scm")


(define-each-test
(check (= 25.000000666666665  ((smooth square) 5))  "should smooth square one time")
(check (= 25.00000133333333  ((smooth-nth square 2) 5))  "should smooth square two times")
)




(run-registered-tests)