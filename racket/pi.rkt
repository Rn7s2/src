#lang racket

(let ((cnt 0))
  (for ([i (in-range 1 1000000000)])
    (let ((x (random))
          (y (random)))
      (when (<= (+ (* x x) (* y y)) 1.0)
        (set! cnt (add1 cnt))))
    (when (= (modulo i 1000000) 0)
      (display (format "i = ~A, current pi = ~A~%" i (* 4.0 (/ cnt i)))))))
