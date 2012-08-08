(add-load-path "." :relative)
(use sicp-1)

(fixed-point (lambda (x) (+ 1.0 (/ 1.0 x))) 1.0)
