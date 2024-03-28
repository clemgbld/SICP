(load "test-manager/load.scm")
(load "ch-3/ex-3-54.scm")


(define-each-test
(check (= 720 (stream-ref factorials 5)) "should get the sixth element of the factorails stream")
)



(run-registered-tests)