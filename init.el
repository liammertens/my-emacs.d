;;; Package --- summary

;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(load-theme 'darktooth t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a1a966cf2e87be6a148158c79863440ba2e45aa06cc214341feafe5c6deca4f2" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(js2-highlight-level 3)
 '(js2-include-node-externs t)
 '(package-selected-packages
   (quote
    (company-tern yasnippet counsel-projectile projectile xref-js2 js2-mode darktooth-theme counsel company-quickhelp powerline web-mode emmet-mode company flycheck solarized-theme)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Envy Code R" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))

(global-flycheck-mode)
(projectile-mode)
(require 'company)
(require 'company-go)
(require 'company-tern)
(global-company-mode)
(company-quickhelp-mode 1)
(yas-global-mode t)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
			  (local-set-key (kbd "C-c C-k") 'godoc)
))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-dabbrev-downcase 0)
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'web-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(require 'xref-js2)
(define-key js2-mode-map (kbd "M-.") nil)
(add-hook 'js2-mode-hook (lambda ()
			   (tern-mode)
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
))
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'powerline)
(powerline-default-theme)
(setq powerline-default-separator 'wave)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(counsel-projectile-on)
(electric-pair-mode 1)

(show-paren-mode 1)

(global-linum-mode)

(tool-bar-mode -1)
(toggle-scroll-bar -1)

(provide 'init)
;;; init.el ends here
