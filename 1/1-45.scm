(add-load-path "." :relative)
(use sicp-1)

(define (nth-root x n)
  (let1 c (floor (/ (log n) (log 2)))
    (fixed-point ((repeated average-damp c)
		  (lambda (y) (/ x (expt y (- n 1)))))
		 1.0)))
