(load "functions/streams.scm")

(define factorials  
    (cons-stream 1 (mul-streams factorials integers)))