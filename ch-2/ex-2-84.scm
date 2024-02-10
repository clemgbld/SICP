(load "functions/functions.scm")
(load "ch-2/ex-2-83")


(define (raise-to target-type x) 
    (let ((target-type-index (find-type-index target-type ))
          (type-index (find-type-index (type-tag x) )))
            ((repeated raise-type (- target-type-index type-index))x)))

(define (find-type-index target) 
    (cond ((eq? target 'scheme-number) 0)
            ((eq? target 'rational ) 1)
            ((eq? target 'real) 2)
            ((eq? target 'complex) 3)
            (else (error "unknown type"))))

(define (find-higher-type type1 type2) 
    (let ((type1-index (find-type-index type1 )) 
        (type2-index (find-type-index type2 )))
            (if (> type1-index type2-index) 
                type1 
                type2)))

(define (apply-generic op . args)
    (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags))) 
    (if proc
(apply proc (map contents args)) 
(if (= (length args) 2)
(let ((type1 (car type-tags)) 
(type2 (cadr type-tags)) (a1 (car args))
(a2 (cadr args)))
(let 
((higher-type (find-higher-type type1 type2)))
(cond ((eq? type1 type2) (error "No method for these types" (list op type-tags))) 
    ((eq? higher-type type1) (apply-generic op a1 (raise-to type1 a2)))
    ((eq? higher-type type2) (apply-generic op (raise-to type2 a1) a2))
(else (error "No method for these types" (list op type-tags))))))
              (error "No method for these types"
                     (list op type-tags))))))) 