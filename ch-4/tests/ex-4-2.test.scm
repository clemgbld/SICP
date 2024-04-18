(load "test-manager/load.scm")
(load "ch-4/ex-4-2.scm")



(define-each-test
(assert-false (application? '(define x 3)) "definiton should not got into the compound procedure close")
(assert-true (application? '(call factorial 3)) "compound procedure should go into compound procedure close")
(assert-false (application? 3) "should be false when the procedure is not compound")
(assert-false (application? 3) "should be false when the procedure is not compound")
(assert-false (application? '(call)) "should be false when there is no symbol after call")
(assert-false (application? '(call 3 5)) "should be false when there is an element after call but it is not a symbol")
)


(define-each-test
(check (eq? 'factorial (operator '(call factorial 3))) "should extract the operator")
)

(define-each-test
(check (equal? '(3) (operands '(call factorial 3))) "should extract the operands")
)

(run-registered-tests)