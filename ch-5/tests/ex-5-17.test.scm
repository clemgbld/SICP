(load "test-manager/load.scm")
(load "ch-5/ex-5-17.scm")

(define-each-test
(check (equal? (get-first-label '((assign a (const 1) ))) #f ) "should not find any label")
)

(define-each-test
(check (equal? (get-first-label '((assign a (const 1) ) label)) 'label  ) "should not find any label")
)





(run-registered-tests)
