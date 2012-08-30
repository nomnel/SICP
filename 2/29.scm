(define (make-mobile left right) 
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

;; b
(define (total-weight mobile)
  (if (pair? mobile)
      (+ (total-weight (branch-structure (left-branch mobile)))
	 (total-weight (branch-structure (right-branch mobile))))
      mobile))

;; c
(define (balanced? mobile)
  (if (not (pair? mobile)) #t
      (let* ((l-branch (left-branch mobile))
	     (r-branch (right-branch mobile))
	     (l-struct (branch-structure l-branch))
	     (r-struct (branch-structure r-branch)))
	(and (= (* (branch-length l-branch) (total-weight l-struct))
		(* (branch-length r-branch) (total-weight r-struct)))
	     (balanced? l-struct)
	     (balanced? r-struct)))))

;; d
; 以下
(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))
