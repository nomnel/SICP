(define (union-tree tree1 tree2)
  (list->tree (union-set (tree->list-2 tree1)
			 (tree->list-2 tree2))))

(define (intersection-tree tree1 tree2)
  (list->tree (intersection-set (tree->list-2 tree1)
				(tree->list-2 tree2))))
