(add-load-path "." :relative)
(use chap2)

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
		(+ (* higher-terms x) this-coeff))
	      0
	      coefficient-sequence))
