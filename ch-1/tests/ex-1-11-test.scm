(load "test-manager/load.scm")
(load "ch-1/ex-1-11.scm")

 (define-each-test
   (check (= 1 (f 1)) "sould be 1")
   (check (= 2 (f 2)) "sould be n when n less than 3")
   (check (= 4 (f 3)) "sould be 4 when n is 3")
   (check (= 11 (f 4)) "sould be 11 when n is 4")
)

(run-registered-tests)