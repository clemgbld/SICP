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

