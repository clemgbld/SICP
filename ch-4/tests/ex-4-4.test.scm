(load "test-manager/load.scm")
(load "ch-4/ex-4-4.scm")



(define-each-test
(assert-false  (or->if (list )) "should be false when there is no expression")
(check (equal? (list 'if '(= x 2) '(= x 2) #f) (or->if (list '(= x 2)))) "should make one if with no alternative if predicate evaluate to false")
(check (equal? (list 'if '(= x 2) '(= x 2) (list 'if '(= x 3) '(= x 3) #f)) (or->if (list '(= x 2) '(= x 3)))) "should build a nested if with all the expression")
)

(define-each-test
(assert-true  (and->if (list )) "should be true when there is no expression")
(check (equal? (list 'if '(not (= x 2))  #f '(= x 2)) (and->if (list '(= x 2)))) "should make one if with no alternative if predicate evaluate to true")
(check (equal? (list 'if '(not (= x 2)) #f (list 'if '(not (= x 3))  #f '(= x 3))) (and->if (list '(= x 2) '(= x 3)))) "should build a nested reverse if with all the expression")
)


(run-registered-tests)