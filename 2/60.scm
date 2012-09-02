(define (element-of-set? x set)
  (cond ((null? set) #f)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2)
  (append set1 set2))

(define (intersection-set set1 set2)
  (cond ((null? set1) set2)
	((element-of-set? (car set1) set2)
	 (cons (car set1) (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

; 重複なし表現の効率と比べて
; element-of-set?  :長大で重複の多い集合ほど悪くなる
; adjoin-set       :長大で重複の少ない集合ほど良くなる
; union-set        :長大で重複の少ない集合ほど良くなる
; intersection-set :長大で重複の多い集合ほど悪くなる

; 応用はわからん
