(load "ch-3/ex-3-71.scm")

(define three-square-consecutive-number-series 
    (consecutive-number-series 
        3 
        (lambda (x) (+ (square (car x)) (square (cadr x))))))

(stream->list (stream-take three-square-consecutive-number-series 5))