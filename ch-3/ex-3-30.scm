(load "ch-3/ex-3-29.scm")

(define (half-adder a b s c)
(let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(define (full-adder a b c-in sum c-out)
(let ((s (make-wire)) (c1 (make-wire)) (c2 (make-wire)))
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok))

(define (ripple-carry-adder Ak Bk Sk c)
    (if (or (null? Ak) (null? Bk) (null? Sk)) 'ok 
        (let ((c-out (make-wire)))
            (full-adder (car Ak) (car Bk) c (car Sk) c-out)
            (ripple-carry-adder (cdr Ak) (cdr Bk) (cdr Sk) c-out))))

; ripple carry adder delay = 
;    (* (- n 1) or-gate-delay)
;    (* (+ n 1) (max or-gate-delay
;                    (+ and-gate-delay
;                       inverter-delay)))
