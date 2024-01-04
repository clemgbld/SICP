(define (fringe tree)
    (if (null? tree) '() 
        (append (let ((node (car tree)))
            (if (pair? (car node)) (fringe node)
                node)) 
                    (fringe (cdr tree)))))