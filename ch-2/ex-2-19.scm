(define (first-denomination coin-values) 
    (car coin-values))

(define (except-first-denomination coin-values) (cdr coin-values))

;the order of coin values does not affect the result of cc