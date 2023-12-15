(define (square-then-inc n) 
((compose square inc) n))

(define (square-then-inc-with-pipe n) 
((pipe inc square) n))

(define (inc n) (+ n 1))

(define (compose f g) 
(lambda (x) 
(f (g x))))

(define (pipe . fns) 
(lambda (x) 
(fold-left (lambda (acc fn) 
(fn acc)) x fns)))