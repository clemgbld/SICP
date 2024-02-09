(define (inc n) 
(+ n 1))

(define (dec n) 
(- n 1))

(define (double n) 
(+ n n))

(define (divides? a b) (= (remainder b a) 0))

(define (identity x) x)

(define (gcd a b) (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (average . nums) 
(/ (sum nums) (length nums)))

(define (sum nums) (apply + nums))

(define (combinator fold apply) 
        (define (fn . fns) 
        (lambda (x) 
            (fold apply x fns)))
            fn)

(define (reverse-args func)
  (lambda args
    (apply func (reverse args))))

(define (apply-fn fn arg) 
(fn arg))

        
(define compose (combinator fold-right apply-fn))

(define pipe (combinator fold-left (reverse-args apply-fn)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2) 
        (< (abs (- v1 v2))
            tolerance))
            (define (try guess)
                (let ((next (f guess)))
                    (if (close-enough? guess next)
                        next
                        (try next))))
                            (try first-guess))


 (define (average-damp f) 
   (lambda (x) (average x (f x)))) 

(define (tree-map transform tree)
    (map (lambda (node) 
        (if (pair? node) (square-tree node)
            (transform node))) 
            tree))


(define (accumulate op initial sequence) 
    (if (null? sequence)
        initial
            (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree) 
    (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
            (else (append (enumerate-tree (car tree))
                (enumerate-tree (cdr tree))))))

(define (enumerate-interval low high) 
    (if (> low high)
        '()
            (cons low (enumerate-interval (+ low 1) high))))

(define (drop lst n)
  (if (or (null? lst) (<= n 0))
      lst
      (drop (cdr lst) (- n 1))))

(define (flatmap proc seq)
(fold-right append '() (map proc seq)))

(define (flat seq)
    (fold-right append '() seq))


(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (repeated f n)
  (cond ((< n 1) identity)
    ((= n 1) f)
      ((even? n) (repeated (compose f f) (/ n 2))) 
        (else (compose f (repeated f (- n 1))))))