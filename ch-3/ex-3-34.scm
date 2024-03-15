(load "functions/constraints-framework")

(define (squarer a b) 
    (multiplier a a b))

; the serious flaw about Louis reasoner code is that the squarer
; does not work in the two direction it works if you set a it will
; set the b to (square a) but if you set b it won't set a to (sqrt b)
; because in a mutltipler you need at least the product and another params of the 
;multipler to have a value