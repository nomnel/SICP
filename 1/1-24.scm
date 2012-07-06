(add-load-path "." :relative)
(use sicp-1)

(define (start-prime-test n start-time)
  (cond ((fast-prime? n 1)
	 (report-prime (- (runtime) start-time))
	 #t)
	(else #f)))

(timed-prime-test 1009) ; => 19
(timed-prime-test 1013) ; => 19
(timed-prime-test 1019) ; => 19

(timed-prime-test 10007) ; => 23
(timed-prime-test 10009) ; => 21
(timed-prime-test 10037) ; => 17

(timed-prime-test 100003) ; => 16
(timed-prime-test 100019) ; => 23
(timed-prime-test 100043) ; => 16

(timed-prime-test 1000003) ; => 25
(timed-prime-test 1000033) ; => 35
(timed-prime-test 1000037) ; => 24