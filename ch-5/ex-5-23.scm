'(
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
  ;cond and let dispatch added here
  (test (op cond?) (reg exp))
  (branch (label ev-cond) )
  (test (op let?) (reg exp))
  (branch (label ev-let) )
  ;--
  (test (op application?) (reg exp))
  (branch (label ev-application))
  (goto (label unknown-expression-type))
  ev-cond
  ;assuming we have a cond->if procedure available
  (assign exp (op) (cond->if) (reg exp) )
  (goto (label eval-dispatch) )

  ev-let
  ;assuming we have a let->lambda
  (assign exp (op) (let->combination) (reg exp))
  (goto (label eval-dispatch) )

 )

