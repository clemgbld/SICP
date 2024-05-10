
; Authors's analyze-sequence
(define (analyze-sequence exps) 
    (define (sequentially proc1 proc2)
        (lambda (env) (proc1 env) (proc2 env)))
    (define (loop first-proc rest-procs)
        (if (null? rest-procs) 
            first-proc
            (loop 
                (sequentially 
                    first-proc 
                    (car rest-procs))
                    (cdr rest-procs))))
    (let ((procs (map analyze exps)))
        (if (null? procs) 
            (error "Empty sequence: ANALYZE")) 
            (loop (car procs) (cdr procs))))

;for 1 exp
;first-proc
;for 2 exp
;(lambda (env) (proc1 env) (proc2 env))

; Alyssa's analyze-sequence
(define (alyssa-analyze-sequence exps) 
    (define (execute-sequence procs env)
        (cond ((null? (cdr procs)) ((car procs) env))
            (else ((car procs) env)
                (execute-sequence (cdr procs) env))))
    (let ((procs (map analyze exps))) 
        (if (null? procs)
            (error "Empty sequence: ANALYZE")) 
            (lambda (env) (execute-sequence procs env))))

;for 1 exp
;(lambda (env) (execute-sequence procs env))
;for 2 exp
;(lambda (env) (execute-sequence procs env))

; When Eva Luthor said that the authors's analyze-sequence does more work at analysis time
;it is because it loops at analyze time to compose the multiple expression into just one function so it is O(n) at analyze time
; and O(1) at excecution time when the only work to do is to call the function created at analyze time
;However for Alyssa's analyze-sequence more work is done at execution time (because the procedure executed is O(n) because of the loop that call each procedure) and as much work as the authors's analyze-sequences is done at analyze time
;because of the (map analyze exps).
;So Alyssa analyze-sequence is overall less performant