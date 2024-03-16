(load "functions/constraints-framework")

(define (c+ a b)
    (let ((z (make-connector)))
        (adder a b z)
        z))

(define (c- a b)
    (let ((z (make-connector)))
        (adder b z a)
        z))

(define (c* a b)
    (let ((z (make-connector)))
        (multiplier a b z)
        z))

(define (c/ a b)
    (let ((z (make-connector)))
        (multiplier b z a)
        z))

(define (cv value)
    (let ((z (make-connector)))
        (constant value z)
        z))

(define (celsius-fahrenheit-converter x) 
    (c+ (c* (c/ (cv 9) (cv 5)) x) (cv 32)))