(load "ch-2/ex-2-46.scm")

(define (make-segment start end)
    (cons start end))

(define (start-segment s)
    (car s))

(define (end-segment s)
    (cdr s))