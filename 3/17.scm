(define (count-pairs x)
  (define (record '()))
  (define (count x)
    (cond ((not (pair? x)) 0)
	  ((memq x record) 0)
	  (else (set! record (cons x record))
		(+ (count (car x))
		   (count (cdr x))
		   1))))
  (count x))

(count-pairs (cons 'a (cons 'b (cons 'c 'd))))
; -> 3
(define b (cons 'a 'a))
(define c (cons b b))
(count-pairs (cons 'd c))
; -> 3
(count-pairs (cons c c))
; -> 3
