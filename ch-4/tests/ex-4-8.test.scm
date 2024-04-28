(load "test-manager/load.scm")
(load "ch-4/ex-4-8.scm")



(define-each-test
(check (equal? (list (cons 'lambda (cons '(x) '(+ x 1))) '(1)) (let->combination '(let((x 1)) (+ x 1)))) "should transform a let with 1 expression to a self executing lambda")
(check (equal? (list (cons 'lambda (cons '(x y) '(+ x y))) '(1 2)) (let->combination '( let ((x 1) (y 2)) (+ x y)))) "should transform a let with multiple expresssion to a self executing lambda")
(check (equal? (list 'begin (list 'define '(fn) '(+ 1 2)) '(fn)) (let->combination '(let fn () (+ 1 2)))) "should transform a named let into a defined procedure without parameters")
(check (equal? (list 'begin (list 'define '(fib-iter a b count) '(if (= count 0) b (fib-iter (+ a b) a (- count 1)))) '(fib-iter 1 0 5)) (let->combination '(let fib-iter ((a 1) (b 0) (count 5)) (if (= count 0) b (fib-iter (+ a b) a (- count 1)))))) "should transform a named let into a defined procedure with parameters")
)




(run-registered-tests)