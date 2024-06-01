(load "functions/functions.scm")

(define (liars)
    (map (lambda (rank)
        (map list '(betty ethel joan kitty mary) rank)) 
        (filter 
            is-ranking-valid?
            (permutations (enumerate-interval 1 5)))))

(define (is-ranking-valid? ranking)
    (let ((betty (list-ref ranking 0))
        (ethel (list-ref ranking 1))
        (joan (list-ref ranking 2))
        (kitty (list-ref ranking 3))
        (mary (list-ref ranking 4)))
        (cond 
           ((eq? (= kitty 2) (= betty 3)) false) 
           ((eq? (= ethel 1) (= joan 2)) false) 
          ((eq? (= joan 3) (= ethel 5))false) 
          ((eq? (= kitty 2) (= mary 4))false) 
            ((eq? (= mary 4) (= betty 1)) false)
            (else true))))