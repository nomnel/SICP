(add-load-path ".")
(use sicp-1)

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (* x (+ (* x (+ x a)) b)) c)))

(newton-method (cubic 1 1 1) 1)
