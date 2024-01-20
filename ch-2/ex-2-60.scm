
; O(1)
(define (adjoin-set x set) 
    (cons x set))

;O(n)
(define (element-of-set? target set) 
    (cond ((null? set) #f)
          ((= (car set) target) #t)
          (else (element-of-set? target (cdr set)))))

;O(n)
(define (union-set set1 set2) 
    (append set1 set2))