(load "functions/functions.scm")

(define (attach-tag type-tag contents) 
        (cons type-tag contents))


(define (type-tag datum) 
(cond 
((pair? datum) (car datum))
(else (error "Bad tagged datum: TYPE-TAG" datum)))) 


(define (contents datum)
(cond 
((pair? datum) (cdr datum))
(else (error "Bad tagged datum: CONTENTS" datum))))


(define (tag-integer x) (attach-tag 'scheme-number x))


(define (tag-real x) (attach-tag 'real x))

(define (tag-rational x) (attach-tag 'rational x))

(define (numer r) (car r))

(define (denom r) (cdr r))

(define (make-rat n d)
(let ((g (gcd n d)))
(cons (/ n g) (/ d g))))

(define (is-rational? t) 
    (eq? (type-tag t) 'rational))

(define (is-integer? t)
    (eq? (type-tag t) 'scheme-number))

(define (is-real? t) 
    (eq? (type-tag t) 'real))

(define (tag-rectangular x) (attach-tag 'rectangular x))

(define (tag-complex x) (attach-tag 'complex x))

(define (make-from-real-imag x y) (cons x y))

(define (raise-int int) 
    (tag-rational (make-rat (contents int) 1)))

(define (raise-rational r) 
    (let ((content (contents r)))
        (tag-real (* 1.0 (/ (numer content) (denom content))))))

(define (raise-real r)
    (let ((content (contents r)))
    (tag-complex (tag-rectangular (make-from-real-imag content 0)))))

(define (install-package-scheme-number)
    (put 'raise '(scheme-number) raise-int)'done)

(define (install-package-rational)
    (put 'raise '(rational) raise-rational)'done)

(define (install-package-real)
    (put 'raise '(real) raise-real)'done)

(define (install-package-complex)
    (put 'raise '(complex) (lambda (x) x))'done)

(define (raise-type t) 
    (cond ((is-integer? t) (raise-int t))
            ((is-rational? t) (raise-rational t))
            ((is-real? t) (raise-real t))
            (else t)))

(define (raise x) (apply-generic 'raise x))


