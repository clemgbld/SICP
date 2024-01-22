(load "test-manager/load.scm")
(load "ch-2/ex-2-62.scm")

(define-each-test 
(check (equal? '(1 2 3 4) (union-set '(1 2 3 4) '())) "should result to the set 1 when the set 2 is empty")
(check (equal? '(1 2 3 4) (union-set '() '(1 2 3 4))) "should result to the set 2 when the set 1 is empty")
(check (equal? '(1 2 3 4) (union-set '(1 2 3 4) '(1 2 3 4))) "should be the same than either of one of the set when the two set or equal")
(check (equal? '(1 2 3 4 5) (union-set '(1 2 3 4) '(1 2 3 5))) "should merge the two set together")
(check (equal? '(1 2 3 4 5) (union-set '(1 2 3 5) '(1 2 3 4 5))) "should merge the two set together")
(check (equal? '(1 2 3 4 5 6 10) (union-set '(1 3 6 10) '(1 2 3 4 5))) "should pass the acceptance test")
)

(run-registered-tests)