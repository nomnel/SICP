(add-load-path "." :relative)
(use sicp-1)

(define (carmichael-test n)
  (define (test m c)
    (cond ((= n m) (= (- n 1) c))
	  ((= (expmod m n n) m) (test (+ m 1) (+ c 1)))
	  (else (test (+ m 1) c))))
  (test 1 0))

(carmichael-test 561)  ; => #t
(carmichael-test 1105) ; => #t
(carmichael-test 1729) ; => #t
(carmichael-test 2465) ; => #t
(carmichael-test 2821) ; => #t
(carmichael-test 6601) ; => #t