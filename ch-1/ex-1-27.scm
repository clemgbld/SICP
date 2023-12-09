(define (prime? n) 
(define (try-it a) 
(cond ((= a 1) #t) 
((not (= ( expmod a n n) a)) #f)
(else (try-it (- a 1)))))
(try-it (- n 1)))


(define (expmod base exp m) (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
m)) 
(else(remainder(* base (expmod base (- exp 1) m))
          m))))

(fermat-test? 15)

