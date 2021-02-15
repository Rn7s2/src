(defun hanoi (x a b c)
  (if (= x 1)
      (format t "~A -> ~A~%" a c)
      (progn
	(hanoi (- x 1) a c b)
	(format t "~A -> ~A~%" a c)
	(hanoi (- x 1) b a c))))

(hanoi 3 'A 'B 'C)
