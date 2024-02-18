
(define x random-init)

(define (rand m) 
    (cond 
        ((eq? m 'generate ) 
            (set! x (rand-update x)) x)
        ((eq? m 'reset) (lambda (new-value) (set! x new-value)))
        (else (error "Unknown Request rand:" m))))