(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(count-pairs (cons 'a (cons 'b (cons 'c 'd))))
; -> 3

(define b (cons 'a 'a))
(define c (cons b b))
(count-pairs (cons 'd c))
; -> 4

(count-pairs (cons c c))
; -> 7
