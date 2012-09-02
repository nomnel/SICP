(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; a
; paritial-treeはリストを左,中,右の3つに区切る
; 進行方向は左優先(深さ優先探索みたいな感じ?)

; (list->tree (list 1 3 5 7 9 11))
; -> (5 (1 () (3 () ()))
;       (9 (7 () ()) (11 () ())))
; 木は面倒なので描かない

; b
; Θ(n)
