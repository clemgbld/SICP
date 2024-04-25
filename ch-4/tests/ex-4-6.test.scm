(load "test-manager/load.scm")
(load "ch-4/ex-4-6.scm")



(define-each-test
(check (equal? (list (cons 'lambda (cons '(x) '(+ x 1))) '(1)) (let->combination '(let((x 1)) (+ x 1)))) "should transform a let with 1 expression to a self executing lambda")
(check (equal? (list (cons 'lambda (cons '(x y) '(+ x y))) '(1 2)) (let->combination '( let ((x 1) (y 2)) (+ x y)))) "should transform a let with multiple expresssion to a self executing lambda")
)




(run-registered-tests)