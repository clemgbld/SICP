(load "test-manager/load.scm")
(load "ch-5/ex-5-39.scm")

(define-each-test
  (check (= (lexical-address-lookup (make-lexical-address 0 0) (cons (make-frame '(a) '(1) ) '())) 1) "should find the first variable in the first frame of the env") 
  (check (= (lexical-address-lookup (make-lexical-address 0 1) (cons (make-frame '(a b) '(1 2) ) '())) 2) "should the second variable in the first frame of the env") 
  (check (= (lexical-address-lookup (make-lexical-address 1 2) ( cons (make-frame '(a b ) '(1 2)) (cons (make-frame '(a b c) '(5 6 7) ) '())) ) 7) "should find the value in a nested env") 
  (check (= (lexical-address-lookup (make-lexical-address 2 1) 
  ( cons (make-frame '(a b ) '(1 2)) 
         (cons (make-frame '(a b c) '(5 6 7) ) 
               (cons (make-frame '(c d) '(110 12) ) '() ) )) ) 12) "should find the value in a nested env") 
    )

(define-each-test
  (let ((env (cons (make-frame '(a) '(1) ) '())))
    (lexical-address-set! (make-lexical-address 0 0) env 2)
    (check (equal? env  (cons (make-frame '(a) '(2) ) '())) "should set the first element of the first frame in the environment"))

(let ((env (cons (make-frame '(a b c d) '(1 2 3 4) ) '())))
    (lexical-address-set! (make-lexical-address 0 2) env 10)
    (check (equal? env  (cons (make-frame '(a b c d) '(1 2 10 4) ) '())) "should set the an element of the first frame in the environment"))

(let ((env (cons (make-frame '(a b c d) '(1 2 3 4) ) '())))
    (lexical-address-set! (make-lexical-address 0 2) env 10)
    (check (equal? env  (cons (make-frame '(a b c d) '(1 2 10 4) ) '())) "should set the an element of the first frame in the environment"))

(let ((env ( cons (make-frame '(a b ) '(1 2)) (cons (make-frame '(a b c) '(5 6 7) ) '()))))
    (lexical-address-set! (make-lexical-address 1 2) env 12)
    (check (equal? env  ( cons (make-frame '(a b ) '(1 2)) (cons (make-frame '(a b c) '(5 6 12) ) '()))) "should set the an element of a nested frame"))


(let ((env ( cons (make-frame '(a b ) '(1 2)) 
         (cons (make-frame '(a b c) '(5 6 7) ) 
               (cons (make-frame '(c d) '(110 12) ) '() ) ))))
    (lexical-address-set! (make-lexical-address 2 1) env 11)
    (check (equal? env  ( cons (make-frame '(a b ) '(1 2)) 
         (cons (make-frame '(a b c) '(5 6 7) ) 
               (cons (make-frame '(c d) '(110 11) ) '() ) ))) "should set the an element of a nested frame"))

    )

(run-registered-tests)
