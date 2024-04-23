(load "test-manager/load.scm")
(load "ch-4/ex-4-5.scm")

(define-each-test
(check (eq? 'false (cond->if (list 'cond ))) "should be false when there is no clauses in cond")
(check (equal? (list 'if '(= x 1) '(+ x 3)  'false) (cond->if (list 'cond '((= x 1) (+ x 3))))) "should be able to transform one cond clause in a if")
(check (equal? (list 'if '(= x 1) '(+ x 3)  '(- x 1)) (cond->if (list 'cond '((= x 1) (+ x 3)) '(else (- x 1))))) "should be able to transform a cond to an if with the else as the alternative")
(check (equal? (list 'if '(= x 1) '(+ x 3) (list 'if '(= x 2) '(- x 1) 'false)) (cond->if (list 'cond '((= x 1) (+ x 3)) '((= x 2) (- x 1))))) "should be able to transform cond into nested if")
(check (equal? (list 'if '(assoc b ((a 1) (b 2))) '(cadr (assoc b ((a 1) (b 2)))) #f) (cond->if (list 'cond '((assoc b ((a 1) (b 2))) => cadr) '(else #f)))) "should be able to transform cond into if with the recipient syntax")
)


(run-registered-tests)