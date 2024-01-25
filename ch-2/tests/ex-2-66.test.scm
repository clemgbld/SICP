(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-66.scm")

(define-each-test 
(check (equal? (record 1 "A") (lookup 1 (make-tree (record 1 "A") '() '()))) "should find the item in the simplest tree possible")
(assert-false  (lookup 2 (make-tree (record 1 "A") '() '())) "should not find the item in the simplest tree possible")
(check (equal? (record 2 "B") (lookup 2 (make-tree (record 1 "A")  '() (make-tree (record 2 "B") '() '())))) "should find the item by searching to the right of the tree")
(check (equal? (record 1 "A") (lookup 1 (make-tree (record 2 "B") (make-tree (record 1 "A") '() '()) '() ))) "should find the item by searching to the left of the tree")
(check (equal? (record 1 "A") (lookup 1 (make-tree (record 4 "D") (make-tree (record 2 "B") (make-tree (record 1 "A") '() '()) '(make-tree (record 3 "C" '() '()))) (make-tree (record 5 "E") '() '()) ))) "should pass the acceptance test")
)

(run-registered-tests)