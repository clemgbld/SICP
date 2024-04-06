(load "functions/streams.scm")

(define (make-pair head)
    (lambda (tail) (list head tail)))

(define (all-pairs s t) 
    (define (recur s1 s2 indexes-stream)
        (stream-append (stream-map (make-pair (stream-car s1)) (stream-take t (stream-car indexes-stream)))
            (cons-stream
                (list (stream-car s1) (stream-car s2))
                    (interleave
                        (stream-map (make-pair (stream-car s1)) (stream-cdr s2))
                        (recur (stream-cdr s1) (stream-cdr s2) (stream-cdr indexes-stream))))))
    (recur s t (integers-starting-from 0)))
