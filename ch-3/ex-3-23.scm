(define (front-ptr dequeue) (car dequeue))

(define (rear-ptr dequeue) (cdr dequeue))

(define (set-front-ptr! dequeue item)
    (set-car! dequeue item))

(define (set-rear-ptr! dequeue item)
    (set-cdr! dequeue item))

(define (empty-dequeue? dequeue)
    (null? (front-ptr dequeue)))

(define (make-dequeue)
    (cons '() '()))

(define (front-dequeue dequeue) 
    (if (empty-dequeue? dequeue)
      (error "FRONT called with an empty dequeue" dequeue)
      (car (front-ptr dequeue))))

(define (rear-dequeue dequeue) 
    (if (empty-dequeue? dequeue)
      (error "REAR called with an empty dequeue" dequeue)
      (car (rear-ptr dequeue))))

(define (front-insert-dequeue! dequeue item)
    (cond 
        ((empty-dequeue? dequeue)
            (let ((new-pair (cons item '())))
                (set-front-ptr! dequeue new-pair)
                (set-rear-ptr! dequeue new-pair)
                dequeue))
        (else 
            (set-front-ptr! dequeue (cons item (front-ptr dequeue)))
            dequeue)))

(define (rear-insert-dequeue! dequeue item)
    (let ((new-pair (cons item '())))
        (cond ((empty-dequeue? dequeue) (set-front-ptr! dequeue new-pair)
                (set-rear-ptr! dequeue new-pair)
                dequeue)
                (else 
                    (set-cdr! (rear-ptr dequeue) new-pair)
                    (set-rear-ptr! dequeue new-pair)
                    dequeue))))

