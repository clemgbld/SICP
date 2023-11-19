(define (p) (p))
(define (test x y)
 (if( = x 0) 0 y))

(test 0 (p))

; with normal order the interpreter won't evaluate the operands until it needs it so it will result to 0
; with applicative order the interpreter will hang because it will evaluate 0 to 0 and try to evaluate p wich evaluate to itself and provoke an infinite loop 
