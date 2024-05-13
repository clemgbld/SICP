(load "test-manager/load.scm")
(load "ch-4/ex-4-26.scm")

(define-each-test
(check (equal? '(if (= x 0) 0 (/ y x)) (unless->if '(unless (= x 0) (/ y x) 0))) "should transform unless in if")
(check (equal? '(if (= x 0) #f (/ y x)) (unless->if '(unless (= x 0) (/ y x)))) "should default null consequent to false")
)



(run-registered-tests)