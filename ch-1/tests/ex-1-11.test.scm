(load "test-manager/load.scm")
(load "ch-1/ex-1-11.scm")

 (define-each-test
   (check (= 1 (f 1)) "sould be 1")
   (check (= 2 (f 2)) "sould be n when n less than 3")
   (check (= 4 (f 3)) "sould be 4 when n is 3")
   (check (= 11 (f 4)) "sould be 11 when n is 4")
   (check (= 25 (f 5)) "sould be 25 when n is 5")
   (check (= 59 (f 6)) "sould be 59 when n is 6")
)

(define-each-test 
(check (= 1 (f-bis 1)) "sould be 1 when x is 1")
(check (= 2 (f-bis 2)) "sould be 2 when x is 2")
(check (= 4 (f-bis 3)) "sould be 4 when x is 3")
(check (= 11 (f-bis 4)) "sould be 11 when x is 4")
(check (= 25 (f 5)) "sould be 25 when x is 5")
)

(run-registered-tests)