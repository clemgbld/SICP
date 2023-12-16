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

(define (average a b) 
(/ (+ a b) 2))

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

