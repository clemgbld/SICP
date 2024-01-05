(define (subsets s) 
    (if (null? s)
        (list '())
            (let ((rest (subsets (cdr s))))
                (append rest 
                    (map (lambda (x)   
                        (cons (car s) x)) 
                            rest)))))

; the solution was to prepend the first item of the set "s" to each sublist "x"