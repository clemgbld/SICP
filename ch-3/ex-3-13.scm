(load "ch-3/ex-3-12.scm")

(define (make-cycle x) 
    (set-cdr! (last-pair x) x) x)

(define z (make-cycle (list 'a 'b 'c)))

(last-pair z)
;infinite loop because mutating the last pair of a list with itself create a cyclic dependcy because 
; last pointer of the last pair of the list is pointed at the first pointer of the first pair of the list 
