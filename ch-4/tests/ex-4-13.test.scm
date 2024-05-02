(load "test-manager/load.scm")
(load "ch-4/ex-4-13.scm")

(define-each-test
(let ((env (cons (make-frame '(a) '(1)) '())))
     (make-unbound! 'a env)
     (check (equal? (cons '() '()) env)) "should reset the frame when there is only one binding in it")

(let ((env (cons (make-frame '(a b c) '(1 2 3)) '())))
     (make-unbound! 'b env)
     (check (equal? (cons '((a c) . (1 3)) '()) env)) "should be able to remove a binding in a frame that has more than one variable in it")

(let ((env (cons (make-frame '(a b c) '(1 2 3)) '())))
     (make-unbound! 'a env)
     (check (equal? (cons '((b c) . (2 3)) '()) env)) "should be able to remove the first binding in a frame that has more than one variable in it")
)



(run-registered-tests)