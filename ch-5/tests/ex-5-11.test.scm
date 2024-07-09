(load "test-manager/load.scm")
(load "ch-5/ex-5-11.scm")

(set-register-contents! fib-machine 'n 6)
(start fib-machine)

(define-each-test 
(check (= 8 (get-register-contents fib-machine 'val)) "should compute fib"))


(run-registered-tests)
