(load "test-manager/load.scm")
(load "ch-3/ex-3-77.scm")



(define-each-test
(check (= 2.716923932235896 (stream-ref (solve (lambda (y) y) 1 0.001) 1000)) "should be about 2.718 when computing the value at y = 1 of the solution to the differential equation dy/dt = y with initial condition y(0) = 1")
)



(run-registered-tests)