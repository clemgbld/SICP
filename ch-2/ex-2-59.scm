(define (element-of-set? x set) 
(cond ((null? set) false)
((equal? x (car set)) true)
(else (element-of-set? x (cdr set)))))

(define (union-set set1 set2) 
    (cond 
        ((null? set2) set1) 
        ((element-of-set? (car set2) set1) (union-set set1 (cdr set2)))
        (else (cons (car set2) (union-set set1 (cdr set2))))
))