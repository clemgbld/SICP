(define (make-frame variables values)
    (if (null? variables) 
        '()
        (cons 
            (cons (car variables) (car values)) 
            (make-frame (cdr variables) (cdr values)))))