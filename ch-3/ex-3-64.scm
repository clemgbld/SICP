(define (stream-limit s tolerance)
    (if (stream-null? s) 
        the-empty-stream
        (let ((s0 (stream-car s)))
            (cond ((stream-null? (stream-cdr s)) s0)
                ((< s0 (stream-car (stream-cdr s))) (stream-car (stream-cdr s)))
                (else (stream-limit (stream-cdr s) tolerance))))))