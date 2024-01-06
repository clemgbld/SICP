(load "test-manager/load.scm")
(load "ch-2/ex-2-33.scm")


(define-each-test
(check (equal? (list 1 4 9)  (custom-map square (list 1 2 3)))  "should square each number in the sequence")
(check (equal? (list 1 2 3 4) (custom-append (list 1 2) (list 3 4))) "should concat two list together")
(check (= 3 (custom-length (list 1 2 3))) "should be the lenght of the sequence")
)




(run-registered-tests)