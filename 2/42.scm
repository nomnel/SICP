(add-load-path "." :relative)
(use chap2)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define empty-board '())

(define (safe? k positions)
  (define newone (car positions))
  (define (iter rest)
    (if (null? rest) #t
	(let ((oldone (car rest))
	      (dist (- k (length rest))))
	  (and (not (= newone oldone))
	       (not (= (- newone oldone) dist))
	       (not (= (- oldone newone) dist))
	       (iter (cdr rest))))))
  (iter (cdr positions)))
