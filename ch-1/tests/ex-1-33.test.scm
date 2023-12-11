(load "test-manager/load.scm")
(load "ch-1/ex-1-33.scm")


(define-each-test
 (check ( = 208 (sum-square-of-prime-numbers-between 2 11))  "should be the sum of the prime nubmers"))

 (define-each-test
 (check ( = 304888344611713860501504000000 (factorial-of-relatively-prime-number-between -5 29))  "should be the factorial of relatively prime"))


(run-registered-tests)