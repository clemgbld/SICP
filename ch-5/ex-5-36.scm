;initially since we cons the operands we evaluate them from right to left
;to change the order of evaluation from left to right instead of right form left we need to append instead of cons the operands in argl

(define (construct-arglist operand-codes)
  (let ((operand-codes operand-codes))
    (if (null? operand-codes)
        (make-instruction-sequence '() '(argl)
         '((assign argl (const ()))))
        (let ((code-to-get-first-arg
               (append-instruction-sequences
                (car operand-codes)
                (make-instruction-sequence '(val) '(argl)
                 '((assign argl (op list) (reg val)))))))
          (if (null? (cdr operand-codes))
              code-to-get-first-arg 
              (preserving '(env)
                code-to-get-first-arg 
               (code-to-get-rest-args
                (cdr operand-codes))))))))

(define (code-to-get-rest-args operand-codes)
  (let ((code-for-next-arg
         (preserving '(argl)
          (car operand-codes)
          (make-instruction-sequence '(val argl) '(argl)
           '((assign argl
              (op adjoin-arg) (reg val) (reg argl) ))))))
    (if (null? (cdr operand-codes))
        code-for-next-arg
        (preserving '(env)
         code-for-next-arg
         (code-to-get-rest-args (cdr operand-codes))))))

;the code is less efficient since append to a list is less efficient that to cons one value with an existing list, 
;we also need to create a new list for each operand to append it to the exising argl which consume more memory
