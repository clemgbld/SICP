(load "test-manager/load.scm")
(load "ch-3/ex-3-23.scm")

(define-each-test
(let ((dq (make-dequeue)))
    (front-insert-dequeue! dq 'a)
    (check (equal? (cons '(a) (cons 'a '())) dq) "should be able to add an item in the front of the dequeue when the dequeue is empty"))

(let ((dq (make-dequeue)))
    (front-insert-dequeue! dq 'a)
    (front-insert-dequeue! dq 'b)
    (check (equal? (cons '(b a) (cons 'a '())) dq) "should add an item to the front of the dequeue when there is already some item in the dequeue"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (check (equal? (cons '(a) (cons 'a '())) dq) "should be able to an item at the end of the dequeue when the dequeue is empty"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (check (equal? (cons '(a b) (cons 'b '())) dq) "should be able to an item at the end of the dequeue when the dequeue is not empty"))

(let ((dq (make-dequeue)))
    (front-insert-dequeue! dq 'a)
    (check (equal? 'a (front-dequeue dq)) "should be able to get the first element of the dequeue"))

(let ((dq (make-dequeue)))
    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (check (equal? 'b (rear-dequeue dq)) "should be able to get the rear of a dequeue"))

(let ((dq (make-dequeue)))

    (rear-insert-dequeue! dq 'a)
    (rear-insert-dequeue! dq 'b)
    (rear-insert-dequeue! dq 'c)
    (front-delete-dequeue! dq)

    (check (equal? (cons '(b c) (cons 'c '()))) "should be able to delete the first element of a dequeue"))
)



(run-registered-tests)