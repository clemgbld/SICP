(define (f n) 
(if (< n 3) n 
(+ (f (- n 1)) 
(* 2 (f (- n  2))) 
(* 3 (f (- n  3))))))


(define (f-bis n) 
 (if (< n 3) n 
 (f-iter 0 1 2 n)))

(define (f-iter third second last count)
(if (= count 2) last 
(f-iter second last 
(+ last (* 2 second) (* 3 third)) 
(- count 1))))

