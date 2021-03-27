(let ((cnt 0)
      (n 10000))
  (dotimes (i n)
    (let ((x (random 100.0))
          (y (random 100.0)))
      (if (< (+ (* x x) (* y y)) 10000.0)
          (incf cnt))))
  (format t "pi = ~A~%" (float (* 4.0 (/ cnt (float n))))))
