(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-2/ex-2-32.scm")


(define-each-test
(check (deep-equal? (list '() (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3))  (subsets (list 1 2 3)))  "should find all subsets of the set")
)




(run-registered-tests)