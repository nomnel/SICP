(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

(dolist (k (iota 15 1))
  (print k " " (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))
;; -> k=12で4桁の精度の近似がえられる

(define (cont-frac-iter n d k)
  (define (iter i res)
    (if (= i 0)
	res
	(iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter (- k 1) (/ (n k) (d k))))
