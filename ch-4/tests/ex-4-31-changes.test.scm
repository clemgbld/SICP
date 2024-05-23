(load "test-manager/load.scm")
(load "ch-4/ex-4-31-changes.scm")

(define-each-test
(check (= 5 (definition-value '(define a 5))) "should define a simple value")
(check (= 7 (definition-value '(define b 7))) "should define a simple value")
(check (equal? '(lambda (a b) (+ a b)) (definition-value '(define (add a b) (+ a b)))) "should define a simple lambda")
(check (equal? '(lambda (b a) (- b a)) (definition-value '(define (add b a) (- b a)))) "should define a simple lambda")
)



(run-registered-tests)