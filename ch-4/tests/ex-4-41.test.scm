
(load "test-manager/load.scm")
(load "ch-4/ex-4-41.scm")


(define-each-test
(check (equal? '(()) (permutations '()))"should have no permutations")
(check (equal? '((1)) (permutations '(1)))"should do the simplest permutations")
(check (equal? '((2)) (permutations '(2)))"should do the simplest permutations")
(check (equal? '((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1)) (permutations '(1 2 3)))"should a complex permutations")
)

(define-each-test
(check (assert-true (is-multiple-dwelling-valid? '(3 2 4 5 1)))"the placements should be valid")
(check (assert-false (is-multiple-dwelling-valid? '(5 1 2 3 4)))"the placements are not valid because baker can't live in the 5th floor")
(check (assert-false (is-multiple-dwelling-valid? '(2 1 5 3 4)))"the placements are not valid because cooper can't live in the 1th floor")
(check (assert-false (is-multiple-dwelling-valid? '(2 3 5 1 4)))"the placements are not valid because fletcher can't live in the 5th floor")
(check (assert-false (is-multiple-dwelling-valid? '(2 3 1 5 4)))"the placements are not valid because fletcher can't live in the 1th floor")
(check (assert-false (is-multiple-dwelling-valid? '(1 4 3 2 5)))"the placements are not valid because miller has to live on a higher floor than cooper")
(check (assert-false (is-multiple-dwelling-valid? '(1 2 4 3 5)))"the placements are not valid because smith can't be adjacent to fletcher")
(check (assert-false (is-multiple-dwelling-valid? '(1 2 4 5 3)))"the placements are not valid because smith can't be adjacent to fletcher")
(check (assert-false (is-multiple-dwelling-valid? '(4 2 3 5 1)))"the placements are not valid because fletcher can't be adjacent to cooper")
(check (assert-false (is-multiple-dwelling-valid? '(2 4 3 5 1)))"the placements are not valid because fletcher can't be adjacent to cooper")
)

(define-each-test
(check (equal? (list '((baker 3) (cooper 2) (fletcher 4) (miller 5) (smith 1))) (multiple-dwelling)) "should solve the mutiple dwelling problem")
)



(run-registered-tests)