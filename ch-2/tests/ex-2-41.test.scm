(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-41.scm")


(define-each-test
(check (deep-equal? (list (list 5 3 2) (list 5 4 1)) (triples-that-match-sum 5 10)) "should find all ordered triples that match the desired sum")
)




(run-registered-tests)