(load "test-manager/load.scm")
(load "ch-4/ex-4-10.scm")



(define-each-test
(assert-false (tagged-list? 1 'if) "should be false when not a pair") 
(assert-true (tagged-list? '(display) 'display) "should be able to find the tag when there is only the tag")
(assert-true (tagged-list? '((= x 1) 2 3 if) 'if) "should be able to find the tag when there is only the tag")
)




(run-registered-tests)