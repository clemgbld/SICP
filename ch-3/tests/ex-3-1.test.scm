(load "test-manager/load.scm")
(load "ch-3/ex-3-1.scm")

(define-each-test
(let ((acc (make-accumulator 5))) 
    (check (= 10 (acc 5)) "should be able to increment the initial value"))
(let ((acc (make-accumulator 10))) 
    (acc 10)
    (check (= 25 (acc 5)) "should be able to increment the initial value multiple times"))
)

(run-registered-tests)