(define (sum-square a b c)
  (cond ((and (<= a b) (<= a c)) (+ (* b b) (* c c)))
	((and (<= b c) (<= b a)) (+ (* c c) (* a a)))
	(else (+ (* a a) (* b b)))))
;(sum-square 3 4 2) => 25