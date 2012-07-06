(add-load-path "." :relative)
(use sicp-1)

(define (search-for-primes from)
  (define (search-for-primes-iter n c)
    (cond ((= c 3))
	  ((timed-prime-test n)
	   (search-for-primes-iter (+ n 2) (+ c 1)))
	  (else (search-for-primes-iter (+ n 2) c))))
  (search-for-primes-iter (if (even? from) (+ from 1) from) 0))

(search-for-primes 1000)
; => 1009***15, 1013***14, 1019***15
(search-for-primes 10000)
; 10007***45, 10009***45, 10037***45
(search-for-primes 100000)
; 100003***120, 100019***119, 100043***108
(search-for-primes 1000000)
; 1000003***330, 1000033***328, 1000037***333