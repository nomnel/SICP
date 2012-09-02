(define (lookup given-key set-of-records)
  (if (null? set-of-records) #f
      (let ((record-key (key (entry set-of-records))))
	(cond ((= given-key record-key)
	       (car set-of-records))
	      ((< given-key record-key)
	       (lookup given-key (left-branch set-of-records)))
	      (else
	       (lookup given-key (right-branch set-of-records)))))))
