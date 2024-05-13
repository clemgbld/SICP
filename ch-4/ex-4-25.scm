;In an applicative order language it won't work, in fact it will run forever and cause a stack overflow because (factorial will call itself indefinetly) 

(define (unless condition usual-value exceptional-value) 
    (if condition exceptional-value usual-value))

(define (factorial n) (unless (= n 1)
          (* n (factorial (- n 1)))
          1))

(factorial 5)