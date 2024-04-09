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

(define (consecutive-number-series n weight)
    (stream-map weight 
        (filter-by-consecutive-weight 
        (weighted-pairs integers integers weight) 
        n 
        weight)))

(define ramanujan-numbers 
    (consecutive-number-series 2 weight-cube))