(load "test-manager/load.scm")
(load "ch-2/ex-2-5.scm")



(define-each-test 
(check (= 4 (car-int (cons-int 2 2))) "should get the first integer apply as exponent to 2")
(check (= 27 (cdr-int (cons-int 2 3))) "should get the second integer apply as exponent to 3"))




(run-registered-tests)