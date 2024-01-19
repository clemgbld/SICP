(load "test-manager/load.scm")
(load "ch-2/ex-2-59.scm")

(define-each-test 
(check (equal? '(1 2 3) (union-set '(1 2 3) '())) "should be set1 when set2 is empty")
(check (equal? '(1 2 3) (union-set '() '(1 2 3))) "should merge set1 with set2")
(check (equal? '(4 1 2 3 ) (union-set '(1 2 3) '(1 2 3 4))) "should merge set1 with set2 without any duplicate")
)

(run-registered-tests)