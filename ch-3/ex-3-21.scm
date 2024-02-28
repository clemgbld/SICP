(define (front-ptr queue) (car queue)) 

(define (rear-ptr queue) (cdr queue)) 

(define (set-front-ptr! queue item)
    (set-car! queue item))

(define (set-rear-ptr! queue item)
    (set-cdr! queue item))

(define (empty-queue? queue) 
    (null? (front-ptr queue)))

(define (make-queue) 
    (cons '() '()))

(define (front-queue queue) 
    (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item) 
    (let ((new-pair (cons item '())))
        (cond ((empty-queue? queue) 
                    (set-front-ptr! queue new-pair) 
                    (set-rear-ptr! queue new-pair) 
                    queue)
        (else 
            (set-cdr! (rear-ptr queue) new-pair) 
            (set-rear-ptr! queue new-pair) 
            queue))))

(define (delete-queue! queue) 
    (cond ((empty-queue? queue)
        (error "DELETE! called with an empty queue" queue)) 
        (else 
            (set-front-ptr! queue 
            (cdr (front-ptr queue)))
            queue)))

(define (print-queue queue) 
    (display (front-ptr queue)))


; Ben complains because the lisp interpreter display the pair that encapsulate the front pointer which is the entire content of the queue and the rear pointer that is the last item of the queue
; So Eva propose to define our own printing method for our queue implementation that display only the content of the queue aka the front pointer of our representation of a queue
