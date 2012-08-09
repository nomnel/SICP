(add-load-path "." :relative)
(use sicp-1)

(define (repeated f n)
  (define (iter res c)
    (if (= c n)
	res
	(iter (compose f res) (+ c 1))))
  (iter f 1))
