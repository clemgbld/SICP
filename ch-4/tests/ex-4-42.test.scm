
(load "test-manager/load.scm")
(load "ch-4/ex-4-42.scm")


(define-each-test
(check (assert-true (is-ranking-valid? '(3 5 2 1 4)) "the ranking should be valid"))
(check (assert-false (is-ranking-valid? '(3 5 1 2 4)) "the ranking should not be valid because kitty can't be 2"))
(check (assert-false (is-ranking-valid? '(2 5 1 3 4)) "the ranking should not be valid because betty should be 3"))
(check (assert-false (is-ranking-valid? '(3 1 5 4 2)) "the ranking should not be valid because jthel can't be 1"))
(check (assert-false (is-ranking-valid? '(3 2 5 4 1)) "the ranking should not be valid because joan should be 2"))
(check (assert-false (is-ranking-valid? '(3 4 2 5 1)) "the ranking should not be valid because ethel should be 5"))
(check (assert-false (is-ranking-valid? '(3 5 2 4 1)) "the ranking should not be valid because mary should be 4"))
)

(define-each-test 
(check (equal? '(((betty 3) (ethel 5) (joan 2) (kitty 1) (mary 4))) (liars)) "should solve liars puzzle")
)


(run-registered-tests)