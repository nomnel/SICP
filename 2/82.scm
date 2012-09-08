(define (apply-generic op . args)
  (define (try-convert x new-type)
    (let ((converter (get-coercion (type-tag x) new-type)))
      (if converter (converter x) x)))
  (define (try-coercion op args type-tags)
    (if (null? type-tags) 
        (error "No method for these types" (list op (map type-tag args)))
        (let ((new-args (map (lambda (arg) (try-convert arg (car type-tags)))
                             args)))
          (let ((new-type-tags (map type-tag new-args)))
            (let ((proc (get op new-type-tags)))
              (if proc
                  (apply proc (map contents new-args))
                  (try-coercion op args (cdr type-tags))))))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (try-coercion op args type-tags)))))

; 型a, b, c があるとする.
; aはcに強制型変換でき、bとcとの間で適用できる手続きがあっても
; 上のapply-genericでは
; (op type-a type-b) を (op type-c type-b) に変換できない.
