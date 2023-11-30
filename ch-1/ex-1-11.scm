(define (f n) 
(if (< n 3) n 
(+ (f (- n 1)) 
(* 2 (- n  2)) 
(* 3 (- n  3)))))