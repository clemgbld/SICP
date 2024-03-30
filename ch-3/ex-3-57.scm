(load "functions/streams.scm")

(define fibs (cons-stream
   0
   (cons-stream 1 (add-streams (stream-cdr fibs) fibs))))

;we only do each additon once thanks to the memoization of each delay
;without this optimization we would redo all the addtion that we previously did for the fibonacci number before the nth fibonacci number that we want like in the naive implementation of the fib aligorithm with (fib n - 1 ) + (fib n - 2) 
