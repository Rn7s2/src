#lang racket

(define working-path (current-directory))
(display (format "I think the path is: ~a~%" working-path))

(when (not (file-exists? "blog-conf.rkt"))
  (display (format "Not a valid blog directory.~%"))
  (exit))



