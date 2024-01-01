(define (for-each proc l)
    (cond ((null? l) "done")
    (else  
        (proc (car l))
            (for-each proc (cdr l)))))

(for-each (lambda (x) (newline) (display x)) (list 1 2 3 4 5 6))