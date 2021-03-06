; キューに必要なのは
; make-queue, empty-queue?, front-queue, insert-queue!, delete-queue!

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (queue)
      (cons front-ptr rear-ptr))
    (define (empty?)
      (null? front-ptr))
    (define (front)
      (car (front-ptr)))
    (define (insert! item)
      (let ((new-pair (cons item '())))
	(cond ((empty?)
	       (set! front-ptr new-pair)
	       (set! rear-ptr new-pair)
	       (queue))
	      (else
	       (set-cdr! rear-ptr new-pair)
	       (set! rear-ptr new-pair)
	       (queue)))))
    (define (delete!)
      (cond ((empty?)
	     (error "DELETE! called with an empty queue"))
	    (else
	     (set! front-ptr (cdr front-ptr))
	     (queue))))
	     
    (define (dispatch m)
      (cond ((eq? m 'empty?) empty?)
	    ((eq? m 'front) front)
	    ((eq? m 'insert!) insert!)
	    ((eq? m 'delete!) delete!)
	    (else (error "Unknown request -- make-queue" m))))
    dispatch))

(define q1 (make-queue))
((q1 'insert!) 'a)
; -> ((a) a)
((q1 'insert!) 'b)
; -> ((a b) b)
((q1 'delete!))
; -> ((b) b)
((q1 'delete!))
; -> (() b)
