(load "functions/functions.scm")

(define (multiple-dwelling)
    (map (lambda (floors)
        (map list '(baker cooper fletcher miller smith) floors)) 
        (filter 
            is-multiple-dwelling-valid?
            (permutations (enumerate-interval 1 5)))))
  
(define (is-multiple-dwelling-valid? floors)
    (let ((baker (list-ref floors 0))
          (cooper (list-ref floors 1))
          (fletcher (list-ref floors 2))
          (miller (list-ref floors 3))
          (smith (list-ref floors 4)))
        (and 
            (not (= baker  5)) 
            (not (= cooper 1))
            (not (= fletcher 5))
            (not (= fletcher 1))
            (> miller cooper)
            (not (is-adjacent? smith fletcher))
            (not (is-adjacent? fletcher cooper)))))

(define (is-adjacent? x y)
    (= (abs (- x y)) 1))