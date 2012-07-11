(add-load-path "." :relative)
(use sicp-1)

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (iter k)
    (if (= n (+ k 1))
	(+ (* 4 (y k)) (y (+ k 1)))
	(+ (* 4 (y k)) (* 2 (y (+ k 1))) (iter (+ k 2)))))
  (* (/ h 3) (+ (y 0) (iter 1))))

; (integral cube 0 1 0.01)  => 0.24998750000000042
; (integral cube 0 1 0.001) => 0.249999875000001

; (integral-simpson cube 0 1 100)  => 1/4
; (integral-simpson cube 0 1 1000) => 1/4