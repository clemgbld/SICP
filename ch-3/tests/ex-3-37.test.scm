
(load "test-manager/load.scm")
(load "ch-3/ex-3-37.scm")


(define-each-test
(let ((a (make-connector)) (b (make-connector)))
    (define c (c+ a b))
    (set-value! a 5 'user)
    (set-value! b 2 'user)
(check (= 7 (get-value c)) "should be able to add two number together")
)

(let ((a (make-connector)) (b (make-connector)))
    (define c (c* a b))
    (set-value! a 5 'user)
    (set-value! b 2 'user)
(check (= 10 (get-value c)) "should multiply two number together")
)

(let ((a (make-connector)) (b (make-connector)))
    (define c (c- a b))
    (set-value! a 5 'user)
    (set-value! b 2 'user)
(check (= 3 (get-value c)) "should be able to substract one number by the other")
)

(let ((a (make-connector)) (b (make-connector)))
    (define c (c/ a b))
    (set-value! a 6 'user)
    (set-value! b 2 'user)
(check (= 3 (get-value c)) "should be able to divide a number by another")
)

(check (= 2 (get-value (cv 2))) "should be able to build a constant")

(let ((c (make-connector)))
(define result (celsius-fahrenheit-converter c))
(set-value! c 100 'user)
(check (= 212 (get-value result)) "should convert degree celsius to fahreneit")
)

)



(run-registered-tests)