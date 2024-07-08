(define (make-operation-exp exp machine labels operations)
  (let ((op (lookup-prim (operation-exp-op exp) operations))
        (aprocs
         (map (lambda (e)
                (if (or (register-exp? e) (constant-exp? e)) 
                  (make-primitive-exp e machine labels)
                  (error "The expression should be a constant or register content" e))
              (operation-exp-operands exp))))
    (lambda ()
      (apply op (map (lambda (p) (p)) aprocs)))))

(define (register-exp? exp) (tagged-list? exp 'reg))

(define (constant-exp? exp) (tagged-list? exp 'const))
