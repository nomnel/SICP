(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment s e)
  (cons s e))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (midpoint-segment seg)
  (define (average a b)
    (/ (+ a b) 2))
  (make-point (average (x-point (start-segment seg))
		       (x-point (end-segment seg)))
	      (average (y-point (start-segment seg))
		       (y-point (end-segment seg)))))
