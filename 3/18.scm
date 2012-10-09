(define (find-cycle lst)
  (define record '())
  (define (walk ls)
    (if (memq ls record) #t
	(begin
	  (set! record (cons ls record))
	  (if (not (pair? ls)) #f
	      (begin (walk (car ls))
		     (walk (cdr ls)))))))
  (walk lst))


(define a '(b c d))
(find-cycle a) ; -> #f
(set-cdr! (last-pair a) a)
(find-cycle a) ; -> #t
