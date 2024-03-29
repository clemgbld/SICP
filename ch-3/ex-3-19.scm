(define (constains-cycle? x) 
    (define (safe-cdr l)
        (if (pair? l) (cdr l) 
            '()))

 (define (iter a b) 
     (cond ((not (pair? a)) #f) 
           ((not (pair? b)) #f) 
           ((eq? a b) #t) 
           ((eq? a (safe-cdr b)) #t) 
           (else (iter (safe-cdr a) (safe-cdr (safe-cdr b)))))) 

    (iter (safe-cdr x) (safe-cdr (safe-cdr x))))