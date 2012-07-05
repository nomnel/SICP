(define (pascals-triangle i j)
  (if (or (= j 0) (= j 1)) 1
      (+ (pascals-triangle (- i 1) (- j 1))
	 (pascals-triangle (- i 1) j))))