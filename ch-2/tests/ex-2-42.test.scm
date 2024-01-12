
(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-42.scm")


(define-each-test
(check (deep-equal? (list (cons 1 1) (cons 1 2)) (adjoin-position 1 2 (list (cons 1 1) )) ) "should add a new position to the end of an already existing list of positions"))

(define-each-test 
(assert-true (safe? 1 (list  (queen 1 1))) "should be safe when there is only one queen")
(assert-false (safe? 2 (list (queen 1 1) (queen 1 2))) "should not be safe when the first queen is on the same column than the last queen")
(assert-true (safe? 3 (list (queen 4 1) (queen 2 2) (queen 8 3))) "should not be safe when no queen attack each other")
(assert-false (safe? 2 (list (queen 1 1) (queen 2 2))) "should not be safe when two queens attacked each other on diagonal right")
(assert-false (safe? 2 (list (queen 2 1) (queen 1 2))) "should not be safe when two queens attacked each other on diagonal left"))

(define-each-test
(check (= 92 (length (queens 8))) "should generate 92 solutions to the eight queens problem for 8 * 8 board"))




(run-registered-tests)