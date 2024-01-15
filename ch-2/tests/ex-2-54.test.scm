
(load "test-manager/load.scm")
(load "ch-2/ex-2-54.scm")

(define-each-test 
(assert-true (custom-equal? '(this is a list) '(this is a list)) "the first list should be equal to the second list")
(assert-false (custom-equal? '(those) '(this)) "the first list should not be equal to the second list")
(assert-false (custom-equal? '(this is a list) '(this (is a) list)) "the first list should not be equal to the second list")
(assert-false (custom-equal? '(this is a list) '(this is a list right?)) "should not be equal when the two list have not the same size")
(assert-false (custom-equal? '(this is a list right?) '(this is a list)) "should not be equal when the two list have not the same size")
(assert-true (custom-equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6)) "should pass the acceptance test")
(assert-false (custom-equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5 7) 6)) "should pass the acceptance test")
)

(run-registered-tests)