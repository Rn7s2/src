#lang racket

(let ((cnt 0))
  (for ([i (in-range 1 10000)])
    (let ((x (random))
          (y (random)))
      (when (<= (+ (* x x) (* y y)) 1.0)
        (set! cnt (add1 cnt))))
    (when (= (modulo i 100) 0)
      (display (format "i = ~A, current pi = ~A~%" i (* 4.0 (/ cnt i)))))))
