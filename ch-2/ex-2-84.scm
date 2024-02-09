(load "functions/functions.scm")
(load "ch-2/ex-2-83")

(define tower '(scheme-number rational real complex))

(define (raise-to target-type x) 
    (let ((target-type-index (find-index target-type tower))
          (type-index (find-index (type-tag x) tower)))
            ((repeated raise-type (- target-type-index type-index))x)))

(define (find-index target l) 
    (define (recur n lst) 
        (cond ((null? lst) #f) 
            ((equal? target (car lst)) n)
                (else (recur (+ 1 n) (cdr lst)))))
                    (recur 0 l))

(define (find-higher-type type1 type2) 
    (let ((type1-index (find-index type1 tower)) 
        (type2-index (find-index type2 tower)))
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