(load "test-manager/load.scm")
(load "ch-2/ex-2-60.scm")

(define-each-test 
(check (equal? '(1 1 2 3 4) (adjoin-set 1 '(1 2 3 4)))"should adjoin the new element to the set")
)

(define-each-test
(check (assert-false (element-of-set? 1 '())) "should not find any element in a set")
(check (assert-true (element-of-set? 2 '(2))) "should find the target in the set")
(check (assert-true (element-of-set? 2 '(1 2))) "should find the target in a set that contains multiple elements")
)

(define-each-test
(check (equal? '(1 2 3 1 2 3 4) (union-set '(1 2 3) '(1 2 3 4))) "should merge the two sets")
)

(run-registered-tests)