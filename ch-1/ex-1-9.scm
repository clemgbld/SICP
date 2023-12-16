(load "functions/functions.scm")
; linear recursive process

;(+ 1 (+ 3 5 ) )
;(+ 1 ( + 1 (2 5) ))
;(+ 1 (+ 1 (+ 1 (1 5))))
;(+ 1 ( + 1 (+ 1 (+ 1 5))))
;(+ 1 ( + 1 (+ 1 6)))
;(+ 1 ( + 1 7))
;(+ 1  8)
;9
(define (+ a b)
(if (= a 0) b 
(inc (+ (dec a) b))))

; iterative process
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
;9
(define (+ a b)
(if (= a 0) b
 (+ (dec a) (inc b))))
