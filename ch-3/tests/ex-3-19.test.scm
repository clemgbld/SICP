
(load "test-manager/load.scm")
(load "ch-3/ex-3-19.scm")

(define-each-test
(check (assert-false (contains-cycle? (list 'a 'b 'c))) "should not contains any cycle")
(check (assert-false (contains-cycle? (list (cons 1 2) (cons 2 3) (cons 3 4)))) "should not contains any cycle")
(let ((l (list 'a 'b 'c)))
    (check (assert-true (contains-cycle? (make-cycle l)))) "should contains a cycle the first level of the list")
)



(run-registered-tests)