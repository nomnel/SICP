(add-load-path "." :relative)
(use sicp-1)

(define (filtered-accumulate filter? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (if (filter? a)
			   (combiner result (term a))
			   result))))
  (iter a null-value))

;; a
; (sum-of-prime-square 2 10) => 87
(define (sum-of-prime-square a b)
  (filtered-accumulate prime? + 0 (^p (square p)) a inc b))

;; b
; (product-of-gcd-nums 10) => 189
(define (product-of-gcd-nums n)
  (filtered-accumulate (^m (= 1 (gcd n m))) * 1 identity 2 inc (- n 1)))