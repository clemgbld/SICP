; O(1)
; faster than the previous one who was O(n)
(define (adjoin-set x set) 
    (cons x set))

;O(n)
;same time complexity that the previous one but could do more iteration because of the duplicates
(define (element-of-set? target set) 
    (cond ((null? set) #f)
          ((equal? (car set) target) #t)
          (else (element-of-set? target (cdr set)))))

;O(n)
;faster than the previous one who was O(n^2)
(define (union-set set1 set2) 
    (append set1 set2))

;O(n)
;same time complexity that the previous one but could do more iteration because of the duplicates
(define (intersection-set set1 set2)
(cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
(else (intersection-set (cdr set1) set2))))

; the operations of the duplicate representation are overall faster than the non-duplicates one so for performance intensive application i would choose the duplicates one