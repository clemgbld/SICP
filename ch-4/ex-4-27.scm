(load "ch-4/evaluator-without-memoization.scm")

; (define count 0)
; (define (id x) (set! count (+ count 1)) x)
;(define w (id (id 10)))
;;; L-Eval input:
;count
;;; L-Eval value: 
;1 (id 10) because id 10 has been called and + is a primitive procedure so it is strict that is why we still got 1 for count and not 2 because id is a coumpound procedure
;;; L-Eval input:
;w
;;; L-Eval value:
;10 
;;; L-Eval input: 
;count
;;; L-Eval value: 
;2 count is now 2 because w was needed to print its value
