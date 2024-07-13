(load "test-manager/load.scm")
(load "ch-5/ex-5-13.scm")

(define-each-test
(let ((machine (make-machine '() '( (assign b (const 2))(assign a (const 1)) ))))
  (start machine)
  (check (equal? (machine 'reg-names) '(b a)) "should be able to handle simple registers")
  )

(let ((machine (make-machine (list (list '= =)) '( some-label (assign b (const 2)) (test (op =) (reg b) (const 1)) (branch (label some-label) ) (assign a (const 1)) ))))
  (start machine)
  (check (equal? (machine 'reg-names) '(b a)) "should be able to handle simple registers")

)

(let ((machine (make-machine (list (list '+ +)) '((assign val (op +) (reg a) (const 1)) (assign val2 (op +) (reg b) (const 2) ) ))))

  (set-register-contents! machine 'b 1)
  (set-register-contents! machine 'a 1)
  (start machine)
  (check (equal? (machine 'reg-names) '(val val2 a b)) "should be able to handle simple registers")
)

)





(run-registered-tests)
