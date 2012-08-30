(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

;; リストのより後ろの要素を、より前にconsしているから
;; (square-list '(1 2 3 4)) -> (16 9 4 1)


(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items '()))

;; 2乗したものをcdrにconsしているのでドット対のリストになる
;; (square-list '(1 2 3 4)) -> ((((() . 1) . 4) . 9) . 16)
