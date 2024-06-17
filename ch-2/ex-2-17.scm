(define (last-pair-in-list l)
    (define (last-pair-iter l last)
        (if (null? l) 
            last 
            (last-pair-iter (cdr l) 
                    (list (car l))))) 
                        (last-pair-iter l #f))


