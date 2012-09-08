; install-rectangular-package内で修正
(define (magnitude z)
  (square-root (add (square (real-part z))
		    (square (imag-part z)))))

(define (angle z)
  (atangent (imag-part z) (real-part z)))

(define (make-from-mag-ang r a)
  (cons (mul r (cosine a)) (mul r (sine a))))

; install-polar-package内で修正
(define (real-part z)
  (mul (magnitude z) (cosine (angle z))))

(define (imag-part z)
  (mul (magnitude z) (sine (angle z))))

(define (make-from-real-imag x y)
  (cons (square-root (add (square x) (square y)))
	(atangent y x)))

; install-integer-package内で追加
(put 'sine '(integer)
     (lambda (x) (tag (sin x))))

(put 'cosine '(integer)
     (lambda (x) (tag (cos x))))

(put 'atangent '(integer integer)
     (lambda (x y) (tag (atan x y))))

(put 'square '(integer)
     (lambda (x) (tag (* x x))))

(put 'square-root '(integer)
     (lambda (x) (tag (sqrt x))))

; install-rational-package内で追加
(put 'sine '(rational)
     (lambda (x) (tag (sin (/ (numer x) (denom x))))))

(put 'cosine '(rational)
     (lambda (x) (tag (cos (/ (numer x) (denom x))))))

(put 'atangent '(rational rational)
     (lambda (x y) (tag (atan (/ (numer x) (denom x))
			      (/ (numer y) (denom y))))))

(put 'square '(rational)
     (lambda (x) (tag (mul-rat x x))))

(put 'square-root '(rational)
     (lambda (x) (make-rat (sqrt (numer x))
			   (sqrt (denom x)))))

; install-integer-package内で追加
(put 'sine '(real)
     (lambda (x) (tag (sin x))))

(put 'cosine '(real)
     (lambda (x) (tag (cos x))))

(put 'atangent '(real real)
     (lambda (x y) (tag (atan x y))))

(put 'square '(real)
     (lambda (x) (tag (* x x))))

(put 'square-root '(real)
     (lambda (x) (tag (sqrt x))))
