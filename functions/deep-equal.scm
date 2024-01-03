(define (deep-equal? obj1 obj2)
  (cond
    ((and (pair? obj1) (pair? obj2))
     (and (deep-equal? (car obj1) (car obj2))
          (deep-equal? (cdr obj1) (cdr obj2))))
    ((and (null? obj1) (null? obj2)) #t)
    ((eq? obj1 obj2) #t)
    (else #f)))