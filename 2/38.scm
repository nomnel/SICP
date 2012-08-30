(add-load-path "." :relative)
(use chap2)

(fold-right / 1 (list 1 2 3)) ; => 3/2
(fold-left / 1 (list 1 2 3))  ; => 1/6
(fold-right list '() (list 1 2 3)) ; => (1 (2 (3 ())))
(fold-left list '() (list 1 2 3))  ; => (((() 1) 2) 3)

;; opが可換であること
