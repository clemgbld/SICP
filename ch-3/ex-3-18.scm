(define (last-pair x)
    (if (null? (cdr x)) x 
        (last-pair (cdr x))))

(define (make-cycle x) 
    (set-cdr! (last-pair x) x) 
        x)

(define (contains-cycle? l) 
    (define (recur lst) 
        (if (or (not (pair? l)) 
            (not (pair? (cdr lst)))) #f 
            (if (eq? (cdr lst) l)
                 #t
               (if (or   
                    (contains-cycle? (car lst)) 
                        (and (null? (cddr lst)) 
                            (contains-cycle? (cadr lst)))) 
                        #t 
                        (recur (cdr lst))))))
    (recur l))