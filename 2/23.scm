(define (for-each proc ls)
  (if (null? ls) #t
      (begin
	(proc (car ls))
	(for-each proc (cdr ls)))))
