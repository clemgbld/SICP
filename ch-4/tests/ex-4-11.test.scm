(load "test-manager/load.scm")
(load "ch-4/ex-4-11.scm")



(define-each-test
(check (equal? '() (make-frame '() '())) "should be an empty frame")
(check (equal? (list (cons 'x 1)) (make-frame '(x) '(1))) "should be a frame of 1 element")
(check (equal? (list (cons 'x 1) (cons 'y 2) (cons 'z 3)) (make-frame '(x y z) '(1 2 3))) "should be a frame of multiple elements")
)




(run-registered-tests)