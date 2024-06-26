(define (simple-query-without-delay query-pattern frame-stream) 
    (stream-flatmap
    (lambda (frame) (stream-append
      (find-assertions query-pattern frame)
      (apply-rules query-pattern frame)))
   frame-stream))

(define (disjoin-without-delay disjuncts frame-stream) 
(if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave
       (qeval (first-disjunct disjuncts)
              frame-stream)
       (disjoin (rest-disjuncts disjuncts)
                frame-stream))))

(define (simple-query query-pattern frame-stream)
  (stream-flatmap
   (lambda (frame)
     (stream-append-delayed
      (find-assertions query-pattern frame)
      (delay (apply-rules query-pattern frame))))
   frame-stream))

(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
      (interleave-delayed
       (qeval (first-disjunct disjuncts) frame-stream)
       (delay (disjoin (rest-disjuncts disjuncts)
                       frame-stream)))))

;those delayed are for postponing infinite loop by postponing the computation of the second stream of append and interleave  

;this query would cause an infinite loop like with delayed but display no message 

 (rule (son ?x ?y) 
       (son ?x ?y))