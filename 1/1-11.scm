; recursive
(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

; iterative
(define (f n)
  (define (f-iter count a b c)
    (cond ((= count 0) c)
	  ((= count 1) b)
	  ((= count 2) a)
	  (else (f-iter (+ a (* 2 b) (* 3 c)) (- count 1)))))
  (f-iter n 2 1 0))