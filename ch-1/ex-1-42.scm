(load "functions/functions.scm")

(define (square-then-inc n) 
((compose square inc) n))

(define (square-then-inc-with-pipe n) 
((pipe inc square) n))

