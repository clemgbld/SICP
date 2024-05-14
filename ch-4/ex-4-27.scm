; (define count 0)
; (define (id x) (set! count (+ count 1)) x)
;(define w (id (id 10)))
;;; L-Eval input:
;count
;;; L-Eval value: 
;0 count is still zero because the (set! count has not been applied yet)
;;; L-Eval input:
;w
;;; L-Eval value:
;10 id has been applied twice with 10 so the first time it returned 11 and the second time 12
;;; L-Eval input: 
;count
;;; L-Eval value: 
;2 count is now 12 because w was needed to print its value
