(setq package-archives '(("gnu"   . "http://cmcc.mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://cmcc.mirrors.ustc.edu.cn/elpa/melpa/")
			 ("melpa-stable" . "http://cmcc.mirrors.ustc.edu.cn/elpa/melpa-stable/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes '(misterioso))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(cnfonts d-mode))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 161 :width normal)))))

;; Chinese fonts (for Windows only)
(require 'cnfonts)
(cnfonts-enable)

;; Tab 4
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq c-default-style "linux")
(setq default-tab-width 4)

;; Common Lisp
(defun load-lisp ()
  (interactive)
  (load (expand-file-name "c:/Users/rn7s2/quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl")
  (slime))

;; Full screen
(add-hook 'window-setup-hook #'toggle-frame-maximized)

;; Backups goto ~/.backups
(setq backup-directory-alist (quote (("." . "~/.emacs_backups"))))
