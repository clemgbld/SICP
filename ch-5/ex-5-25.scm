(load "ch-5/ch5-regsim")

(load "ch-5/ch5-eceval-support")

;: (define the-global-environment (setup-environment))

;: (start eceval)

(define (cond? exp) (tagged-list? exp 'cond)) 

(define (cond-clauses exp) (cdr exp))


(define (cond-predicate clause) (car clause))

(define (cond-else-clause? clause)
(eq? (car clause) 'else))


(define (cond-actions clause) (cdr clause))


(define (delay-it exp env) 
  (list 'thunk exp env))


(define (thunk-exp thunk) (cadr thunk)) 

(define (thunk-env thunk) (caddr thunk))

(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(define (thunk? obj) (tagged-list? obj 'thunk))

 (define eceval-operations
  (list

    ;lazy operations
    (list 'delay-it delay-it)
    (list 'thunk? thunk?)
    (list 'thunk-exp thunk-exp)
    (list 'thunk-env thunk-env)
   ;list's operations
   (list 'null? null?) 
   (list 'car car)
   (list 'cdr cdr )
   ;cond's operations
   (list 'cond? cond?)
   (list 'cond-clauses cond-clauses)
   (list 'cond-else-clause? cond-else-clause? )
   (list 'cond-predicate cond-predicate )
   (list 'cond-actions cond-actions)

   ;;primitive Scheme operations
   (list 'read read)

   ;;operations in syntax.scm
   (list 'self-evaluating? self-evaluating?)
   (list 'quoted? quoted?)
   (list 'text-of-quotation text-of-quotation)
   (list 'variable? variable?)
   (list 'assignment? assignment?)
   (list 'assignment-variable assignment-variable)
   (list 'assignment-value assignment-value)
   (list 'definition? definition?)
   (list 'definition-variable definition-variable)
   (list 'definition-value definition-value)
   (list 'lambda? lambda?)
   (list 'lambda-parameters lambda-parameters)
   (list 'lambda-body lambda-body)
   (list 'if? if?)
   (list 'if-predicate if-predicate)
   (list 'if-consequent if-consequent)
   (list 'if-alternative if-alternative)
   (list 'begin? begin?)
   (list 'begin-actions begin-actions)
   (list 'last-exp? last-exp?)
   (list 'first-exp first-exp)
   (list 'rest-exps rest-exps)
   (list 'application? application?)
   (list 'operator operator)
   (list 'operands operands)
   (list 'no-operands? no-operands?)
   (list 'first-operand first-operand)
   (list 'rest-operands rest-operands)

   ;;operations in eceval-support.scm
   (list 'true? true?)
   (list 'make-procedure make-procedure)
   (list 'compound-procedure? compound-procedure?)
   (list 'procedure-parameters procedure-parameters)
   (list 'procedure-body procedure-body)
   (list 'procedure-environment procedure-environment)
   (list 'extend-environment extend-environment)
   (list 'lookup-variable-value lookup-variable-value)
   (list 'set-variable-value! set-variable-value!)
   (list 'define-variable! define-variable!)
   (list 'primitive-procedure? primitive-procedure?)
   (list 'apply-primitive-procedure apply-primitive-procedure)
   (list 'prompt-for-input prompt-for-input)
   (list 'announce-output announce-output)
   (list 'user-print user-print)
   (list 'empty-arglist empty-arglist)
   (list 'adjoin-arg adjoin-arg)
   (list 'last-operand? last-operand?)
   (list 'no-more-exps? no-more-exps?)	;for non-tail-recursive machine
   (list 'get-global-environment get-global-environment))
   )

(define eceval
  (make-machine
   '(exp env val proc argl continue unev)
   eceval-operations
  '(
;;SECTION 5.4.4
read-eval-print-loop
  (perform (op initialize-stack))
  (perform
   (op prompt-for-input) (const ";;; EC-L-Eval input:"))
  (assign exp (op read))
  (assign env (op get-global-environment))
  (assign continue (label print-result))
  (goto (label actual-value))
print-result
;;**following instruction optional -- if use it, need monitored stack
  (perform (op print-stack-statistics))
  (perform
   (op announce-output) (const ";;; EC-L-Eval value:"))
  (perform (op user-print) (reg val))
  (goto (label read-eval-print-loop))

unknown-expression-type
  (assign val (const unknown-expression-type-error))
  (goto (label signal-error))

unknown-procedure-type
  (restore continue)
  (assign val (const unknown-procedure-type-error))
  (goto (label signal-error))

signal-error
  (perform (op user-print) (reg val))
  (goto (label read-eval-print-loop))

;;SECTION 5.4.1
eval-dispatch
  (test (op self-evaluating?) (reg exp))
  (branch (label ev-self-eval))
  (test (op variable?) (reg exp))
  (branch (label ev-variable))
  (test (op quoted?) (reg exp))
  (branch (label ev-quoted))
  (test (op assignment?) (reg exp))
  (branch (label ev-assignment))
  (test (op definition?) (reg exp))
  (branch (label ev-definition))
  (test (op if?) (reg exp))
  (branch (label ev-if))
  (test (op lambda?) (reg exp))
  (branch (label ev-lambda))
  (test (op begin?) (reg exp))
  (branch (label ev-begin))
(test (op cond?) (reg exp))
  (branch (label ev-cond) )
  (test (op application?) (reg exp))
  (branch (label ev-application))
  (goto (label unknown-expression-type))

ev-self-eval
  (assign val (reg exp))
  (goto (reg continue))
ev-variable
  (assign val (op lookup-variable-value) (reg exp) (reg env))
  (goto (reg continue))
ev-quoted
  (assign val (op text-of-quotation) (reg exp))
  (goto (reg continue))
ev-lambda
  (assign unev (op lambda-parameters) (reg exp))
  (assign exp (op lambda-body) (reg exp))
  (assign val (op make-procedure)
              (reg unev) (reg exp) (reg env))
  (goto (reg continue))

ev-application
  (save continue)
  (save env)
  (assign unev (op operands) (reg exp))
  (save unev)
  (assign exp (op operator) (reg exp))
  (assign continue (label ev-appl-did-operator))
  (goto (label actual-value))
ev-appl-did-operator
  (restore unev)
  (restore env)
  (assign argl (op empty-arglist))
  (assign proc (reg val))
  (goto (label apply-dispatch))
ev-appl-operand-loop
  (save argl)
  (assign exp (op first-operand) (reg unev))
  (test (op last-operand?) (reg unev))
  (branch (label ev-appl-last-arg))
  (save env)
  (save unev)
  (assign continue (label ev-appl-accumulate-arg))
  (goto (label actual-value))
ev-appl-accumulate-arg
  (restore unev)
  (restore env)
  (restore argl)
  (assign argl (op adjoin-arg) (reg val) (reg argl))
  (assign unev (op rest-operands) (reg unev))
  (goto (label ev-appl-operand-loop))
ev-appl-last-arg
  (assign continue (label ev-appl-accum-last-arg))
  (goto (label actual-value))
ev-appl-accum-last-arg
  (restore argl)
  (assign argl (op adjoin-arg) (reg val) (reg argl))
  (restore proc)
  (goto (label primitive-apply))
apply-dispatch
  (test (op primitive-procedure?) (reg proc))
  (branch (label list-of-values))
  (test (op compound-procedure?) (reg proc))  
  (branch (label list-of-delayed-args))
  (goto (label unknown-procedure-type))
  list-of-values
  (test (op no-operands?) (reg unev))
  (branch (label primitive-apply))
  (save proc)
  (goto (label ev-appl-operand-loop))
  list-of-delayed-args
  (test (op null?) (reg unev))
  (branch (label compound-apply))
  (assign exp (op first-operand) (reg unev))
  (assign val (op delay-it) (reg exp) (reg env))
  (assign argl (op adjoin-arg) (reg val) (reg argl))
  (assign unev (op rest-operands) (reg unev))
  (goto (label list-of-delayed-args))
primitive-apply
  (assign val (op apply-primitive-procedure)
              (reg proc)
              (reg argl))
  (restore continue)
  (goto (reg continue))
compound-apply
  (assign unev (op procedure-parameters) (reg proc))
  (assign env (op procedure-environment) (reg proc))
  (assign env (op extend-environment)
              (reg unev) (reg argl) (reg env))
  (assign unev (op procedure-body) (reg proc))
  (goto (label ev-sequence))

;;;SECTION 5.4.2
ev-begin
  (assign unev (op begin-actions) (reg exp))
  (save continue)
  (goto (label ev-sequence))

ev-sequence
  (assign exp (op first-exp) (reg unev))
  (test (op last-exp?) (reg unev))
  (branch (label ev-sequence-last-exp))
  (save unev)
  (save env)
  (assign continue (label ev-sequence-continue))
  (goto (label eval-dispatch))
ev-sequence-continue
  (restore env)
  (restore unev)
  (assign unev (op rest-exps) (reg unev))
  (goto (label ev-sequence))
ev-sequence-last-exp
  (restore continue)
  (goto (label eval-dispatch))

;;;SECTION 5.4.3

ev-if
  (save exp)
  (save env)
  (save continue)
  (assign continue (label ev-if-decide))
  (assign exp (op if-predicate) (reg exp))
  (goto (label actual-value))
ev-if-decide
  (restore continue)
  (restore env)
  (restore exp)
  (test (op true?) (reg val))
  (branch (label ev-if-consequent))
ev-if-alternative
  (assign exp (op if-alternative) (reg exp))
  (goto (label eval-dispatch))
ev-if-consequent
  (assign exp (op if-consequent) (reg exp))
  (goto (label eval-dispatch))

ev-assignment
  (assign unev (op assignment-variable) (reg exp))
  (save unev)
  (assign exp (op assignment-value) (reg exp))
  (save env)
  (save continue)
  (assign continue (label ev-assignment-1))
  (goto (label eval-dispatch))
ev-assignment-1
  (restore continue)
  (restore env)
  (restore unev)
  (perform
   (op set-variable-value!) (reg unev) (reg val) (reg env))
  (assign val (const ok))
  (goto (reg continue))
ev-definition
  (assign unev (op definition-variable) (reg exp))
  (save unev)
  (assign exp (op definition-value) (reg exp))
  (save env)
  (save continue)
  (assign continue (label ev-definition-1))
  (goto (label eval-dispatch))
ev-definition-1
  (restore continue)
  (restore env)
  (restore unev)
  (perform
   (op define-variable!) (reg unev) (reg val) (reg env))
  (assign val (const ok))
  (goto (reg continue))
ev-cond
  (save continue)
  (assign exp (op cond-clauses) (reg exp)) 
  (goto (label cond-loop ))
  cond-loop
  (test (op null?) (reg exp))
  (branch (label ev-cond-false))
  (assign unev (op car) (reg exp))
  (test (op cond-else-clause?) (reg unev))
  (branch (label ev-cond-else))
  (save exp) 
  (save env)
  (assign continue (label ev-cond-decide))
  (assign exp (op cond-predicate) (reg unev) )
  (goto (label eval-dispatch))
  ev-cond-else
  (assign exp (op cdr) (reg exp))
  (test (op null?) (reg exp))
  (branch (label ev-cond-else-valid))
  (assign val (const else-clause-is-not-last) )
  (goto (label signal-error))
  ev-cond-else-valid
  (assign unev (op cond-actions) (reg unev))
  (goto (label ev-sequence))
  ev-cond-decide
  (restore env)
  (restore exp)
  (test (op true?) (reg val))
  (branch (label ev-cond-consequent))
  (assign exp (op cdr) (reg exp))
  (goto (label cond-loop))
  ev-cond-consequent
  (assign exp (op car) (reg exp))
  (assign exp (op cond-actions) (reg exp))
  (goto (label ev-sequence))
  ev-cond-false
  (restore continue)
  (assign val (const false))
  (goto (reg continue) )
  actual-value
  (save continue)
  (assign continue (label force-it) )
  (goto (label eval-dispatch) )
  force-it
  (test (op thunk?) (reg val))
  (branch (label un-thunk))
  (restore continue)
  (goto (reg continue))
  un-thunk
  (assign env (op thunk-env) (reg val))
  (assign exp (op thunk-exp) (reg val))
  (goto (label actual-value))
   )))

'(EXPLICIT CONTROL EVALUATOR LOADED)

 (define the-global-environment (setup-environment))

(start eceval)



