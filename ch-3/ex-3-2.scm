(define (make-monitored proc) 
   (define count  0)
   (define (inner . args) 
    (cond 
        ((and (not (null? args)) (eq? (car args) 'how-many-calls?)) count) 
        ((and (not (null? args)) (eq? (car args) 'reset-count)) (set! count 0)) 
        (else (set! count (+ count 1)) 
            (apply proc args))))
                inner)