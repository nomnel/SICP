; a
; number?, variable?にはタグがないから

(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))


; b
(define (make operator ex1 ex2)
  ((get 'make operator) ex1 ex2))

; +のパッケージ
(define (install-deriv-sum-package)
  (define addend car)
  (define augend cadr)

  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))

  (define (deriv-sum exp var)
    (make '+
      (deriv (addend exp) var)
      (deriv (augend exp) var)))
  
  (put 'deriv '+ deriv-sum)
  (put 'make  '+ make-sum))

(install-deriv-sum-package)

; *のパッケージ
(define (install-deriv-product-package)
  (define multiplier car)
  (define multiplicand cadr)

  (define (make-product ex1 ex2)
    (cond ((or (=number? ex1 0) (=number? ex2 0)) 0)
          ((=number? ex1 1) ex2)
          ((=number? ex2 1) ex1)
          ((and (number? ex1) (number? ex2)) (* ex1 ex2))
          (else (list '* ex1 ex2))))

  (define (deriv-product exp var)
    (make '+
      (make '*
	(multiplier exp)
	(deriv (multiplicand exp) var))
      (make '*
	(deriv (multiplier exp) var)
	(multiplicand exp))))
  
  (put 'deriv '* deriv-product)
  (put 'make  '* make-product))

(install-deriv-product-package)


; c
; **のパッケージ
(define (install-deriv-exponetiation-package)
  (define base car)
  (define exponent cadr)

  (define (make-exponentiation base exponent)
    (cond ((=number? exponent 0) 1)
	  ((=number? exponent 1) base)
	  (else (list '** base exponent))))
  
  (define (deriv-exponentiation exp var)
    (make '* (make '*
	       (exponent exp)
	       (make '** (base exp) (- (exponent exp) 1)))
	  (deriv (base exp) var)))
  
  (put 'deriv '* deriv-exponentiation)
  (put 'make  '* make-exponentiation))

(install-deriv-exponetiation-package)


; d
; 各手続きのputの演算と型を入れ替える
; (put <op> <type> <item>)
; -> (put <type> <op> <item>)

