(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  ;; (add-1 zero)
  ;; (^f (^x (f ((n f) x)))) ; add-1
  ;; (^f (^x x))             ; zero
  ;; (^f (^x (f ((zero f) x))))
  ;; (^f (^x (f (((^f (^x x)) f) x))))
  ;; (^f (^x (f ((^x x) x))))
  (^f (^x (f x))))

(define two
  ;; (add-1 one)
  ;; (^f (^x (f ((n f) x)))) ; add-1
  ;; (^f (^x (f x)))         ; one
  ;; (^f (^x (f ((one f) x))))
  ;; (^f (^x (f (((^f (^x (f x))) f) x))))
  ;; (^f (^x (f ((^x (f x)) x))))
  (^f (^x (f (f x)))))

(define (+ a b)
  (^f (^x ((a f) ((b f) x)))))
