(load "functions/functions.scm")

(define (the-empty-termlist) '()) 
   (define (rest-terms term-list) (cdr term-list)) 
   (define (empty-termlist? term-list) 
     (null? term-list)) 
   (define (make-term order coeff) 
     (list order coeff)) 
   (define (order term) (car term)) 
   (define (coeff term) (cadr term)) 

(define (adjoin-term term term-list) 
     (if (=zero? (coeff term)) 
         term-list 
         (cons term term-list)))

(define (first-term term-list) (car term-list)) 

 (define (div-terms L1 L2) 
     (if (empty-termlist? L1) 
         (list (the-empty-termlist) (the-empty-termlist)) 
         (let ((t1 (first-term L1) 
               (t2 (first-term L2)))) 
             (if (> (order t2) (order t1)) 
                 (list (the-empty-termlist) L1) 
                 (let ((new-c (div (coeff t1) (coeff t2))) 
                       (new-o (- (order t1) (order t2)))) 
                     (let ((rest-of-result 
                           (div-terms  
                               (sub-terms ( 
                                     L1  
                                     (mul-term-by-all-terms (make-term new-o new-c) L1)))  
                                L2))) 
                         (list (adjoin-term (make-term new-o new-c) (car rest-of-result)) 
                                (cadr rest-of-result))))))))


(define (gcd-terms a b) 
   (if (empty-termlist? b) 
     (let ((coeff-list (map cadr a)) 
            (gcd-coeff (apply gcd coeff-list))) 
       (div-terms a (make-term 0  gcd-coeff))) 
     (gcd-terms b (pseudoremainder-terms a b))))

(define (reduce-terms n d)
    (let ((g (gcd-terms n d)))
        (list (div-terms n g) (div-terms d g))))

(define (reduce-integers n d) 
    (let ((g (gcd n d)))
       (list (/ n g) (/ d g))))

(define (reduce-poly p1 p2)
(if (same-variable? (variable p1) (variable p2))
     (let ((result (reduce-terms (term-list p1) (term-list p2))))
        (list (make-polynomial (variable p1) (car result)) 
        (make-polynomial (variable p1) (cadr result)))) 
    (error "Polys not in same var: REDUCE-POLY" (list p1 p2))))

;In polynomial package

(put 'reduce '(polynomial polynomial) reduce-poly)

;In scheme number package

(put 'reduce '(scheme-number scheme-number) reduce-integers)

 ;; change in rational package 
 (define (make-rat n d) 
   (let ((r (reduce n d))) 
     (cons (car r) 
           (cadr r)))) 

(define (reduce n d) 
    (apply-generic 'reduce n d))