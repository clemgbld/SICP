
(load "test-manager/load.scm")
(load "ch-4/ex-4-7.scm")



(define-each-test
(check (equal? '(let ((x 1)) (+ x 1)) (let*->nested-lets '(let* ((x 1)) (+ x 1)))) "should transform a let* with 1 variable to a classic let")
(check (equal? (list 'let '((x 1)) (list 'let '((y 2)) '(+ x y))) (let*->nested-lets '(let* ((x 1) (y 2))  (+ x y)))) "should transform a let* into nested lets")
)




(run-registered-tests)