 (define (first-term term-list) 
     (make-term (- (length term-list) 1) (car term-list))) 
  
 (define (adjoin-term term term-list) 
     (let ((coeff-term (coeff term)) 
           (order-term (order term)) 
           (length-terms (length term-list))) 
       (cond 
         ((= order-term length-terms) (cons coeff-term term-list)) 
         ((< order-term length-terms) (error "Cannot adjoin lower-order term to terms")) 
         (else (cons coeff-term (adjoin-term (make-term (- order-term 1) 0) term-list)))))) 
  