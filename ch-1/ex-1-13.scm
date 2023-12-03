(load "ch-1/ex-1-7.scm")

(define (fib n) 
(cond ((= n 0) 0) 
((= n 1) 1)
(else (+ (fib (- n 1)) (fib (- n 2))))))

(define phi 
(/ (+ 1 
(sqrt 5))
 2))

(define psi 
(/ 
(- 1 
(sqrt 5))
 2))

(define (golden-ratio n) 
(floor (/ (- (expt phi n) (expt psi n)) (sqrt 5))))



(= (fib 12) (golden-ratio 12))