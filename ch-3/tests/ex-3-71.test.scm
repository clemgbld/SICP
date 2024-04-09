(load "test-manager/load.scm")
(load "ch-3/ex-3-71.scm")



(define-each-test
(check (equal? '() (stream->list (filter-by-consecutive-weight the-empty-stream 2 weight-cube))) "should not find any consucutive pair")
(check (equal? (list '(1 1)) (stream->list (filter-by-consecutive-weight (list->stream (list '(1 1) '(1 1))) 2 weight-cube))) "should keep the first pair given that it has the same weight than the second pair")
(check (equal? '() (stream->list (filter-by-consecutive-weight (list->stream (list '(1 1) '(1 2))) 2 weight-cube))) "should be an empty stream given that there is no consecutive pair")
(check (equal? (list '(1 1) '(1 2)) (stream->list (filter-by-consecutive-weight (list->stream (list '(1 1) '(1 1) '(1 3) '(1 2) '(1 2))) 2 weight-cube))) "should pass the acceptance test")
)

(define-each-test
(check ( equal? '(1729) (stream->list (stream-take ramanujan-numbers 1))) "should get the first ramanujan number")
(check ( equal? '(1729 4104 13832 20683 32832) (stream->list (stream-take ramanujan-numbers 5))) "should get the 5 first ramanujan numbers")
)

(run-registered-tests)