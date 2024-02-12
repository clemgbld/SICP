;we just need to use the generic arithmetic operation instead of the integer one and thanks to that the complex number package will be able to handle real and imaginary part that are rational , real in addition to integer.
; the package will even be able to handle recursive complex number (complex number who's real part and imaginary part are complex number and so on...
 (define (sine x) (apply-generic 'sine x)) 
 (define (cosine x) (apply-generic 'cosine x)) 
  
 ;; add into scheme-number package 
 (put 'sine 'scheme-number 
      (lambda (x) (tag (sin x)))) 
 (put 'cosine 'scheme-number 
      (lambda (x) (tag (cos x)))) 
  
 ;; add into rational package 
 (put 'sine 'rational (lambda (x) (tag (sine (/ (numer x) (denom x))))))  
 (put 'cosine 'rational (lambda (x) (tag (cosine (/ (numer x) (denom x)))))) 

;; add into real package
(put 'sine 'real 
      (lambda (x) (tag (sin x)))) 
 (put 'cosine 'real 
      (lambda (x) (tag (cos x)))) 

(define (install-complex-package)
;; imported procedures from rectangular and polar packages (define (make-from-real-imag x y)
((get 'make-from-real-imag 'rectangular) x y)) 

(define (make-from-mag-ang r a)
((get 'make-from-mag-ang 'polar) r a)) ;; internal procedures
(define (add-complex z1 z2)
    (make-from-real-imag (add (real-part z1) (real-part z2))
                         (add (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
(make-from-real-imag (sub (real-part z1) (real-part z2))
(sub (imag-part z1) (imag-part z2)))) (define (mul-complex z1 z2)
    (make-from-mag-ang (mul (magnitude z1) (magnitude z2))
                       (add (angle z1) (angle z2))))
(define (div-complex z1 z2)
(make-from-mag-ang (div (magnitude z1) (magnitude z2)
(- (angle z1) (angle z2)))) ;; interface to rest of the system
(define (tag z) (attach-tag 'complex z))
(put 'add '(complex complex)
(lambda (z1 z2) (tag (add-complex z1 z2))))
(put 'sub '(complex complex)
(lambda (z1 z2) (tag (sub-complex z1 z2))))
(put 'mul '(complex complex)
(lambda (z1 z2) (tag (mul-complex z1 z2))))
(put 'div '(complex complex)
(lambda (z1 z2) (tag (div-complex z1 z2))))
(put 'make-from-real-imag 'complex
(lambda (x y) (tag (make-from-real-imag x y))))
(put 'make-from-mag-ang 'complex
(lambda (r a) (tag (make-from-mag-ang r a))))
'done)