(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car p)
  (define (iter res q)
    (if (not (even? q))
	res
	(iter (+ res 1) (/ q 2))))
  (iter 0 p))

(define (cdr p)
  (define (iter res q)
    (if (> 0 (modulo q 3))
	res
	(iter (+ res 1) (/ q 3))))
  (iter 0 p))
