(load "test-manager/load.scm")
(load "ch-2/ex-2-28.scm")


(define-each-test
(check (equal? (list 1 2)  (fringe (list (list 1 2))))  "should be the first list")
(check (equal? (list 1 2 3 4)  (fringe (list (list 1 2) (list 3 4))))  "should flatten the list one level down")
(check (equal? (list 1 2 3 4 1 2 3 4)  (fringe (list (list (list 1 2) (list 3 4)) (list (list 1 2) (list 3 4)))))  "should flatten the list multiple levels down")
)




(run-registered-tests)