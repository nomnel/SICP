(add-load-path "." :relative)
(use sicp-1)

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
	     (lambda (i) (- (* 2 i) 1.0))
	     k))

(tan-cf (/ 3.14159 4) 10)
