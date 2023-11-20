(define (square x) 
(* x x))

(define (abs x)
(if(< x 0) 
(- x) x))

(define (average x y)
 (/ (+ x y) 2))

(define (improve-newton guess x) 
(/ (+ 
(/ x (square guess))
 (* guess 2)) 
 3))

(define (good-enough? guess x)
( < (abs (- (square guess) x) ) 0.001))


(define (sqrt-iter-newton guess x)
(if (good-enough? guess x)
guess
(sqrt-iter (improve-newton guess x) x)))


(define (sqrt-newton x)
(sqrt-iter-newton 1.0 x))






