(load "ch-1/ex-1-43.scm")

(define dx 0.001)

(define (smooth f) 
    (lambda (x) (average 
        (f (+ x dx)) 
            (f x) 
                (f (- x dx)))))

(define (smooth-nth f n) 
    ((repeated smooth n) f))




