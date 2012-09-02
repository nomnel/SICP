(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

;a 二つの手続きはすべての木に対して同じ結果を生じる
;図2.16の木からは (1 3 5 7 9 11) を生じる

;ステップ数の増加の程度は同じ (appendの分だけ1の方が実行速度は遅いが)
