(load "test-manager/load.scm")
(load "ch-2/ex-2-84.scm")

(define-each-test
(check (equal? (tag-rational (make-rat 2 1)) (raise-to 'rational (tag-integer 2))) "should raise integer 1 level to rational")
(check (equal? (tag-complex (tag-rectangular (make-from-real-imag 4.0 0))) (raise-to 'complex (tag-integer 4))) "should raise a type to a target type")
)

(define-each-test 
(check (eq? 'complex (find-higher-type 'scheme-number 'complex)) "should find the higher type in the tower")
(check (eq? 'complex (find-higher-type 'complex 'scheme-number)) "should find the higher type in the tower")
)





(run-registered-tests)