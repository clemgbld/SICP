(load "functions/functions.scm")
(load "functions/rational-numbers.scm")


(define (make-rat x y) 
    (let (( g (gcd x y)) ) 
        (cons (/ x g) (/ y g))))