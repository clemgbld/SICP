(define (tan-cf-without-reusing-count-frac x k) 
(define (recur i) 
(if (= i k) (square x) 
(/ (square x) ( - (+ (odd-growth i)) (recur (+ i 1))))))
(recur 1))

(define (count-frac n d k) 
(define (recur i) 
(if (= k i) (/ (n i) (d i) ) 
(/ (n i) (+ (d i) (recur (+ 1 i))))))
(recur 1))


(define (tan-cf x k) 
(count-frac 
(lambda (i) (if (= i 1) x (* x x -1)))
odd-growth k))

(define (odd-growth x) 
(+ x ( - x 1)))

(tan-cf 1.0 8.0)




