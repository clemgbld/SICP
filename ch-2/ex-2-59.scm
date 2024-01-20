(define (element-of-set? x set) 
(cond ((null? set) false)
((equal? x (car set)) true)
(else (element-of-set? x (cdr set)))))

(define (union-set set1 set2) 
    (fold-right 
        (lambda (curr acc) 
            (if (element-of-set? curr set1) acc 
                (cons curr acc))) set1 set2))