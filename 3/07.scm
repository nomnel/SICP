(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (joint new-password)
    (let ((joint-pw new-password))
      (lambda (pw m)
	(if (eq? pw joint-pw)
	    (cond ((eq? m 'withdraw) withdraw)
		  ((eq? m 'deposit) deposit)
		  (else (error "Unknown request -- MAKE-ACCOUNT"
			       m)))
	    login-error))))
  (define (login-error amount)
    "Incorrect password")
  (define (dispatch pw m)
    (if (eq? pw password)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      ((eq? m 'joint) joint)
	      (else (error "Unknown request -- MAKE-ACCOUNT"
			   m)))
	login-error))
  dispatch)

(define (make-joint account password new-password)
  ((account password 'joint) new-password))

(define acc (make-account 100 'secret-password))
(define joint-acc (make-joint acc 'secret-password 'joint-password))
((acc 'secret-password 'withdraw) 40) ; -> 60
((joint-acc 'joint-password 'withdraw) 40) ; -> 20
((acc 'joint-password 'withdraw) 40) ; -> "Incorrect password"
