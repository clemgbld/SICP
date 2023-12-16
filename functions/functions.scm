(define (inc n) 
(+ n 1))

(define (dec n) 
(- n 1))

(define (double n) 
(+ n n))

(define (divides? a b) (= (remainder b a) 0))

(define (identity x) x)

(define (gcd a b) (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (average a b) 
(/ (+ a b) 2))

(define (compose f g) 
(lambda (x) 
(f (g x))))

(define (pipe . fns) 
(lambda (x) 
(fold-left (lambda (acc fn) 
(fn acc)) x fns)))