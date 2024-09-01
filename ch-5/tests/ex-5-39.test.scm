(load "test-manager/load.scm")
(load "ch-5/ex-5-39.scm")

(define-each-test
  (check (= (lexical-address-lookup (cons 0 0) (cons (make-frame '(a) '(1) ) '())) 1) "should find the first variable in the first frame of the env") 
  (check (= (lexical-address-lookup (cons 0 1) (cons (make-frame '(a b) '(1 2) ) '())) 2) "should the second variable in the first frame of the env") 
  (check (= (lexical-address-lookup (cons 1 2) ( cons (make-frame '(a b ) '(1 2)) (cons (make-frame '(a b c) '(5 6 7) ) '())) ) 7) "should find the value in a nested env") 
  (check (= (lexical-address-lookup (cons 2 1) ( cons (make-frame '(a b ) '(1 2)) (cons (make-frame '(a b c) '(5 6 7) ) (cons (make-frame '(c d) '(110 12) ) '() ) )) ) 12) "should find the value in a nested env") 
    )

(run-registered-tests)
