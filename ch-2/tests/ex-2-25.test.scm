(load "test-manager/load.scm")
(load "ch-2/ex-2-20.scm")

(define-each-test 
(check (= 7 (car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))) "should get seven")
(check (= 7 (car (car (list (list 7)))))"should get seven")
(check (= 7 (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))))))))))))) "should get seven")
)


(run-registered-tests)