(load "ch-2/ex-2-46.scm")

(define (make-segment start end)
    (cons (make-vect 0 start) (make-vect 0 end)))

(define (start-segment s)
    (car s))

(define (end-segment s)
    (cdr s))