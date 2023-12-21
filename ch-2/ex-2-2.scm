(load "functions/functions.scm")

(define (make-point x y) (cons x y))

(define (coord-x x) (car x))

(define (coord-y x) (cdr x))

(define (make-segment x y) (cons x y))

(define (select-segment-a x) (car x))

(define (select-segment-b x) (cdr x))

(define (midpoint-segment segment) 
    (make-point 
        (average (coord-x (select-segment-a segment)) (coord-x (select-segment-b segment))) 
            (average (coord-y (select-segment-a segment)) (coord-y (select-segment-b segment))) ))