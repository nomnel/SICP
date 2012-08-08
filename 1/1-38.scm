(add-load-path "." :relative)
(use sicp-1)

(+ 2
   (cont-frac (lambda (i) 1.0)
	      (lambda (i) (if (= (remainder i 3) 2)
			      (* (+ (quotient i 3.0) 1.0) 2.0)
			      1.0))
	      20))
