(load "test-manager/load.scm")
(load "ch-2/ex-2-54.scm")
(load "ch-2/ex-2-56.scm")

(define-each-test 
(check (custom-equal? '(* (* 5 (** (* x y) 4)) y) (deriv '(** (* x y) 5) 'x) )"should deri an exponent expression")
(check (custom-equal? '(* (* n (** (* x y) (+ n -1))) y) (deriv '(** (* x y) n) 'x) )"should deri an exponent expression")
(check (custom-equal? '(*  (* 2 (* x y) y)) (deriv '(** (* x y) 2) 'x) )"should simplify to iteself when exponent is one")
(check (eq? 'y (deriv '(** (* x y) 1) 'x) )"should simplify to iteself when exponent is one")
)

(run-registered-tests)