(load "test-manager/load.scm")
(load "ch-2/ex-2-3.scm")



(define-each-test 
(check (= 12 (area (make-rect (make-point 1 1) (make-point 5 4)) )) "should calc the area of the rectangle"))

(define-each-test 
(check (= 14 (perimeter (make-rect (make-point 1 1) (make-point 5 4)) )) "should calc the perimeter of the rectangle"))

(define-each-test 
(check (= 14 (perimeter-bis (make-rect-bis (make-point 3 2.5) (make-point 5 4)) )) "should find the perimeter of the rectangle"))

(define-each-test 
(check (= 12 (area-bis (make-rect (make-point 1 1) (make-point 5 4)) )) "should calc the area of the rectangle"))

(run-registered-tests)