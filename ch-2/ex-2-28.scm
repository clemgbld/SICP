(define (fringe tree)
    (if (null? tree) '() 
        (append (let ((node (car tree)))
            (cond ((not (list? node)) (list node)) 
                ((contains-list node) (fringe node))
                    (else node))) 
                        (fringe (cdr tree)))))

(define (contains-list node) 
    (cond ((null? node) #f)
                ((list? (car node)) #t)
                    (else (contains-list (cdr node)))))
                        