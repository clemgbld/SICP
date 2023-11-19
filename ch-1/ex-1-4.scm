(define (a-plus-abs-b a b)
 ((if (> b 0) + -) a b))

; if b is above 0 is will be a + b
; else a - b
