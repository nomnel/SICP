;a
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list m1 '* m2))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (addend s) (car s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))


;b
(define (infix->prefix exp)
  (define (i->p exp)
    (list (cadr exp)
	  (infix->prefix (car exp))
	  (infix->prefix (caddr exp))))
  (cond ((number? exp) exp)
	((symbol? exp) exp)
	((eq? (car exp) '+) exp)
	((eq? (car exp) '*) exp)
	((null? (cdr exp)) (infix->prefix (car exp)))
	((= (length exp) 3) (i->p exp))
	((> (length exp) 4)
	 (cond ((eq? (cadr exp) (cadddr exp)) ; (a + b + c ...) or (a * b * c ...)
		(infix->prefix (cons (i->p exp) (cdddr exp))))
	       ((and (eq? (cadr exp) '*) (eq? (cadddr exp) '+)) ; (a * b + c ...)
		(list '+ (i->p exp) (infix->prefix (cddddr exp))))
	       ((and (eq? (cadr exp) '+) (eq? (cadddr exp) '*)) ; (a + b * c ...)
		(list '+ (infix->prefix (car exp)) (infix->prefix (cddr exp))))))
	(else (error "oops, something went wrong! exp =" exp))))

(infix->prefix '(a + b * c + d * e * f + g)) ;-> (+ a (+ (* b c) (+ (* (* d e) f) g)))
(infix->prefix '(a * b + (c + d + e))) ;-> (+ (* a b) (+ (+ c d) e))
(infix->prefix '(a + b * (c + d + e))) ;-> (+ a (* b (+ (+ c d) e)))
