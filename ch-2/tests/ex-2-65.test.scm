(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-65.scm")

(define-each-test 
(check (deep-equal? (make-tree 4 (make-tree 2 (make-tree 1 '() '()) (make-tree 3 '() '())) (make-tree 6 (make-tree 5 '() '()) (make-tree 10 '() '()))) (union-set-tree (make-tree 6 (make-tree 3 (make-tree 1 '() '()) '()) (make-tree 10 '() '())) (make-tree 3 (make-tree 2 (make-tree 1 '() '()) '()) (make-tree 4 '() (make-tree 5 '() '()))))) "should merge the two set together")
(check (deep-equal? (make-tree 1 '() (make-tree 3 '() '()) ) (intersection-set-tree (make-tree 6 (make-tree 3 (make-tree 1 '() '()) '()) (make-tree 10 '() '())) (make-tree 3 (make-tree 2 (make-tree 1 '() '()) '()) (make-tree 4 '() (make-tree 5 '() '()))))) "should only take the element common to the two set")
)

(run-registered-tests)