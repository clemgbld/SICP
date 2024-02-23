(load "ch-3/ex-3-12.scm")

(define (make-cycle x) 
    (set-cdr! (last-pair x) x) x)

(define z (make-cycle (list 'a 'b 'c)))

(last-pair z)
;infinite loop because mutating something with itself create a cyclic dependcies because 
; last pointer of x is pointed at the first pointer of x
