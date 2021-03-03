#!/usr/bin/sbcl --script

(defun get-prime-num (n)
  (let* ((prime (make-array (+ n 1) :fill-pointer 0))
	 (is-prime (make-array (+ n 1) :initial-element t)))
    (setf (aref is-prime 0) nil)
    (setf (aref is-prime 1) nil)
    (do ((i 2 (+ i 1)))
	((> i n) t)
      (if (aref is-prime i)
	  (vector-push i prime))
      (block break
	(dotimes (j (length prime))
	  (if (> (* i (aref prime j)) n)
	      (return-from break t))
	  (setf (aref is-prime (* i (aref prime j))) nil)
	  (if (= (mod i (aref prime j)) 0)
	      (return-from break t)))))
    (format t "Total prime numbers: ~A~%" (length prime))))

(get-prime-num (read))