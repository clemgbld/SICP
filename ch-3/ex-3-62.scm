(load "functions/streams.scm")
(load "ch-3/ex-3-59.scm")
(load "ch-3/ex-3-60.scm")
(load "ch-3/ex-3-61.scm")

(define (div-series s1 s2)
    (cond ((eq? 0 (stream-car s2)) 
        (error "constant term of s2 can't be 0!"))
          (else (mul-series s1 (invert-unit-series s2)))))

(define tangent-series 
    (div-series sine-series cosine-series))