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
          (apply proc (map contents args))
          (if (and (= (length args) 2)
		   (not (eq? (car type-tags) (cadr type-tags))))
	      (apply-generic op (coerce-to-samy-type (car args) (cadr args)))
	      (error "No method for these types"
		     (list op type-tags)))))))
