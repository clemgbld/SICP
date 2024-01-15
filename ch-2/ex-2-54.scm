(define (custom-equal? a-list another-list)
    (cond 
    ((and (null? a-list) (not (null? another-list))) #f)
    ((and (null? another-list) (not (null? a-list))) #f)
    ((null? a-list) #t)
    ((and (pair? (car a-list)) (pair? (car another-list))) (custom-equal? (car a-list) (car another-list)))
            ((not (eq? (car a-list) (car another-list))) #f)
            (else (custom-equal? (cdr a-list) (cdr another-list)))))