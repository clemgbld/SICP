(load "ch-2/ex-2-83")

(define (project-complex x) 
    (tag-real (real x)))

(define (project-rational x)
    (tag-integer (numer (contents x))))

(define (project-integer x)
 (raise-type x))

 (define (project-real x)  
        (if (integer? (contents x)) 
            (tag-rational (make-rat (contents x) 1)) 
            (let ((rat (rationalize  
                     (inexact->exact (contents x)) 1/100))) 
          (tag-rational (make-rat 
            (numerator rat) 
            (denominator rat))))))

(define (project x)
 (cond ((is-complex? x) (project-complex x))
        ((is-real? x) (project-real x))
        ((is-rational? x) (project-rational x))
        (else (project-integer x))))

(define (drop-type x)
    (let ((dropped (project x)))
        (if (equal? x (raise-type dropped)) 
               (drop-type dropped) 
                x)))

(define (install-package-scheme-number)
    (put 'project '(scheme-number) project-integer)'done)

(define (install-package-rational)
    (put 'project '(rational) project-rational)'done)

(define (install-package-real)
    (put 'project '(real) project-real)'done)

(define (install-package-complex)
    (put 'project '(complex) project-complex)'done)

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags))) 
    (if proc
(drop (apply proc (map contents args))) 
(if (= (length args) 2)
(let ((type1 (car type-tags)) 
(type2 (cadr type-tags)) (a1 (car args))
(a2 (cadr args)))
(let 
((higher-type (find-higher-type type1 type2)))
(cond ((eq? type1 type2) (error "No method for these types" (list op type-tags))) 
    ((eq? higher-type type1) (apply-generic op a1 (raise-to type1 a2)))
    ((eq? higher-type type2) (apply-generic op (raise-to type2 a1) a2))
(else (error "No method for these types" (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags)))))))