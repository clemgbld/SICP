(load "test-manager/load.scm")
(load "ch-3/ex-3-2.scm")

(define-each-test
(let ((monitored-sqrt (make-monitored sqrt)))
    (check (= 10 (monitored-sqrt 100))) "should find the sqrt of a given number")
 (let ((monitored-add (make-monitored + )))
    (check (= 110 (monitored-add 100 10 ))) "should add number together")   
(let ((monitored-add (make-monitored + )))
    (check (= 0 (monitored-add 'how-many-calls?))) "the number of calls should be zero initially")

(let ((monitored-add (make-monitored + )))
    (monitored-add 100 10 )
    (check (= 1 (monitored-add 'how-many-calls?))) "should count the numbers of calls")

(let ((monitored-add (make-monitored + )))
    (monitored-add 100 10 )
    (monitored-add 'reset-count)
    (check (= 0 (monitored-add 'how-many-calls?))) "should be able to rest the count of the calls")

(let ((monitored-supplier (make-monitored (lambda () 5 ))))
    (check (= 5 (monitored-supplier ))) "should be able to handle parameterless procedure")
)

(run-registered-tests)