
(load "test-manager/load.scm")
(load "ch-2/ex-2-83.scm")

(define-each-test 
(check (equal? (tag-rational (make-rat 5 1)) (raise-type (tag-integer 5))) "should raise integer to rational")
(check (equal? (tag-real 0.6) (raise-type (tag-rational (make-rat 3 5)))) "should raise rational to a real number")
(check (equal? (tag-complex (tag-rectangular (make-from-real-imag 4.2 0))) (raise-type (tag-real 4.2))) "should raise real number to complex number")
(check (equal? (tag-complex (tag-rectangular (make-from-real-imag 4 5))) (raise-type (tag-complex (tag-rectangular (make-from-real-imag 4 5))))) "should stay the same when is complex number")
)



(run-registered-tests)