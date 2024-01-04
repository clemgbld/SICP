(load "test-manager/load.scm")
(load "ch-2/ex-2-28.scm")


(define-each-test
(check (equal? (list 1 2)  (fringe (list (list 1 2))))  "should be the first list")
(check (equal? (list 1 2 3 4)  (fringe (list (list 1 2) (list 3 4))))  "should flatten the list one level down")
(check (equal? (list 1 2 3 4 1 2 3 4)  (fringe (list (list (list 1 2) (list 3 4)) (list (list 1 2) (list 3 4)))))  "should flatten the list multiple levels down")
(check (equal? (list 1)  (fringe (list (list (list (list (list (list 1))))))))  "should flatten the list multiple levels down")
(check (equal? (list 1 2 3 19 283 38 2 3 2 2 3 217 382 1827 2 187 2838 2 1 2 2 3 3 23 2 1 238)   (fringe (list (list (list 1 2 3 19 283 38) 2 3 2) (list 2 3 (list 217 382 1827) 2 187 (list 2838)) 2 1 2 (list 2 (list 3 (list 3)) 23 2 1 238))))  "should pass the acceptance test")
)




(run-registered-tests)