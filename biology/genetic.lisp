(defun f (x n gene-type)
  (if (> x n)
      (return-from f t))
  (format t "Generation ~A: ~{AA=~A Aa=~A aa=~A~}~%" x gene-type)
  (f (+ x 1) n (list (+ (first gene-type) (* 0.25 (second gene-type)))
		     (* 0.5 (second gene-type))
		     (+ (third gene-type) (* 0.25 (second gene-type))))))

(f 1 10 '(0.0 1.0 0.0))
