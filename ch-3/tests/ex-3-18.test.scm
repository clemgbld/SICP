(load "test-manager/load.scm")
(load "ch-3/ex-3-18.scm")

(define-each-test
(check (assert-false (contains-cycle? (list 'a 'b 'c))) "should not contains any cycle")
(check (assert-false (contains-cycle? (list (cons 1 2) (cons 2 3) (cons 3 4)))) "should not contains any cycle")
(let ((l (list 'a 'b 'c)))
    (check (assert-true (contains-cycle? (make-cycle l)))) "should contains a cycle the first level of the list")
(let ((l (list 'a 'b 'c)))
    (check (assert-true (contains-cycle? (list (make-cycle l)  1  ))) "should contains a cycle when a child of a list contains a cycle") )
(let ((l (list 'a 'b 'c)))
    (check (assert-true (contains-cycle? (list  2   1  (make-cycle l)))) "should contains a cycle when a child of a list contains a cycle") )
(let ((l (list 'a 'b 'c)) (l2 (list 'a 'b 'c)))
    (check (assert-true (contains-cycle? (list  2   1  l (list 'a 'b (list 'a (make-cycle l2) 'e))))) "should pass the acceptance test") )
(let ((l (list 'a 'b 'c)) (l2 (list 'a 'b 'c)))
    (check (assert-true (contains-cycle? (list  2   1  l (list 'a 'b (list 'a (make-cycle l2) 'e))))) "should pass the acceptance test") )
(let ((l (list 'a 'b 'c)) (l2 (list 'a 'b 'c)))
    (check (assert-true (contains-cycle? (list  2   1  l (list 'a 'b (list 'a (make-cycle l2) 'e)))))) "should pass the acceptance test")
)



(run-registered-tests)