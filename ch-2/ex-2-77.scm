(define (apply-generic op . args)
(let ((type-tags (map type-tag args)))
(let ((proc (get op type-tags))) (if proc
          (apply proc (map contents args))
          (error      "No method for these types: APPLY-GENERIC"
            (list op type-tags))))))


(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

; apply generic is called first with the type 'complex
; the then we call the real-part procedure with the content of the complex number
; who is (cons 'rectangular content) or (cons 'polar content) who then call again the apply-generic
; procedure and retrieve the real-part of the rectangular or polar package to give the real-part of the complex number
; thus the procedure apply-generic is call two times one time to retrive the generic real part and another time to retrieve
; the specific real-part from the reactangular or polar package



