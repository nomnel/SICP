(define-module chap2
  (export add-interval
	  sub-interval
	  mul-interval
	  div-interval
	  make-interval
	  upper-bound
	  lower-bound
	  make-center-width
	  make-center-percent
	  percent
	  center
	  accumulate
	  accumulate-n
	  fold-right
	  fold-left
	  enumerate-interval
	  flatmap
	  prime?))

(select-module chap2)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))
(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (make-center-percent c p)
  (let ((w (/ (* c (/ p 100)) 2)))
    (make-center-width c w)))

(define (percent i)
  (* (/ (- (upper-bound i) (lower-bound i)) (center i)) 100))

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime? n)
  (cond ((= n 2) #t)
	((or (< n 2) (even? n)) #f)
	(else (let1 m (floor->exact (sqrt n))
		(let loop ((i 3))
		  (cond ((< m i) #t)
			((zero? (modulo n i)) #f)
			(else (loop (+ i 2)))))))))
