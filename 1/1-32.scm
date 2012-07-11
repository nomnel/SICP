(add-load-path "." :relative)
(use sicp-1)

;; a
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

; (product identity 1 inc 10) => 3628800
(define (product term a next b)
  (accumulate * 1 term a next b))

; (sum identity 0 inc 10) => 55
(define (sum term a next b)
  (accumulate + 0 term a next b))

;; b
(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate-recur combiner null-value term (next a) next b))))