(load "test-manager/load.scm")
(load "ch-2/ex-2-61.scm")

(define-each-test 
(check (equal? '(1 2 3 4) (adjoin-set  3 '(1 2 4))) "should inset a new item in the set while keeping it ordered")
(check (equal? '(1 2 3 4) (adjoin-set  3 '(1 2 3 4))) "should not insert anything when the item is already in the set")
)

(run-registered-tests)