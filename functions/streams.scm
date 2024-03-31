(define (stream-enumerate-interval low high) 
    (if (> low high)
        the-empty-stream
        (cons-stream
            low
            (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
(cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter
                       pred
                       (stream-cdr stream))))
(else (stream-filter pred (stream-cdr stream)))))

(define (stream-for-each proc s) (if (stream-null? s)
'done
(begin (proc (stream-car s))
(stream-for-each proc (stream-cdr s)))))

(define (display-stream s) 
    (stream-for-each display-line s))
(define (display-line x) 
    (newline) 
    (display x))

(define (op-streams op)
    (lambda (s1 s2) (stream-map op s1 s2)))

(define mul-streams 
    (op-streams  *)) 

(define add-streams 
    (op-streams +))

(define (scale-stream stream factor)
    (stream-map (lambda (x) (* x factor)) stream))

(define (integers-starting-from n)
    (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))

(define (merge s1 s2)
    (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1) (else
            (let ((s1car (stream-car s1)) (s2car (stream-car s2)))
                (cond ((< s1car s2car) (cons-stream
                    s1car
                   (merge (stream-cdr s1) s2)))
                 ((> s1car s2car)
                  (cons-stream
                   s2car
                   (merge s1 (stream-cdr s2))))
                (else (cons-stream
                   s1car
                   (merge (stream-cdr s1)
                    (stream-cdr s2)))))))))

(define ones 
    (cons-stream 1 ones))