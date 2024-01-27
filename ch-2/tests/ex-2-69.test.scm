
(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-69.scm")

(define-each-test 
(check (deep-equal? (make-leaf 'A 1) (successive-merge (list (make-leaf 'A 1)))) "should generate the simplest huffman tree possible")
(check (equal? '() (successive-merge '())) "should be an empty tree")
(check (deep-equal? (make-code-tree (make-leaf 'A 1) (make-leaf 'B 1)) (successive-merge (list (make-leaf 'A 1) (make-leaf 'B 1)))) "should generate a two leaves huffman tree")
(check (deep-equal? (make-code-tree (make-code-tree (make-leaf 'D 1) (make-leaf 'C 1) )(make-code-tree (make-leaf 'A 4) (make-leaf 'B 2))) (successive-merge (list (make-leaf 'A 4) (make-leaf 'B 2) (make-leaf 'D 1) (make-leaf 'C 1)))) "should be able to build complex tree")
)

(run-registered-tests)