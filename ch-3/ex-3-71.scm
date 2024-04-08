(load "functions/streams.scm")
(load "ch-3/ex-3-70.scm")

(define (weight-cube p)
    (+ (cube (car p)) (cube (cadr p))))

(define (consecutive-weight? s n weight)
    (= (weight (stream-car s)) 
            (/ (fold-right + 0 
            (stream->list (stream-map weight (stream-take s n))) ) n)))

(define (filter-by-consecutive-weight s n weight)
    (if (stream-null? s) 
        the-empty-stream
        (if (consecutive-weight? s n weight) 
         (cons-stream (stream-car s) 
        (filter-by-consecutive-weight (stream-cdr s) n weight))
        (filter-by-consecutive-weight (stream-cdr s) n weight))))

(define ramanujan-numbers 
    (stream-map weight-cube 
        (filter-by-consecutive-weight 
        (weighted-pairs integers integers weight-cube) 
        2 
        weight-cube)))