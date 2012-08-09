(define-module sicp-1
  (use srfi-27)
  (export square
	  sqrt
	  smallest-divisor
	  prime?
	  expmod
	  random
	  fast-prime?
	  timed-prime-test
	  start-prime-test
	  report-prime
	  inc
	  fixed-point
	  cont-frac
	  compose
	  repeated
	  average-damp))

(select-module sicp-1)

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(use srfi-27) ;  random-integer

(define (random n)
  (random-integer n))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (runtime)
  (receive (a b) (sys-gettimeofday)
    (+ (* a 1000000) b)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
	 (report-prime (- (runtime) start-time))
	 #t)
	(else #f)))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))

(define (inc n)
  (+ 1 n))

(define (half-interval-method f a b)
  (define (close-enough? x y)
    (< (abs (- x y)) 0.001))
  (define (search f neg-point pos-point)
    (let1 midpoint (average neg-point pos-point)
      (if (close-enough? neg-point pos-point)
	  midpoint
	  (let1 test-value (f midpoint)
	    (cond ((positive? test-value)
		   (search f neg-point midpoint))
		  ((negative? test-value)
		   (search f midpoint pos-point))
		  (else midpoint))))))
  
  (let ((a-value (f a))
	(b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
	   (search f a b))
	  ((and (negative? b-value) (positive? a-value))
	   (search f b a))
	  (else
	   (error "Values are not of opposite sign" a b)))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let1 next (f guess)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (cont-frac n d k)
  (define (iter i res)
    (if (= i 0)
	res
	(iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter res c)
    (if (= c n)
	res
	(iter (compose f res) (+ c 1))))
  (iter f 1))
