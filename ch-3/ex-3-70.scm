(load "functions/streams.scm")

(define (weighted-pairs s t weight)
    (cons-stream 
        (list (stream-car s) (stream-car t)) 
        (merge-weighted 
            (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
            (weighted-pairs (stream-cdr s) (stream-cdr t) weight)
            weight)))

(define ordered-pairs (weighted-pairs integers integers (lambda (x) (+ (car x) (cadr x)))))

(define (is-not-divisible divided divisor)
    (not (= (remainder divided divisor) 0)))


(define stream-b (stream-filter 
    (lambda (x) (let ((i (car x)) (j (cadr x)))
        (and (is-not-divisible i 2) 
             (is-not-divisible j 2)
             (is-not-divisible i 3)
             (is-not-divisible j 3)
             (is-not-divisible i 5)
             (is-not-divisible j 5))))
    (weighted-pairs integers integers (lambda (x) (+ (* 2 (car x)) (* 3 (cadr x)) (* 5 (car x) (cadr x)))))))