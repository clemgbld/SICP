(load "test-manager/load.scm")
(load "ch-5/ex-5-12.scm")



(define-each-test 
(let ((machine (make-machine '() '() '())))
(check (equal? (list-of-instructions machine) '()) "should be empty when there no instructions"))

(let ((machine (make-machine '(a) '() '((assign a (const 2))))))
(check (equal? (list-of-instructions machine) '((assign  a (const 2)))) "should have the simples list containing assign instruction"))

(let ((machine (make-machine '(a) '() '((assign a (const 2)) (assign a (const 3)) (assign a (const 2))))))
(check (equal? (list-of-instructions machine) '( (assign  a (const 2) ) (assign a (const 3)) )) "should remove duplicates"))

(let ((machine (make-machine '(a) '() '(gcd-1 (assign a (const 2))   (assign a (const 3)) gcd-2 (assign a (const 2))))))
(check (equal? (list-of-instructions machine) '( (assign  a (const 2) ) (assign a (const 3)) gcd-1 gcd-2 )) "should handle label and sort the all the instructions"))

(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (save t)
       (assign a (reg b))
       (restore t)
       (assign b (reg t))
       (goto (label gcd-1))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (save t)
       (assign a (reg b))
       (assign b (reg t))
       (restore t)
       (goto (label gcd-1))))))
(check (equal? (list-of-instructions machine) '((assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
      (branch (label after-gcd-1))
      (goto (label gcd-1))
      (test (op =) (reg b) (const 0))
      (save t)
      (restore t)
      gcd-1
      after-gcd-1
      )) "handle all instructions for a simple machine "))
)

(define-each-test
(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (goto (label gcd-1))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (goto (label gcd-1))))))
(check (equal? (restored-and-saved-registers machine) '()) "should have no saved neither stored registers"))

(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (save t)
       (save a)
       (goto (label gcd-1))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (goto (label gcd-1))))))
(check (equal? (restored-and-saved-registers machine) '(t a)) "should have saved registers"))

(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (save t)
       (goto (label gcd-1))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (restore a)
       (restore b)
       (assign b (reg t))
       (goto (label gcd-1))))))
(check (equal? (restored-and-saved-registers machine) '(t a b)) "should have saved and stored registers"))

(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (save t)
       (save t)
       (save a)
       (goto (label gcd-1))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (restore a)
       (restore t)
       (restore b)
       (restore b)
       (assign b (reg t))
       (goto (label gcd-1))))))
(check (equal? (restored-and-saved-registers machine) '(t a b)) "should not have any duplicates"))

)

(define-each-test
(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (save t)
       (save t)
       (save a)
       (goto (label gcd-1))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (restore a)
       (restore t)
       (restore b)
       (restore b)
       (assign b (reg t))
       (goto (label gcd-1))))))
(check (equal? (register-assigned-sources machine 'pc) '()) "should not have any assignment for this register"))

(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (const 2))
       (assign a (reg b))
       (assign b (reg t))
       (save t)
       (save t)
       (save a)
       (goto (label gcd-1))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (restore a)
       (restore t)
       (restore b)
       (restore b)
       (assign b (reg t))
       (goto (label gcd-1))))))
(check (equal? (register-assigned-sources machine 'a) 
               '((assign a (const 2)) (assign a (reg b)) )) 
               "should not have all assignments for a register without duplicates"))

  )

(define-each-test
(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
))))
(check (equal? (entry-point-registers machine) '()) "should not have any entry point register")
  )

(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (goto (reg a))
       (goto (reg a))
       (goto (reg b))
))))
(check (equal? (entry-point-registers machine) '(a b)) "should select the entry points registers without duplicates")
  )

(let ((machine (make-machine '(a b t) (list (list '= =) (list 'rem remainder )) '(gcd-1
       (test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
after-gcd-1
(test (op =) (reg b) (const 0))
       (branch (label after-gcd-1))
       (assign t (op rem) (reg a) (reg b))
       (assign a (reg b))
       (assign b (reg t))
       (goto (label gcd-1))
       (goto (reg a))
       (goto (reg a))
       (goto (label after-gcd-1))
       (goto (reg b))
       (goto (reg t))
))))
(check (equal? (entry-point-registers machine) '(a b t)) "should filter out label")
  )

)





(run-registered-tests)
