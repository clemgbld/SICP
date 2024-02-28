(define (count-pairs x) 
   (let ((already-counted '()))
        (define (recur x) 
            (cond ((or (not (pair? x)) (memq x already-counted ))
                0)
                (else
                    (set! already-counted (cons x already-counted))
                    (+ (recur (car x)) 
                        (recur (cdr x)) 
                            1))))
    (recur x)) )