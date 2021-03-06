(define (make-deque)
  (let ((front-ptr '())
	(rear-ptr '()))
    (define (make-unit item) (list item '() '()))
    (define (unit-item unit) (car unit))
    (define (unit-prev unit) (cadr unit))
    (define (unit-next unit) (caddr unit))
    (define (set-front-ptr! unit) (set! front-ptr unit))
    (define (set-rear-ptr! unit) (set! rear-ptr unit))
    (define (set-unit-prev! unit prev) (set! (cadr unit) prev)) ;(set! (unit-prev unit) prev)) だと落ちる
    (define (set-unit-next! unit next) (set! (caddr unit) next)) ;(set! (unit-next unit) next)) だと落ちる

    (define (empty?) (null? front-ptr))
    (define (front)
      (if (empty?)
	  (error "FRONT called with an empty deque")
	  (unit-item front-ptr)))
    (define (rear)
      (if (empty?)
	  (error "REAR called with an empty deque")
	  (unit-item rear-ptr)))
    (define (print-self)
      (define (iter unit result)
	(if (null? unit) result
	    (iter (unit-prev unit) (cons (unit-item unit) result))))
      (print (iter rear-ptr '())))
    (define (front-insert! item)
      (let ((new-unit (make-unit item)))
	(cond ((empty?)
	       (set-front-ptr! new-unit)
	       (set-rear-ptr! new-unit))
	      (else
	       (set-unit-prev! front-ptr new-unit)
	       (set-unit-next! new-unit front-ptr)
	       (set-front-ptr! new-unit))))
      (print-self))
    (define (rear-insert! item)
      (let ((new-unit (make-unit item)))
	(cond ((empty?)
	       (set-front-ptr! new-unit)
	       (set-rear-ptr! new-unit))
	      (else
	       (set-unit-next! rear-ptr new-unit)
	       (set-unit-prev! new-unit rear-ptr)
	       (set-rear-ptr! new-unit))))
      (print-self))
    (define (front-delete!)
      (if (empty?) (error "DELETE! called with an empty queue")
	  (begin
	    (set-front-ptr! (unit-next front-ptr))
	    (if (null? front-ptr)
		(set-rear-ptr! '())
		(set-unit-prev! front-ptr '()))))
      (print-self))
    (define (rear-delete!)
      (if (empty?) (error "DELETE! called with an empty queue")
	  (begin
	    (set-rear-ptr! (unit-prev rear-ptr))
	    (if (null? rear-ptr)
		(set-front-ptr! '())
		(set-unit-next! rear-ptr '()))))
      (print-self))

    (define (dispatch m)
      (cond ((eq? m 'empty?) (empty?))
	    ((eq? m 'front) (front))
	    ((eq? m 'rear) (rear))
	    ((eq? m 'print) (print-self))
	    ((eq? m 'front-insert!) front-insert!)
	    ((eq? m 'rear-insert!) rear-insert!)
	    ((eq? m 'front-delete!) (front-delete!))
	    ((eq? m 'rear-delete!) (rear-delete!))
	    (else
	     (error "Unknown request -- make-deque" m))))
    dispatch))

(define (empty-deque? deque) (deque 'empty?))
(define q (make-deque))
(empty-deque? q)
(empty-deque? q2)
(define (front-deque deque) (deque 'front))
(define (rear-deque deque) (deque 'rear))
(define (front-insert-deque! deque item)
  ((deque 'front-insert!) item))
(define (rear-insert-deque! deque item)
  ((deque 'rear-insert!) item))
(define (front-delete-deque! deque) (deque 'front-delete!))
(define (rear-delete-deque! deque) (deque 'rear-delete!))
