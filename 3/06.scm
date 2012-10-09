(define rand
  (let ((x random-init))
    (lambda (m)
      (cond ((eq? m 'generate)
	     (set! x (rand-update x)) x)
	    ((eq? m 'reset)
	     (lambda (new-value)
	       (set! x new-value) x))
	    (else (error "Unknown request -- RAND" m))))))
