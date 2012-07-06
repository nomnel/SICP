(add-load-path "." :relative)
(use sicp-1)

(define (find-divisor n test-divisor)
  (define (next n)
    (if (= n 2) 3
	(+ n 2)))
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(timed-prime-test 1009) ; => 13
(timed-prime-test 1013) ; => 19
(timed-prime-test 1019) ; => 19

(timed-prime-test 10007) ; => 50
(timed-prime-test 10009) ; => 50
(timed-prime-test 10037) ; => 50

(timed-prime-test 100003) ; => 77
(timed-prime-test 100019) ; => 146
(timed-prime-test 100043) ; => 78

(timed-prime-test 1000003) ; => 446
(timed-prime-test 1000033) ; => 445
(timed-prime-test 1000037) ; => 444

;; 遅くなった…