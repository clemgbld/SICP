(define (miller-rabin-test? n) (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times) (cond ((= times 0) true)
((miller-rabin-test? n) (fast-prime? n (- times 1))) 
(else false)))

(define (expmod base exp m) 
   (cond ((= exp 0) 1) 
         ((even? exp) 
          (let ((x (expmod base (/ exp 2) m))) 
            (if (non-trivial-sqrt? x m) 0 (remainder (square x) m)))) 
         (else 
          (remainder (* base (expmod base (- exp 1) m)) 
                     m)))) 
  
 (define (non-trivial-sqrt? n m) 
   (cond ((= n 1) false) 
         ((= n (- m 1)) false) 
         (else (= (remainder (square n) m) 1)))) 
  