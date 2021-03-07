(load "ltk/ltk")
(in-package :ltk)

(with-ltk()
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
      (length prime)))
  
  (let* ((frame (make-instance 'frame :master nil))
	 (label (make-instance 'label :master frame :text "输入上界："))
	 (spin (make-instance 'spinbox :master frame :increment 1 :to 10000 :from 2))
	 (button (make-instance 'button :master frame :text "确定"
				:command (lambda ()
					   (do-msg
					       (format nil "小于等于~A的质数共有~A个"
						       (text spin) (get-prime-num (parse-integer (text spin))))
					     :title "结果"
					     :parent frame)))))
    (pack frame)
    (pack label :side :top)
    (pack spin)
    (pack button)))
