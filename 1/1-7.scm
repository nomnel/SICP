; 小さい数の平方根では繰り返しが不十分でも予測値が誤差0.001の範囲に収まってしまうので、答えが十分近似されない
; 大きい数の平方根ではgood-enough?が真にならず停止しない

(define (sqrt x)
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? prev-guess next-guess)
    (< (abs (/ (- prev-guess next-guess) next-guess))
       0.001))
  (define (sqrt-iter prev-guess next-guess)
    (if (good-enough? prev-guess next-guess)
	next-guess
	(sqrt-iter next-guess (improve next-guess))))
  (sqrt-iter 1.0 (improve 1.0)))