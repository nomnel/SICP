(load "./40.scm")

(define (triples-its-sum-is-s n s)
  (define (unique-triples n)
    (flatmap (lambda (i)
	       (map (lambda (jk) (cons i jk))
		    (unique-pairs (- i 1))))
	     (enumerate-interval 1 n)))
  (filter (lambda (l) (= s (apply + l)))
	  (unique-triples n)))