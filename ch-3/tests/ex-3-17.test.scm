(load "test-manager/load.scm")
(load "ch-3/ex-3-17.scm")

(define-each-test
(check (= 0 (count-pairs 1)) "should be zero when there is no pair")
(check (= 1 (count-pairs (cons 1 2))) "should have a simple pair")
(check (= 3 (count-pairs (cons (cons 1 2) (cons 1 2)))) "should be able to handle nested pairs")
(let ((y (cons 1 2)))
    (let ((z (cons y y)))
        (let ((x (cons z z)))
            (check (= 3 (count-pairs x)) "should not count a pair more than once"))))
(let ((y (cons 1 2)))
    (let ((z (cons y y)))
        (let ((x (cons z z)))
            (set-car! y x)
            (check (= 3 (count-pairs x)) "should return when there is a circular deps"))))
)



(run-registered-tests)