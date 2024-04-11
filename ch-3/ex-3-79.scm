(load "ch-3/ex-3-77.scm")

(define (general-solve-2nd f y0 dy0 dt)
    (define y (integral (delay dy) y0 dt))
    (define dy (integral (delay ddy) dy0 dt))
    (define ddy (stream-map f dy y))
        y)