(define (install-terms-package) 
   ;; internal procedures 
  
   ;; not changed 
   (define (the-empty-termlist) '()) 
   (define (rest-terms term-list) (cdr term-list)) 
   (define (empty-termlist? term-list) 
     (null? term-list)) 
   (define (make-term order coeff) 
     (list order coeff)) 
   (define (order term) (car term)) 
   (define (coeff term) (cadr term)) 
  
   ;; sparse representation 
   (define (adjoin-term-sparse term term-list) 
     (if (=zero? (coeff term)) 
         term-list 
         (cons term term-list))) 
   (define (first-term-sparse term-list) (car term-list)) 
   ;; dense representation, from Exercise 2.89 
   (define (first-term-dense term-list) 
     (make-term (- (length term-list) 1) 
                (car term-list))) 
   (define (adjoin-term-dense term term-list) 
     (cond ((=zero? (coeff term)) term-list) 
           ((= (order term) (length (term-list))) 
            (cons (coeff term) term-list)) 
           (else (adjoin-term-dense term (cons 0 term-list))))) 
  
   ;; interface to the rest of the system 
   (define (tag-sparse x) (attatch-tag 'sparse x)) 
   (define (tag-dense x) (attatch-tag 'dense x)) 
   (define (tag-term x) (attatch-tag 'term x)) 
   (put 'adjoin-term '(term sparse) 
        (lambda (term term-list) 
          (tag-sparse (adjoin-term-sparse term term-list)))) 
   (put 'adjoin-term '(term dense) 
        (lambda (term term-list) 
          (tag-dense (adjoin-term-dense term term-list)))) 
   (put 'the-empty-termlist 'sparse 
        (lambda () (tag-sparse (the-empty-termlist)))) 
   (put 'the-empty-termlist 'dense 
        (lambda () (tag-dense (the-empty-termlist)))) 
   (put 'first-term '(sparse) 
        (lambda (term-list) 
          (tag-term (first-term-sparse term-list)))) 
   (put 'first-term '(dense) 
        (lambda (term-list) 
          (tag-term (first-term-dense term-list)))) 
   (put 'rest-terms '(sparse) 
        (lambda (term-list) 
          (tag-sparse (rest-terms term-list)))) 
   (put 'rest-terms '(dense) 
        (lambda (term-list) 
          (tag-dense (rest-terms term-list)))) 
   (put 'empty-termlist? '(sparse) 
        (lambda (term-list) (empty-termlist? term-list))) 
   (put 'empty-termlist? '(dense) 
        (lambda (term-list) (empty-termlist? term-list))) 
   (put 'make-term 'term 
        (lambda (order coeff) 
          (tag-term (make-term order coeff)))) 
   (put 'order '(term) order) 
   (put 'coeff '(term) coeff) 
   'done) 
  
 (define (adjoin-term term term-list) 
   (apply-generic 'adjoin-term term term-list)) 
 (define (first-term term-list) 
   (apply-generic 'first-term term-list)) 
 (define (rest-terms term-list) 
   (apply-generic 'rest-terms term-list)) 
 (define (empty-termlist? term-list) 
   (apply-generic 'empty-termlist? term-list)) 
 (define (order term) 
   (apply-generic 'order term)) 
 (define (coeff term) 
   (apply-generic 'coeff term)) 
  
 (define make-sparse-empty-termlist 
   (get 'the-empty-termlist 'sparse)) 
 (define make-dense-empty-termlist 
   (get 'the-empty-termlist 'dense)) 
 (define (make-term order coeff) 
   ((get 'make-term 'term) order coeff)) 
  
  
 ;; Define the-empty-termlist used in mul-terms 
 ;; and mul-term-by-all-terms. 
 ;; Here we use make-sparse-empty-list, but 
 ;; make-dense-empty-termlist is also fine. 
 (define the-empty-termlist make-sparse-empty-list) 