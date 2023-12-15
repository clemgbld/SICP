(define (double fn) 
(lambda (n) (fn (fn n))))


(define (inc n) (+ n 1))

(((double (double double)) inc) 5)

;(((double (double double)) f) x) → (((double double) ((double double) f)) x)
;                                 → (((double double) (double (double f))) x)
;                                 → (((double (double (double (double f))))) x)
 
;inc will be applied 16 times 

;2 * 2 * 2 * 2 = 16

;21
 
