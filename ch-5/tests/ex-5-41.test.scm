(load "test-manager/load.scm")
(load "ch-5/ex-5-41.scm")

(define-each-test
  (check (eq? (find-variable 'c '() ) 'not-found ) "should not find any variable")
  (check (equal? (find-variable 'b'((b)) ) (cons 0 0) ) "should find a variable")
  (check (eq? (find-variable 'c'((b)) ) 'not-found ) "should not find any variable")
  (check (equal? (find-variable 'e'((b c d e f)) ) (cons 0 3) ) "should find a variable")
  (check (equal? (find-variable 'x '((y z) (a b c d e) (x y))) (cons 2 0) ) "should find a variable" )
    )



(run-registered-tests)
