(load "test-manager/load.scm")
(load "ch-4/ex-4-31-changes.scm")

(define-each-test
(check (equal? '(a b c) (procedure-parameters (cons 'lambda (cons '(a b c) '(+ a b c))))) "should take normal parameters")
(check (equal? '(a b c) (procedure-parameters (cons 'lambda (cons '(a (b lazy-memo) (c lazy)) '(+ a b c))))) "should take normal parameters and map lazy one to normal params too")
)

(define-each-test
(check (equal? (list 'thunk '(+ 1 2) '()) (delay-it '(+ 1 2) '(a lazy) '())) "should delay normal thunk")
(check (equal? (list 'thunk-memo '(+ 1 3) '('())) (delay-it '(+ 1 3) '(a lazy-memo) '('()))) "should delay memo thunk")
)





(run-registered-tests)