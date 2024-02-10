(load "test-manager/load.scm")
(load "ch-2/ex-2-85.scm")

(define-each-test
(check (equal? (tag-rational (make-rat 47 10)) (drop-type (tag-complex (tag-rectangular (make-from-real-imag 4.7 0))))) "should lower the given complex number to a real number")
(check (equal? (tag-complex (tag-rectangular (make-from-real-imag 4.2 1))) (drop-type (tag-complex (tag-rectangular (make-from-real-imag 4.2 1))))) "should not try to lower a complex number when this one has an imaginary part")
(check (equal? (tag-integer 2) (drop-type (tag-rational (make-rat 2 1)))) "should lower a rational number to an integer")
(check (equal? (tag-integer 2) (drop-type (tag-integer 2))) "should not try to lower an integer")
(check (equal? (tag-rational (make-rat 11 5)) (drop-type (tag-real 2.2))) "should lower real number as far as integer")
(check (equal? (tag-integer 2)  (drop-type (tag-complex (tag-rectangular (make-from-real-imag 2 0))))) "should lower the complex number as far as integer when the real part is an integer and the imaginary part is zero")
)

(run-registered-tests)