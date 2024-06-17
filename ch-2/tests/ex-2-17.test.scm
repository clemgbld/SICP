(load "test-manager/load.scm")
(load "ch-2/ex-2-17.scm")

(define-each-test 
(assert-false (last-pair-in-list '() ) "should be nil when there is no pair in the list")
(check (equal? '(2) (last-pair-in-list '(2) )) "should be a pair when there is one in the list")
(check  (equal? '(1) (last-pair-in-list '(1)) ) "should be nil when there is no pair in the list")
(check (equal? '(6) (last-pair-in-list '(4 5 1 6) )) "should be a pair when there are pairs in the list")) 

(run-registered-tests)