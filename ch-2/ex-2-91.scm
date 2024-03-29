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

 (define (div-poly p1 p2) 
     (if (same-variable? (variable p1) (variable p2)) 
         (let ((term-div-result (div-terms (term-list p1) (term-list p2)))) 
             (let ((quotient-term-list (car term-div-result) 
                   (remainder-term-list (cadr term-dev-result)))) 
                 (list (make-poly (variable p1) quotient-term-list) 
                       (make-poly (variable p1) remainder-term-list)))) 
         (error "Polys not in same var -- DIV-POLY" (list p1 p2)))) 