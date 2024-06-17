(define (last-pair-in-list l)
    (define (last-pair-iter l last)
        (if (null? l) 
            (if last 
                (list last) 
                #f) 
            (last-pair-iter (cdr l) 
                    (if (even? (car l)) 
                            (car l) 
                                last)))) 
                                    (last-pair-iter l #f))


