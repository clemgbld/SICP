(define (rand requests rand-init rand-update)
    (define (next request n)
        (cond ((eq? 'generate (car  request)) (rand-update n))
            ((eq? 'reset (car request) ) (cadr request))
            (else (error "Wrong request: " request))))
    (define random-numbers 
        (if (stream-null? requests)
            the-empty-stream
            (cons-stream 
                (next (stream-car requests) rand-init) 
                (stream-map  
                    next 
                    (stream-cdr requests) 
                    random-numbers))))
    random-numbers)
