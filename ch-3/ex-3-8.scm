
(define has-been-called #f)

(define (F n) 
    (if has-been-called 
        0 
        (begin (set! has-been-called #t) n)))