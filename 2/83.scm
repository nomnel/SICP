; 整数   -> integer
; 有理数 -> rational
; 実数   -> real
; 複素数 -> complex

(define (raise x)
  (apply-generic 'raise x))

(define (make-integer x)
  (attach-tag 'integer x))

(define (make-rational n d)
  (attach-tag 'rational
	      (let ((g (gcd n d)))
		(cons (/ n g) (/ d g)))))

(define (make-real x)
  (attach-tag 'real x))

(define (make-complex r a)
  (attach-tag 'complex (cons r a)))

; install-integer-packageに追加
(put 'raise '(integer)
     (lambda (x) (make-rational x 1)))

; install-rational-packageに追加
(put 'raise '(rational)
     (lambda (x) (make-real (/ (car x) (cdr x)))))

; install-real-packageに追加
(put 'raise '(real)
     (lambda (x) (make-complex x 0)))
