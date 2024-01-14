(load "ch-2/ex-2-46.scm")

(define (make-frame origin edge1 edge2)
    (list origin edge1 edge2))

(define (make-frame-bis origin edge1 edge2)
    (cons origin (cons edge1 edge2)))

(define (origin f)
    (car f))

(define (edge1 f)
    (cadr f))

(define (edge2 f)
    (list-ref f 2))

(define (edge2-bis f)
    (cdr (cdr f)))