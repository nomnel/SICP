(add-load-path "." :relative)
(use sicp-1)

; a
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (if (= n 0)
      1
      (product identity 1 inc n)))

(define (pi-approximate a)
  (* 4 (/. (product (^n (* n (+ n 2))) 2 (^n (+ n 2)) (* 2 a))
	   (product square 3 (^n (+ n 2)) (+ (* 2 a) 1)))))

; b
(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product-recur term (next a) next b))))