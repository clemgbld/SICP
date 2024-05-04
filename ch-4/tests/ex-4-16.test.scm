(load "test-manager/load.scm")
(load "ch-4/ex-4-16.scm")

(define-each-test
(check (equal? '(* x x) (scan-out-defines '(* x x) )) "the body should stay the same when there is no define to scan out")
(check (equal? '(+ x y) (scan-out-defines '(+ x y) )) "the body should stay the same when there is no define to scan out")
(check (equal? '((set! x 0) x) (scan-out-defines '((set! x 0) x) )) "the body should stay the same when there is no define to scan out")
(check (equal? '(let ((x *unassigned*)) (set! x 1) (+ x x)) (scan-out-defines '((define x 1) (+ x x)) )) "should scan out a define")
(check (equal? '(let ((y *unassigned*)) (set! y 2) (+ y y)) (scan-out-defines '((define y 2) (+ y y)) )) "should scan out a define")
(check (equal? '(let ((double *unassigned*)) (set! double (lambda (x) (* 2 x))) (double y)) (scan-out-defines '((define (double x) (* 2 x)) (double y)) )) "should scan out a define and transform define body into a lambda")
(check (equal? '(let ((square *unassigned*)) (set! square (lambda (x) (* x x))) (square y)) (scan-out-defines '((define (square x) (* x x)) (square y)) )) "should scan out a define and transform define body into a lambda")
)



(run-registered-tests)