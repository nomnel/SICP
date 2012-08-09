(add-load-path "." :relative)
(use sicp-1)

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter g)
      (if (good-enough? g) g
	  (iter (improve g))))
    (iter guess)))

(define (sqrt x)
  ((iterative-improve (lambda (guess) (< (abs (- (square guess) x)) 0.0001))
		      (lambda (guess) (average guess (/ x guess))))
   1.0))

(define (fixed-point f)
  ((iterative-improve (lambda (guess) (< (abs (- guess (f guess))) 0.00001))
		      f)
   1.0))
