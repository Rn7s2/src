;; a(n)=1+1/2+1/3+...+1/n
;; ∀n∈N*, a(2n)-a(n)+1/(4n)>ln(2).

(defun f (x)
  (let ((ret 0))
    (do ((i (+ x 1) (+ i 1)))
        ((> i (* x 2)) (+ ret (/ 1 (* x 4))))
      (incf ret (/ 1 i)))))

(format t "ln(2)=~A~%" (log 2))
(dotimes (i 20)
  (format t "f(~A)=~A~%" (+ i 1) (float (f (+ i 1)))))
