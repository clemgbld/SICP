(load "test-manager/load.scm")
(load "ch-4/ex-4-11.scm")



(define-each-test
(check (equal? '() (make-frame '() '())) "should be an empty frame")
(check (equal? (list (cons 'x 1)) (make-frame '(x) '(1))) "should be a frame of 1 element")
(check (equal? (list (cons 'x 1) (cons 'y 2) (cons 'z 3)) (make-frame '(x y z) '(1 2 3))) "should be a frame of multiple elements")
)

(define-each-test
(let ((frame (make-frame '(x y z) '(1 2 3))))
    (add-binding-to-frame! 'a 4 frame)
    (check (equal? (list (cons 'a 4) (cons 'x 1) (cons 'y 2) (cons 'z 3)) frame )) "should be able to add a binding to a frame")
)

(define-each-test
(check (equal? (cons '((a . 1) (b . 2)) (cons '((x . 3)) '())) (extend-environment '(a b) '(1 2) (cons (make-frame '(x) '(3)) '()))) "should extend the environement")
)

(define-each-test
(check (= 1 (lookup-variable-value 'a (cons '((a . 1)) '()))) "should find the expected value")
(check (= 2 (lookup-variable-value 'a (cons '((a . 2)) '()))) "should find the expected value")
(check (= 2 (lookup-variable-value 'a (cons '((b . 1) (a . 2)) '()))) "should find the expected value")
(check (= 3 (lookup-variable-value 'c (cons '((b . 1) (a . 2)) (cons '((c . 3)) '())))) "should find the expected value")
)

(define-each-test
(let ((env (cons (make-frame '(a) '(1)) '())))
    (set-variable-value! 'a 2 env)
    (check (equal? (cons '((a . 2)) '()) env)) "should be a able to set a variable on one level")

(let ((env (cons (make-frame '(a) '(1)) (cons (make-frame '(z b c) '(5 6 8)) '()))))
    (set-variable-value! 'b 10 env)
    (check (equal? (cons '((a . 1)) (cons '((z . 5) (b . 10) (c . 8)) '())) env)) "should be a able to set a variable on multiple level")
)

(define-each-test
(let ((env (cons '() '())))
    (define-variable! 'a 2 env)
    (check (equal? (cons '((a . 2)) '()) env)) "should be able to define a variable on one level")

 (let ((env (cons (make-frame '(a) '(1)) '())))
     (define-variable! 'a 10 env)
     (check (equal? (cons '((a . 10)) '()) env)) "should redefine values that are already defined")

(let ((env (cons (make-frame '(a b) '(1 2)) '())))
     (define-variable! 'b 10 env)
     (check (equal? (cons '((a . 1) (b . 10)) '()) env)) "should redefine values that are alredy defined")
)




(run-registered-tests)