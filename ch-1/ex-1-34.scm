;Suppose we define the procedure 
(define (f g) (g 2))
;Then we have
(f square)
;4
(f (lambda (z) (* z (+ z 1)))) 
;6
;What happens if we (perversely) ask the interpreter to eval- uate the combination (f f)? Explain.

;if we follow the substitution model
;(f f)
;(f 2)
;(2 2)
;the object 2 is not applicable (because 2 is not a procedure)
