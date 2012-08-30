(define (last-pair ls)
  (if (null? (cdr ls))
      ls
      (last-pair (cdr ls))))
