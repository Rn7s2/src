;; See 5in7.java
;; This do the same thing, but written in Common Lisp.

(let ((p '(0 0 0 0 0))
      (vis '(nil nil nil nil nil nil nil))
      (cnt '(0 0 0 0 0 0)))

  (defun dfs (x)
    (if (>= x 5)
	(let ((tmp 0))
	  (dotimes (i 5)
	    (if (= i (nth i p))
		(incf tmp 1)))
	  (incf (nth tmp cnt) 1))
	(dotimes (i 7)
	  (if (nth i vis)
	      (go end))
	  (setf (nth x p) i)
	  (setf (nth i vis) t)
	  (dfs (+ x 1))
	  (setf (nth i vis) nil)
	  end)))

  (dfs 0)
  (dotimes (i 6)
    (format t "~A matching: ~A~%" i (nth i cnt)))
  (format t "Total: ~A~%" (* 7 6 5 4 3)))
