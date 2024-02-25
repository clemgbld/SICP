(define (count-pairs x) 

    (define (has-already-been-counted? l target) 
        (if (null? l) #f 
            (if (eq? target (car l)) #t 
                (has-already-been-counted? (cdr l) target))))

    (define already-counted '())

    (define (recur x) 
        (if 
            (not (pair? x)) 0 
                (cond ((has-already-been-counted? already-counted x)
                (+ (recur (car x)) (recur (cdr x))))
                (else
                    (set! already-counted (cons x already-counted))
                    (+ (recur (car x)) 
                        (recur (cdr x)) 
                            1)))))
    (recur x))