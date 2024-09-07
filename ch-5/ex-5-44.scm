;;;;COMPILER FROM SECTION 5.5 OF
;;;; STRUCTURE AND INTERPRETATION OF COMPUTER PROGRAMS

;;;;Matches code in ch5.scm

;;;;This file can be loaded into Scheme as a whole.
;;;;**NOTE**This file loads the metacircular evaluator's syntax procedures
;;;;  from section 4.1.2
;;;;  You may need to change the (load ...) expression to work in your
;;;;  version of Scheme.

;;;;Then you can compile Scheme programs as shown in section 5.5.5

;;**implementation-dependent loading of syntax procedures
(load "ch-5/ch5-syntax.scm")			;section 4.1.2 syntax procedures
(load "ch-5/ex-5-41.scm")

;;;SECTION 5.5.1


(define (compile exp target linkage cenv)
  (cond ((self-evaluating? exp)
         (compile-self-evaluating exp target linkage))
        ((quoted? exp) (compile-quoted exp target linkage))
        ((variable? exp)
         (compile-variable exp target linkage cenv))
        ((assignment? exp)
         (compile-assignment exp target linkage cenv))
        ((definition? exp)
         (compile-definition exp target linkage cenv))
        ((if? exp) (compile-if exp target linkage cenv))
        ((lambda? exp) (compile-lambda exp target linkage cenv))
        ((begin? exp)
         (compile-sequence (begin-actions exp)
                           target
                           linkage cenv))
        ((cond? exp) (compile (cond->if exp) target linkage cenv))
		((same? exp) (compile-same exp target linkage cenv))
		((add? exp) (compile-add exp target linkage cenv))
		((sub? exp) (compile-sub exp target linkage cenv))
		((mul? exp) (compile-mul exp target linkage cenv))
        ((application? exp)
         (compile-application exp target linkage cenv))
        (else
         (error "Unknown expression type -- COMPILE" exp))))




(define (make-instruction-sequence needs modifies statements)
  (list needs modifies statements))

(define (empty-instruction-sequence)
  (make-instruction-sequence '() '() '()))

(define (make-lexical-address frame-address value-address )
 (cons frame-address value-address))

(define (get-value-address address) (cdr address))

(define (get-scope-address address) (car address))

(define (find-frame n env ) 
  (cond 
    ((null? env) (error "Unbound variable"))
    ((= n 0) (first-frame env))
    (else (find-frame (- n 1) (enclosing-environment env )))))

(define (lexical-address-lookup address env) 
  (let ((value (list-ref 
    (frame-values (find-frame (get-scope-address address) env) ) 
    (get-value-address address)))) 
      (if (eq? value '*unassigned*) 
        (error value " SHOULD NOT BE UNASSIGNED" ) 
        value)))

(define (lexical-address-set! address env val)
  (let* ((value-tail (frame-values 
             (list-tail (find-frame (get-scope-address address) env) 
                        (get-value-address address)))) 
         (value (car value-tail)))
     (if (eq? value  '*unassigned*) 
       (error value " SHOULD NOT BE UNASSIGNED --SET" ) 
       (set-car! value-tail val))))

(define (not-found? address) 
  (eq? address 'not-found))

;;;SECTION 5.5.2

;;;linkage code

(define (compile-linkage linkage)
  (cond ((eq? linkage 'return)
         (make-instruction-sequence '(continue) '()
          '((goto (reg continue)))))
        ((eq? linkage 'next)
         (empty-instruction-sequence))
        (else
         (make-instruction-sequence '() '()
          `((goto (label ,linkage)))))))

(define (end-with-linkage linkage instruction-sequence)
  (preserving '(continue)
   instruction-sequence
   (compile-linkage linkage)))


;;;simple expressions


(define all-arg-regs '(arg1 arg2))
(define total-arg-regs (length all-arg-regs))

(define (spread-arguments operands-list)
  (define (iter operands-list arg-regs)
	(if (null? operands-list)
		(empty-instruction-sequence)
		(let ((rest-seq (iter (cdr operands-list)
							  (cdr arg-regs)))
			  (first-seq (compile (car operands-list)
								  (car arg-regs)
								  'next)))
		  (preserving
		   '(env)
		   rest-seq
		   (preserving (cdr arg-regs)
					   first-seq
					   (make-instruction-sequence
						(cdr arg-regs)
						'()
						'()))))))
  (iter operands-list (take all-arg-regs (length operands-list))))


;;it return list like '((reg arg1) (reg arg2) ... )
;;for each reg in arg-regs passed
(define (make-arg-regs-list arg-regs)
  (map (lambda(reg)
		 (list 'reg reg))
	   arg-regs))

(define (compile-open-code operation operands-list target linkage)
  (let ((operands-length (length operands-list)))
	(if (> operands-length total-arg-regs)
		(error "Open code primitive operands are more than the available arg regs.")
		(let ((arg-regs (take all-arg-regs operands-length)))
		  ;;recall that end-with-linkage preserves continue register
		  (end-with-linkage
		   linkage
		   (append-instruction-sequences
			(spread-arguments operands-list)
			(make-instruction-sequence
			 arg-regs
			 `(,target)
			 `((assign ,target
					   (op ,operation)
					   . ;;notice the dot
					   ,(make-arg-regs-list arg-regs))))))))))

(define (same? exp) (tagged-list? exp '=))
(define (mul? exp) (tagged-list? exp '*))
(define (sub? exp) (tagged-list? exp '-))
(define (add? exp) (tagged-list? exp '+))

(define (compile-same exp target linkage)
  (compile-open-code '= (operands exp) target linkage))

(define (compile-sub exp target linkage)
  (compile-open-code '- (operands exp) target linkage))

;;below to procedures contains the change correspoding to part(d)
(define (compile-add exp target linkage)
  (split-and-compile '+ (operands exp) target linkage))

(define (compile-mul exp target linkage)
  (split-and-compile '* (operands exp) target linkage))


(define (split items n)
  (cond ((= n 0) (cons '() items))
		((null? items) (cons '() '()))
		(else (let ((n-1-split (split (cdr items)
									  (- n 1))))
				(cons (cons (car items)
							(car n-1-split))
					  (cdr n-1-split))))))

(define (split-and-compile operator operands target linkage)
  (let ((splitted (split operands total-arg-regs)))
	(let ((first-part (car splitted))
		  (rem-part (cdr splitted)))
	  (if (null? rem-part)
		  (compile-open-code operator first-part target linkage)
		  (let ((new-operand-1 (cons operator first-part))
				(new-operand-2 (if (null? (cdr rem-part))
								   (car rem-part)
								   (cons operator rem-part))))
			(compile-open-code operator
							   (list new-operand-1 new-operand-2)
							   target
							   linkage))))))




(define (compile-self-evaluating exp target linkage)
  (end-with-linkage linkage
   (make-instruction-sequence '() (list target)
    `((assign ,target (const ,exp))))))

(define (compile-quoted exp target linkage)
  (end-with-linkage linkage
   (make-instruction-sequence '() (list target)
    `((assign ,target (const ,(text-of-quotation exp)))))))

(define (compile-variable exp target linkage cenv)
  (let ( (var-address (find-variable exp cenv)))
    (if (not-found? var-address)
  (end-with-linkage linkage
   (make-instruction-sequence '(env) (list target)
       `(
        (assign ,target (op lookup-variable-value) (reg exp) (reg env)))))
  (end-with-linkage linkage
   (make-instruction-sequence '(env) (list target)
       `((assign ,target (op lexical-address-lookup) 
                 (const ,var-address) (reg env))))))))

(define (compile-assignment exp target linkage cenv)
  (let* ((var (assignment-variable exp))
        (var-address (find-variable var cenv) )
        (get-value-code
         (compile (assignment-value exp) 'val 'next cenv)))
    (end-with-linkage linkage
     (preserving '(env)
      get-value-code
      (make-instruction-sequence '(env val) (list target)
        (if (not-found? var-address) 
          `(
            (perform (op set-variable-value!)
                  (const ,var)
                  (reg val)
                  (reg env))
         (assign ,target (const ok)))
          `((perform (op lexical-address-set!) 
                     (const ,var-address) (reg env) (reg val))
            (assign ,target (const ok)))))))))

(define (compile-definition exp target linkage cenv)
  (let ((var (definition-variable exp))
        (get-value-code
         (compile (definition-value exp) 'val 'next cenv)))
    (end-with-linkage linkage
     (preserving '(env)
      get-value-code
      (make-instruction-sequence '(env val) (list target)
       `((perform (op define-variable!)
                  (const ,var)
                  (reg val)
                  (reg env))
         (assign ,target (const ok))))))))


;;;conditional expressions

;;;labels (from footnote)
(define label-counter 0)

(define (new-label-number)
  (set! label-counter (+ 1 label-counter))
  label-counter)

(define (make-label name)
  (string->symbol
    (string-append (symbol->string name)
                   (number->string (new-label-number)))))
;; end of footnote

(define (compile-if exp target linkage cenv)
  (let ((t-branch (make-label 'true-branch))
        (f-branch (make-label 'false-branch))                    
        (after-if (make-label 'after-if)))
    (let ((consequent-linkage
           (if (eq? linkage 'next) after-if linkage)))
      (let ((p-code (compile (if-predicate exp) 'val 'next cenv))
            (c-code
             (compile
              (if-consequent exp) target consequent-linkage cenv))
            (a-code
             (compile (if-alternative exp) target linkage cenv)))
        (preserving '(env continue)
         p-code
         (append-instruction-sequences
          (make-instruction-sequence '(val) '()
           `((test (op false?) (reg val))
             (branch (label ,f-branch))))
          (parallel-instruction-sequences
           (append-instruction-sequences t-branch c-code)
           (append-instruction-sequences f-branch a-code))
          after-if))))))

;;; sequences

(define (compile-sequence seq target linkage cenv)
  (if (last-exp? seq)
      (compile (first-exp seq) target linkage cenv)
      (preserving '(env continue)
       (compile (first-exp seq) target 'next cenv)
       (compile-sequence (rest-exps seq) target linkage cenv))))

;;;lambda expressions

(define (compile-lambda exp target linkage cenv)
  (let ((proc-entry (make-label 'entry))
        (after-lambda (make-label 'after-lambda)))
    (let ((lambda-linkage
           (if (eq? linkage 'next) after-lambda linkage)))
      (append-instruction-sequences
       (tack-on-instruction-sequence
        (end-with-linkage lambda-linkage
         (make-instruction-sequence '(env) (list target)
          `((assign ,target
                    (op make-compiled-procedure)
                    (label ,proc-entry)
                    (reg env)))))
        (compile-lambda-body exp proc-entry cenv))
       after-lambda))))

(define (compile-lambda-body exp proc-entry cenv)
  (let ((formals (lambda-parameters exp)))
    (append-instruction-sequences
     (make-instruction-sequence '(env proc argl) '(env)
      `(,proc-entry
        (assign env (op compiled-procedure-env) (reg proc))
        (assign env
                (op extend-environment)
                (const ,formals)
                (reg argl)
                (reg env))))
     (compile-sequence (lambda-body exp) 'val 'return (cons formals cenv) ))))


;;;SECTION 5.5.3

;;;combinations

(define (compile-application exp target linkage cenv)
  (let ((proc-code (compile (operator exp) 'proc 'next cenv))
        (operand-codes
         (map (lambda (operand) (compile operand 'val 'next cenv))
              (operands exp))))
    (preserving '(env continue)
     proc-code
     (preserving '(proc continue)
      (construct-arglist operand-codes)
      (compile-procedure-call target linkage cenv)))))

(define (construct-arglist operand-codes)
  (let ((operand-codes (reverse operand-codes)))
    (if (null? operand-codes)
        (make-instruction-sequence '() '(argl)
         '((assign argl (const ()))))
        (let ((code-to-get-last-arg
               (append-instruction-sequences
                (car operand-codes)
                (make-instruction-sequence '(val) '(argl)
                 '((assign argl (op list) (reg val)))))))
          (if (null? (cdr operand-codes))
              code-to-get-last-arg
              (preserving '(env)
               code-to-get-last-arg
               (code-to-get-rest-args
                (cdr operand-codes))))))))

(define (code-to-get-rest-args operand-codes)
  (let ((code-for-next-arg
         (preserving '(argl)
          (car operand-codes)
          (make-instruction-sequence '(val argl) '(argl)
           '((assign argl
              (op cons) (reg val) (reg argl)))))))
    (if (null? (cdr operand-codes))
        code-for-next-arg
        (preserving '(env)
         code-for-next-arg
         (code-to-get-rest-args (cdr operand-codes))))))

;;;applying procedures

(define (compile-procedure-call target linkage)
  (let ((primitive-branch (make-label 'primitive-branch))
        (compiled-branch (make-label 'compiled-branch))
        (after-call (make-label 'after-call)))
    (let ((compiled-linkage
           (if (eq? linkage 'next) after-call linkage)))
      (append-instruction-sequences
       (make-instruction-sequence '(proc) '()
        `((test (op primitive-procedure?) (reg proc))
          (branch (label ,primitive-branch))))
       (parallel-instruction-sequences
        (append-instruction-sequences
         compiled-branch
         (compile-proc-appl target compiled-linkage))
        (append-instruction-sequences
         primitive-branch
         (end-with-linkage linkage
          (make-instruction-sequence '(proc argl)
                                     (list target)
           `((assign ,target
                     (op apply-primitive-procedure)
                     (reg proc)
                     (reg argl)))))))
       after-call))))

;;;applying compiled procedures

(define (compile-proc-appl target linkage)
  (cond ((and (eq? target 'val) (not (eq? linkage 'return)))
         (make-instruction-sequence '(proc) all-regs
           `((assign continue (label ,linkage))
             (assign val (op compiled-procedure-entry)
                         (reg proc))
             (goto (reg val)))))
        ((and (not (eq? target 'val))
              (not (eq? linkage 'return)))
         (let ((proc-return (make-label 'proc-return)))
           (make-instruction-sequence '(proc) all-regs
            `((assign continue (label ,proc-return))
              (assign val (op compiled-procedure-entry)
                          (reg proc))
              (goto (reg val))
              ,proc-return
              (assign ,target (reg val))
              (goto (label ,linkage))))))
        ((and (eq? target 'val) (eq? linkage 'return))
         (make-instruction-sequence '(proc continue) all-regs
          '((assign val (op compiled-procedure-entry)
                        (reg proc))
            (goto (reg val)))))
        ((and (not (eq? target 'val)) (eq? linkage 'return))
         (error "return linkage, target not val -- COMPILE"
                target))))

;; footnote
(define all-regs '(env proc val argl continue))


;;;SECTION 5.5.4

(define (registers-needed s)
  (if (symbol? s) '() (car s)))

(define (registers-modified s)
  (if (symbol? s) '() (cadr s)))

(define (statements s)
  (if (symbol? s) (list s) (caddr s)))

(define (needs-register? seq reg)
  (memq reg (registers-needed seq)))

(define (modifies-register? seq reg)
  (memq reg (registers-modified seq)))


(define (append-instruction-sequences . seqs)
  (define (append-2-sequences seq1 seq2)
    (make-instruction-sequence
     (list-union (registers-needed seq1)
                 (list-difference (registers-needed seq2)
                                  (registers-modified seq1)))
     (list-union (registers-modified seq1)
                 (registers-modified seq2))
     (append (statements seq1) (statements seq2))))
  (define (append-seq-list seqs)
    (if (null? seqs)
        (empty-instruction-sequence)
        (append-2-sequences (car seqs)
                            (append-seq-list (cdr seqs)))))
  (append-seq-list seqs))

(define (list-union s1 s2)
  (cond ((null? s1) s2)
        ((memq (car s1) s2) (list-union (cdr s1) s2))
        (else (cons (car s1) (list-union (cdr s1) s2)))))

(define (list-difference s1 s2)
  (cond ((null? s1) '())
        ((memq (car s1) s2) (list-difference (cdr s1) s2))
        (else (cons (car s1)
                    (list-difference (cdr s1) s2)))))

(define (preserving regs seq1 seq2)
  (if (null? regs)
      (append-instruction-sequences seq1 seq2)
      (let ((first-reg (car regs)))
        (if (and (needs-register? seq2 first-reg)
                 (modifies-register? seq1 first-reg))
            (preserving (cdr regs)
             (make-instruction-sequence
              (list-union (list first-reg)
                          (registers-needed seq1))
              (list-difference (registers-modified seq1)
                               (list first-reg))
              (append `((save ,first-reg))
                      (statements seq1)
                      `((restore ,first-reg))))
             seq2)
            (preserving (cdr regs) seq1 seq2)))))

(define (tack-on-instruction-sequence seq body-seq)
  (make-instruction-sequence
   (registers-needed seq)
   (registers-modified seq)
   (append (statements seq) (statements body-seq))))

(define (parallel-instruction-sequences seq1 seq2)
  (make-instruction-sequence
   (list-union (registers-needed seq1)
               (registers-needed seq2))
   (list-union (registers-modified seq1)
               (registers-modified seq2))
   (append (statements seq1) (statements seq2))))


'(COMPILER LOADED)
