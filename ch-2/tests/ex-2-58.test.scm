(load "test-manager/load.scm")
(load "ch-2/ex-2-54.scm")
(load "ch-2/ex-2-58.scm")

(define-each-test 
(check (= 1 (deriv '(x + 3) 'x)) "should be able to deriv addition with two parameters in infix notation")
(check (eq? 'y (deriv '(x * y) 'x)) "should be able to deriv multiplication with two parameter in infix notation")
(check (= 4 (deriv '(x + (3 * (x + (y + 2)))) 'x)) "should deriv the expression")
(check (= 4 (deriv '(x + 3 * (x + y + 2)) 'x)) "should deriv an expression that assumes that multiplication is done first and drop unneeded parentheses")
(check (custom-equal? '((x * y) + (y * (x + 3)))  (deriv '(x * y * (x + 3)) 'x)) "should deriv a multiplication that drops unecessary parentheses")
(check (custom-equal? '((x * y) + (y * (x + 3)))  (deriv '((x * y) * (x + 3)) 'x)) "should deriv a multiplication that drops unecessary parentheses")
)

(run-registered-tests)