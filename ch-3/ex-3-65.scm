(load "ch-3/ex-3-55.scm")
(load "functions/streams.scm")

(define (ln-summands n)
    (cons-stream (/ 1.0 n) (stream-map - (ln-summands (+ n 1)))))

(define ln-stream (partial-sums (ln-summands 1)))

(display-stream ln-stream)

; the series converge pretty fast toward about the 50th element of the stream
