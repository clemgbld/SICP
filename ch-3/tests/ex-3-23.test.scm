(load "test-manager/load.scm")
(load "functions/deep-equal.scm")
(load "ch-3/ex-3-23.scm")


(define-each-test
(check (equal? (cons '() '()) (make-dequeue)) "should be an empty dequeue")

(let ((dq (make-dequeue)))
    (front-insert-dequeue! dq 'a)
    (check (equal? '(a) (dequeue-to-list dq) ) "should be able to add an item in front of an empty dequeue"))

(let ((dq (make-dequeue)))
    (front-insert-dequeue! dq 'a)
    (front-insert-dequeue! dq 'b)
    (check (equal? '(b a) (dequeue-to-list dq) ) "should be able to add an item in front of a non empty dequeue"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (check (equal? '(a) (dequeue-to-list dq) ) "should be able to add an item at the end of an empty dequeue"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (check (equal? '(a b) (dequeue-to-list dq) ) "shoud be able to add an item at the end of a non empty"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (front-delete-dequeue! dq)
    (check (equal? '(b) (dequeue-to-list dq) ) "should be able to delete at the front of the dequeue"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (rear-delete-dequeue! dq)
    (check (equal? '(a) (dequeue-to-list dq) ) "should be able to delete at the end of the dequeue"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (check (equal? 'b (rear-dequeue dq) ) "should retrieve the last item of a dequeue"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (rear-delete-dequeue! dq)
    (front-insert-dequeue! dq 'c)
    (front-insert-dequeue! dq 'e)
    (front-delete-dequeue! dq)
    (check (equal? '(c a) (dequeue-to-list dq) ) "should pass the acceptance test"))

)



(run-registered-tests)