;a)

(define (fib n)
    (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

(define (exp item times)
    (if (= times 0) 
        1 
        (* item (exp item (- times 1)))))

(define (fib-exp n)
    (exp (fib n) n))

; this program will run much slower without memoization because it will recompute the fib operation (which is really expensive ) n number of times instead of one time 


(define count 0)

(define (id x) (set! count (+ count 1)) x)

(define (square x) (* x x)) ;;; L-Eval input:
(square (id 10))
;;; L-Eval value:
;10 for both memoize and not memoize evaluator
;;; L-Eval input:
count
;;; L-Eval value:
; count 1 for memoize evaluator and count 2 for memoized evaluator
