(define (euler-expensiono-alternative n) 
(cond ((< n 1) 1)
((= n 1) 1)
((= n 2) 2)
(else (let ((last (euler-expension (- n 1)))
(after-last (euler-expension (- n 2))))
(if (and (= last 1) (= after-last 1)) (+ last after-last  (euler-expension (- n 3)))
1)))))

(define (euler-expension i)
  (if (= (modulo i 3) 2)
      (* 2(/ (+ i 1) 3))
      1))

(define (count-frac n d k) 
(define (recur i) 
(if (= k i) (/ (n i) (d i) ) 
(/ (n i) (+ (d i) (recur (+ 1 i))))))
(recur 1))

(count-frac (lambda (i) 1.0)
           euler-expension
           4)



