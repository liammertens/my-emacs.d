;;; Package --- summary
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(load-theme 'solarized-dark t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("7f3ef7724515515443f961ef87fee655750512473b1f5bf890e2dc7e065f240c" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "7e47dcc45666ea0d8f072acd024771ee0308a4a2228694cfba21f184803088a9" "4b599d15ac3248938afbf4794c43a680244d84f46ef10824b32299181b627672" "a3d40cd364b9a6cc2c33be39b35d7a5bbf872f8943f170bb17bf6156c2674921" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (yasnippet auto-complete go-mode flycheck autopair solarized-theme)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fantasque Sans Mono" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))

(global-flycheck-mode)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(yas-global-mode 1)

(global-set-key (kbd "C-c C-k") 'godoc)

(require 'autopair)
(autopair-global-mode)

(show-paren-mode 1)

(global-linum-mode)

(tool-bar-mode -1)
(toggle-scroll-bar -1)

(provide 'init)
;;; init.el ends here
