(load "test-manager/load.scm")
(load "ch-3/ex-3-70.scm")


(define-each-test
(check (equal? (list (list 1 1) ) (stream->list (stream-take ordered-pairs 1))) "should take the first element of an ordered pair stream")
(check (equal? (list (list 1 1) (list 1 2) ) (stream->list (stream-take ordered-pairs 2))) "should take the two first elements of an ordered pair stream")
(check (equal? (list (list 1 1) (list 1 2) (list 1 3) (list 2 2) ) (stream->list (stream-take ordered-pairs 4))) "should ordered the pairs correctly based on a weight of i + j")
)

(define-each-test
(check (equal? (list '(1 1) '(1 7) '(1 11) '(1 13) '(1 17) '(1 19) '(1 23)  '(1 29) '(1 31) '(7 7) ) (stream->list (stream-take stream-b 10))) "should filter out i and j that are divisble by 2 3 or 5 and order pair by 2i + 3j + 5ij")
)





(run-registered-tests)