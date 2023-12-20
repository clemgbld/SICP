(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat x y) 
    (let (( g (gcd x y)) ) 
        (cons (/ x g) (/ y g))))