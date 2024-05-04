(define the-empty-environment '())
(define (enclosing-environment env) (cdr env))
(define (first-frame env) (car env))
(define (frame-variables frame)(car frame))
(define (frame-values frame)(cdr frame))

;a

(define (lookup-variable-value var env)
    (define (env-loop env)
    (define (scan vars vals) 
    (cond ((null? vars)
       (env-loop (enclosing-environment env)))
        ((eq? var (car vars)) 
            (let ((found-val (car vals)))
                (if (eq? found-val '*unassigned*)
                    (error "Unassigned internal definition" found-val)
                    found-val)))
        (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment) 
        (error "Unbound variable" var) 
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
    (env-loop env))

;b 

(define (define-name exp) 
    (if (symbol? (cadr exp) ) 
        (cadr exp) 
        (caadr exp)))

(define (define-body exp)
    (if (symbol? (cadr exp))
        (caddr exp)
        (list 'lambda (cdadr exp) (caddr exp))))

(define (tagged-list? exp tag) (if (pair? exp)
            (eq? (car exp) tag)
            false))

(define (make-assginment var val)
    (list 'set! var val))

(define (make-define-assignment exp)
    (make-assginment (define-name exp) (define-body exp)))

(define (make-unassigned-define exp)
    (list (define-name exp) '*unassigned*))

(define (make-let vars  body)
    (cons 'let (cons vars body)))

(define (scan-out-defines body)
    (let ((defines 
        (filter (lambda (x) (tagged-list? x 'define)) body)))
        (if (not (null? defines)) 
         (make-let (map make-unassigned-define defines) 
         (append (map make-define-assignment defines) 
            (filter (lambda (x) (not (tagged-list? x 'define))) body)))   
            body)))

;c
 ; c  
 ; make-procedure is better because we can easily explore other transformations 
 ; along with the fact of repeated calculation everytime when procedure-body is accessed 


 (define (make-procedure parameters body env) 
     (list 'procedure parameters (scan-out-defines body) env)) 