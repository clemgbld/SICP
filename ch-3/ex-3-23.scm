(define (front-ptr dequeue) (car dequeue))

(define (rear-ptr dequeue) (cdr dequeue))

(define (set-front-ptr! dq item)
    (set-car!  dq item))

(define (set-rear-ptr! dq item)
    (set-cdr!   dq item))

(define (set-rear-rear-ptr! dq item) 
    (set-cdr! dq item))

(define (empty-dequeue? dequeue)
    (null? (front-ptr dequeue)))

(define (make-dequeue)
    (cons '() '()))

(define (front-dequeue dq) 
    (if (empty-dequeue? dq)
      (error "FRONT called with an empty dequeue" dq)
      (curr (front-ptr dq))))

(define (rear-dequeue dq) 
    (if (empty-dequeue? dq)
      (error "REAR called with an empty dequeue" dq)
      (curr (rear-ptr dq))))

(define (dequeue-to-list dq) 
(if (empty-dequeue? dq) 
    '() 
    (cons (front-dequeue dq) 
        (dequeue-to-list 
        (cons (next (front-ptr dq)) (rear-ptr dq))))))

(define (make-node prev curr next) 
    (cons (cons prev curr) next))

(define (curr node) 
    (cdar  node))

(define (next node)
    (cdr node))

(define (prev node)
    (caar node))

(define (set-prev! node prev-node) 
    (set-car! (car node) prev-node))

(define (set-next! node next-node)
    (set-cdr! node next-node))

(define (front-insert-dequeue! dq item) 
        (cond ((empty-dequeue? dq) 
            (let ((first-node (make-node '() item '())))
                (set-front-ptr! dq  first-node )
                (set-rear-ptr! dq first-node)
                dq))
            (else (let ((first-node (make-node '() item  (front-ptr dq))))
                (set-prev! (front-ptr dq) first-node)
                    (set-front-ptr! dq first-node)
                    dq))))

(define (rear-insert-dequeue! dq item)
    (cond ((empty-dequeue? dq) 
            (let ((first-node (make-node '() item '())))
                (set-front-ptr! dq  first-node )
                (set-rear-ptr! dq first-node)
                dq))
            (else (let ((last-node (make-node (rear-ptr dq) item '())))
                (set-next! (rear-ptr dq) last-node)
                (set-rear-ptr! dq last-node)))))

(define (front-delete-dequeue! dq) 
    (cond ((empty-dequeue? dq)
      (error "FRONT DELETE called with an empty dq" dq))
      (else 
        (set-front-ptr! dq (next (front-ptr dq)))
        (set-prev! (front-ptr dq) '()))))

(define (rear-delete-dequeue! dq) 
    (cond ((empty-dequeue? dq)
      (error "REAR DELETE called with an empty dq" dq))
      (else 
            (set-next! (prev (rear-ptr dq)) '())
            (set-rear-ptr! dq (prev (rear-ptr dq)))
            dq)))