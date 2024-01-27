(load "test-manager/load.scm")
(load "ch-2/ex-2-68.scm")

(define-each-test 
(check (equal? (list 0) (encode-symbol 'A (make-code-tree (make-leaf 'A 4) (make-leaf 'B 1)))) "should find be a single zero")
(check (equal? (list 1) (encode-symbol 'B (make-code-tree (make-leaf 'A 4) (make-leaf 'B 1)))) "should find be a single 1")
(check (equal? (list 0 1) (encode-symbol 'B (make-code-tree (make-code-tree (make-leaf 'A 4) (make-leaf 'B 1)) (make-leaf 'C 1)))) "should be able to navigate more complex tree and build the right list of bits")
(check (equal? (list 1 1 0) (encode-symbol 'D sample-tree)) "should pass the acceptance test")
)

(define-each-test 
(check (equal? sample-message (encode '(A D A B B C A) sample-tree)) "should encode the message")
)

(run-registered-tests)