(define (square-list items)
  (if (null? items)
      nil
      (cons (expt (car items) 2)
	    (square-list (cdr items)))))

(define (square-list items)
  (map (lambda (x) (expt x 2)) items))
