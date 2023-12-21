(load "functions/functions.scm")

(define (make-point x y) (cons x y))

(define (coord-x x) (car x))

(define (coord-y x) (cdr x))

(define (midpoint-segment a b) 
    (make-point 
        (average (coord-x a) (coord-x b)) 
            (average (coord-y a) (coord-y b))))