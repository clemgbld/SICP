(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
        (let ((proc (get op type-tags))) 
        (if proc
            (apply proc (map contents args)) 
                (if (> (length args) 1)
        (coearce-all type-tags op args) 
              (error "No method for these types"
                     (list op type-tags)))))))

(define (coearce-all type-tags op args ) 
     (define (recur  type-tags coearced-args arguments)
      (cond ((null? type-tags) (error "No method for these types" (list op type-tags)) )
             ((null? arguments) (apply-generic op coearced-arguments))
             ((not ((get-coercion (car type-tags) (type-tag (car arguments))) (car arguments)) ) (coearce-all (cdr type-tags) '() args))
             ((eq? (car type-tags) (type-tag (car arguments))) (coerce-all type-tags (append coearced-args (car arguments) ) (cdr arguments)))
             (else (coearce-all type-tags 
             (append coearced-args (((get-coercion (car type-tags) (type-tag (car arguments))) (car arguments)))) (cdr arguments)))))

      (if (every? (lambda (a) (eq? (car type-tags) (type-tag a))) args) (error "No method for these types" (list op type-tags)) 
      (recur type-tags '() args)) 
    )

(define (every? pred lst)
  (cond ((null? lst) #t)                 
        ((pred (car lst))                
         (every? pred (cdr lst)))       
        (else #f)))

; this algorithm and the last one don't take into account that a coercion works but not procedure is found although another coercion could have work either