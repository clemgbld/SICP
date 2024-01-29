(load "ch-2/ex-2-67.scm")
(load "ch-2/ex-2-68.scm")


(define (adjoin-set x set) 
    (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
        (adjoin-set x (cdr set))))))


(define (generate-huffman-tree pairs) 
    (successive-merge (make-leaf-set pairs)))

(define (make-leaf-set pairs) (if (null? pairs)
'()
(let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
;symbol
; frequency
(make-leaf-set (cdr pairs))))))

(define (successive-merge leaves) 
    (cond ((null? leaves) '()) 
          ((= (length leaves) 1) (car leaves))
          (else 
          (successive-merge 
          (adjoin-set (make-code-tree (car leaves) (cadr leaves)) 
          (cddr leaves))))))


