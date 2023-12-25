(load "test-manager/load.scm")
(load "ch-2/ex-2-13.scm")

(define (round-to-nearest-decimal num)
  (/ (round (* num 0.01)) 0.01))

(define-each-test 
(check (= (round-to-nearest-decimal (percent (mul-interval (make-center-percent 3 0.15) (make-center-percent 4 0.2)))) (round-to-nearest-decimal (product-percent (make-center-percent 3 0.15) (make-center-percent 4 0.2)))) "should find the percent of the product of two interval without doing the product operation"))

(run-registered-tests)