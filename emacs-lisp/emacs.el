(setq package-archives '(("gnu"   . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
			 ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")))

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
 '(package-selected-packages '(company racket-mode markdown-mode))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Tab 4
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(setq c-default-style "linux")
(setq default-tab-width 4)

;; Full screen
(add-hook 'window-setup-hook #'toggle-frame-maximized)

;; Backups goto ~/.backups
(setq backup-directory-alist (quote (("." . "~/.emacs_backups"))))

;; company
(add-hook 'after-init-hook'global-company-mode)
(setq company-clang-arguments '())
