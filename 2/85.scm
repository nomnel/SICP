(load "83.scm")

(define (project x)
  (apply-generic 'project x))

; install-complex-packageに追加
(put 'project '(complex)
     (lambda (x) (make-real (real-part x))))

; install-real-packageに追加
(put 'project '(real)
     (lambda (x) (make-rational (inexact->exact x) 1)))

; install-rational-packageに追加
(put 'project '(rational)
     (lambda (x) (make-integer
		  (inexact->exact (round (/ (numer x) (denom x)))))))

(define (drop x)
  (let ((proc (get 'project (type-tag x))))
    (if proc
	(let ((y (proc x)))
	  (if (equ? x (raise y))
	      (drop y) x)))))

(define (apply-generic op . args)
  (define (coerce-to-same-type a1 a2)
    (define (same-type? a b)
      (eq? (type-tag a) (type-tag b)))
    (define (lower-or-eq? l h)
      (if (same-type? l h) #t
	  (let ((raise-proc (get 'raise (type-tag l))))
	    (if raise-proc
		(lower-or-eq? (raise-proc l) h)
		#f))))
    (define (raise-until-same-type l h)
      (if (same-type? l h) (list l h)
	  (raise-until-same-type ((get 'raise (type-tag l)) l)
				 h)))
    (if (lower-or-eq? a1 a2)
	(raise-until-same-type a1 a2)
	(reverse (raise-until-same-type a2 a1))))
  
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (drop (apply proc (map contents args))) ; drop 他は84.scmと同じ
          (if (and (= (length args) 2)
		   (not (eq? (car type-tags) (cadr type-tags))))
	      (apply-generic op (coerce-to-samy-type (car args) (cadr args)))
	      (error "No method for these types"
		     (list op type-tags)))))))
