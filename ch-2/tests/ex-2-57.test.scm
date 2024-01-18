
(load "test-manager/load.scm")
(load "ch-2/ex-2-54.scm")
(load "ch-2/ex-2-57.scm")

(define-each-test 
(check (custom-equal? '(+ y (+ y (+ y y)))  (deriv '(+ (* x y) (* x y) (* x y) (* x y) ) 'x)) "should deriv addition with more than two parameters")
(check (custom-equal? '(+ (* x y) (* y (+ x 3))) (deriv '(* x y (+ x 3)) 'x)) "should deriv multiplication with more than two parameters")
)

(run-registered-tests)