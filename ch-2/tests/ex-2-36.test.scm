(load "test-manager/load.scm")
(load "ch-2/ex-2-36.scm")


(define-each-test
(check (equal? (list 22 26 30) (accumulate-n + 0 (list (list  1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))) "should make a new list with each element accumulated to together at each index")
)




(run-registered-tests)