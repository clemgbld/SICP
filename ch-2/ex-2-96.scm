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

;a

(define (pseudoremainder-terms a b) 
    (let ((O1 (order (first-term (term-list a)))) 
          (O2 (order (first-term (term-list b))))
          (c (coeff (first-term (term-list b)))))
         (cadr (div-terms 
            (mul-terms (make-term 0 (exp c (+ 1 (- O1 O2)))) a) 
                    (term-list b)))))

(define (gcd-terms a b) 
(if (empty-termlist? b)
      a
      (gcd-terms b (pseudoremainder-terms a b))))

;b
(define (gcd-terms a b) 
   (if (empty-termlist? b) 
     (let ((coeff-list (map cadr a)) 
            (gcd-coeff (apply gcd coeff-list))) 
       (div-terms a (make-term 0  gcd-coeff))) 
     (gcd-terms b (pseudoremainder-terms a b)))) 