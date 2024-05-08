(load "test-manager/load.scm")
(load "ch-4/ex-4-20.scm")

(define-each-test
(check (equal? '(let ((fact *unassigned*)) (set! fact (lambda (n) (if (= n 1) 1 (* n (fact (- n 1)))))) (fact 10)) (letrec->let '(letrec ((fact (lambda (n) (if (= n 1) 1 (* n (fact (- n 1))))))) (fact 10)))) "should be able to transform a simple letrec into it's let equivalent")
(check (equal? '(let ((fact *unassigned*) (x *unassigned*)) (set! fact (lambda (n) (if (= n 1) 1 (* n (fact (- n 1)))))) (set! x 9) (set! y (fact 10)) (+ x y)) (letrec->let '(letrec ((fact (lambda (n) (if (= n 1) 1 (* n (fact (- n 1)))))) (x 9)) (set! y (fact 10)) (+ x y)))) "should be able to transform a simple letrec into it's let equivalent")
)



(run-registered-tests)