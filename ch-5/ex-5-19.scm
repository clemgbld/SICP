(load "ch-5/ch5-regsim.scm")
(load "ch-3/ex-3-25.scm")

(define (get-first-label controller-text) 
  (if (null? controller-text) 
      #f 
      (let ((first (car controller-text)))
        (if (symbol? first) 
              first 
            (get-first-label (cdr controller-text))))))


(define (make-machine register-names ops controller-text)
  (let*  ((first-label (get-first-label controller-text) ) (machine (make-new-machine first-label)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    ((machine 'install-operations) ops)    
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))

(define (make-new-machine first-label)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '())
        (instruction-count 0)
        (label-count 0)
        (is-tracing #f)
        (current-label first-label)
        (breakpoints '())
        (from-breakpoint #f)
        )
    (let ((the-ops
           (list (list 'initialize-stack
                       (lambda () (stack 'initialize)))
                 (list 'print-stack-statistics
                       (lambda () (stack 'print-statistics)))))
          (register-table
           (list (list 'pc pc) (list 'flag flag))))
      (define (allocate-register name)
        (if (assoc name register-table)
            (error "Multiply defined register: " name)
            (set! register-table
                  (cons (list name (make-register name))
                        register-table)))
        'register-allocated)
      (define (lookup-register name)
        (let ((val (assoc name register-table)))
          (if val
              (cadr val)
              (error "Unknown register:" name))))

      (define (breakpoint?)
        (member (list current-label label-count) breakpoints ))



      (define (execute)
        (let ((insts (get-contents pc)))
          (if (null? insts)
              'done
              (begin
                (if (not from-breakpoint) (set! label-count (+ label-count 1)))
                (if (and (breakpoint?) (not from-breakpoint ) )  
                  (set! from-breakpoint #t) 
                  (begin 
                  (if is-tracing 
                  (begin 
                    (display (list "LABEL PRECEDING THE INSTRUCTION:" current-label) )
                    (newline)
                    (display (caar insts))
                    (newline)))
                (set! from-breakpoint #f) 
                ((instruction-execution-proc (car insts)))
                (set! instruction-count (+ instruction-count 1))
                (execute)))))))

      (define (reset-label-count) 
          (set! label-count 0))


      (define (reset-instruction-count) 
        (set! instruction-count 0)
        (display "INSTRUCTION COUNT RESET TO 0")
        (newline))

      (define (print-instruction-count)
        (display (list "INSTRUCTION COUNT=" instruction-count ) ))

      (define (trace-on!)
        (set! is-tracing #t)
        (display "TRACING TURNED ON" ))


      (define (trace-off!)
        (set! is-tracing #f)
        (display "TRACING TURNED OFF" ))

      (define (set-breakpoint label n)
        (display (list "BREAKPOINT LABEL: " label "POSITION: " n ) )
        (newline)
        (set! breakpoints (cons (list label n) breakpoints ) )
        )

      (define (set-label! label)
        (set! current-label label))

      (define (cancel-breakpoint label n )
        (let ((target (list label n) ))
          (set! 
            breakpoints 
            (filter 
              (lambda (b) (not (equal? b target)))
              breakpoints) )))

      (define (dispatch message)
        (cond ((eq? message 'start)
               (set! current-label first-label)
               (set-contents! pc the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq) (set! the-instruction-sequence seq)))
              ((eq? message 'allocate-register) allocate-register)
              ((eq? message 'get-register) lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops) (set! the-ops (append the-ops ops))))
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ((eq? message 'reset-instruction-count) reset-instruction-count)
              ((eq? message 'print-instruction-count) print-instruction-count)
              ((eq? message 'trace-on!) trace-on!)
              ((eq? message 'trace-off!) trace-off!)
              ((eq? message 'set-label!) set-label!)
              ((eq? message 'set-breakpoint) set-breakpoint)
              ((eq? message 'cancel-breakpoint) cancel-breakpoint)
              ((eq? message 'proceed-machine) (lambda () (execute)) )
              ((eq? message 'cancel-all-breakpoints) (lambda () (set! breakpoints '())))
              ((eq? message 'reset-label-count) reset-label-count)
              (else (error "Unknown request -- MACHINE" message))))
      dispatch)))

(define (proceed-machine machine) ((machine 'proceed-machine)))

(define (cancel-all-breakpoints machine)
  ((machine 'cancel-all-breakpoints)))


(define (set-breakpoint machine label n) 
   ((machine 'set-breakpoint ) label n) )

(define (cancel-breakpoint machine label n) 
   ((machine 'cancel-breakpoint) label n ))

(define (make-assign inst machine labels operations pc)
  (let ((target
         (get-register machine (assign-reg-name inst)))
        (value-exp (assign-value-exp inst)))
    (let ((value-proc
           (if (operation-exp? value-exp)
               (make-operation-exp
                value-exp machine labels operations)
               (make-primitive-exp
                (car value-exp) machine labels))))
      (lambda ()                ; execution procedure for assign
        (set-contents! target 
                       (if (label-exp? (car value-exp))
                         (cons (label-exp-label (car value-exp)) (value-proc)) 
                         (value-proc) ))
        (advance-pc pc)))))


(define (make-goto inst machine labels pc)
  (let ((dest (goto-dest inst)))
    (cond ((label-exp? dest)
           (let* ((label-text (label-exp-label dest)) (insts
                  (lookup-label labels
                                label-text)))
             (lambda () ((machine 'reset-label-count)) ( (machine 'set-label!) label-text) (set-contents! pc insts))))
          ((register-exp? dest)
           (let* ((label-text (register-exp-reg dest)) (reg
                  (get-register machine
                                label-text)))
             (lambda ()
              ((machine 'reset-label-count)) 
              ( (machine 'set-label!) (car (get-contents reg)))
               (set-contents! pc (cdr (get-contents reg))))))
          (else (error "Bad GOTO instruction -- ASSEMBLE"
                       inst)))))

(define (make-branch inst machine labels flag pc)
  (let ((dest (branch-dest inst)))
    (if (label-exp? dest)
        (let* ((label-text (label-exp-label dest)) (insts
               (lookup-label labels label-text)))
          (lambda ()
            (if (get-contents flag)
               (begin (set-contents! pc insts) 
                      ((machine 'reset-label-count))
                      ((machine 'set-label!) label-text)) 
                (advance-pc pc))))
        (error "Bad BRANCH instruction -- ASSEMBLE" inst))))

(define (reset-instruction-count machine) ((machine 'reset-instruction-count)))

(define (print-instruction-count machine) ((machine 'print-instruction-count)))

(define (trace-on! machine) ((machine 'trace-on!)))
(define (trace-off! machine) ((machine 'trace-off!)))

(define (make-register name)
  (let ((contents '*unassigned*) (is-tracing #f) )

    (define (trace-on!)
      (display (list "TRACING TURNED ON FOR REGISTER:" name) )
      (set! is-tracing #t))

(define (trace-off!)
      (display (list "TRACING TURNED OFF FOR REGISTER:" name) )
      (set! is-tracing #f))

    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value) (if is-tracing 
                               (begin 
                                 (display (list "REGISTER:" name " OLD-CONTENTS:" contents  " NEW-CONTENTS:" value) ) 
                                 (newline) 
                                 ))  
               (set! contents value)))
        ((eq? message 'trace-on!) trace-on!)
        ((eq? message 'trace-off!) trace-off!)
            (else
             (error "Unknown request -- REGISTER" message))))
    dispatch))

(define (get-contents register)
  (register 'get))

(define (set-contents! register value)
  ((register 'set) value))


(define (get-register-contents machine register-name)
  (get-contents (get-register machine register-name)))

(define (set-register-contents! machine register-name value)
  (set-contents! (get-register machine register-name) value)
  'done)

(define (trace-on-register! machine register-name)
 (((get-register machine register-name) 'trace-on!)))

(define (trace-off-register! machine register-name)
 (((get-register machine register-name) 'trace-off!)))

(define (get-register machine reg-name)
  ((machine 'get-register) reg-name))


