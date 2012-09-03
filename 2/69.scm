(add-load-path "." :relative)
(use chap2)

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (null? (cdr set)) (car set)
      (let ((sorted-set (sort set (lambda (a b) (< (weight a) (weight b))))))
	(successive-merge
	 (cons (make-code-tree (car sorted-set) (cadr sorted-set))
	       (cddr sorted-set))))))
