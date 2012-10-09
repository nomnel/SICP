; 答え見た(http://sicp.ipl.t.u-tokyo.ac.jp/solution/ex3.3.html)
; 1歩ずつ進むポインタと2歩ずつ進むポインタを用意し,
; リストの終端に着く前に両ポインタの指す先が同じならループが存在する. 
 
(define (loop-check x)
  (define (check x0 x1)
    (cond ((eq? x0 x1) #t)
	  ((null? (cdr x1)) #f)
	  ((null? (cddr x1)) #f)
	  (else (check (cdr x0) (cddr x1)))))
  (if (and (pair? x) (pair? (cdr x)))
      (check (cdr x) (cddr x))
      #f))

(define a '(b c d))
(loop-check a) ; -> #f
(set-cdr! (last-pair a) a)
(loop-check a) ; -> #t
