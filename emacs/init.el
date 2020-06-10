(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; show keybinds help
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; theme (t argument to load without permission)
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-acario-dark t))

;;(use-package afternoon-theme
;;  :ensure t
;;  :config
;;  (load-theme 'afternoon t))

;; Set default font
(set-face-attribute 'default nil
                    :family "Hack"
                    :height 110
                    :weight 'normal
                    :width 'normal)
;; modeline bottom screen
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

;; Icons for doom modeline, installed
(use-package all-the-icons
  :ensure t)

;; No Emacs startup screen
(setq inhibit-startup-message t)

;; hide tool bar
(tool-bar-mode -1)

;; menu bar (careful for beginners)
(menu-bar-mode -1)

;; hides scrollbar
(scroll-bar-mode -1)

;; highlight line
(global-hl-line-mode +1)

;; replace when select instead of inserting
(delete-selection-mode 1)

(setq backup-directory-alist '(("." . "~/.saves")))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(show-paren-mode 1)



;; ido
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;; projectile for project management
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 1)
			    (projects . 1)
	                    (bookmarks . 2)))
    ;; (setq dashboard-show-shortcuts nil) to hide shortcuts
    (setq dashboard-banner-logo-title "You are now entering the matrix.")
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-heading-icons t)
    ;; (setq dashboard-startup-banner "C:/PathToImg.png")
    )
  :config
  (dashboard-setup-startup-hook))

;; word count (not working with doom modeline)
(use-package wc-mode
  :ensure t
  :config (global-set-key "\C-cw" 'wc-mode))

(use-package treemacs
  :ensure t
  :bind
  (:map global-map
	([f8] . treemacs)
	("C-<f8>" . treemacs-select-window))
  :config
  (setq treemacs-is-nver-other-window t))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; bookmarks
(setq bookmark-default-file "~/.emacs.d/my-bookmarks")
;; save bookmark file (1 = every change)
(setq bookmark-save-flag 1)

;; expand region
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . er/expand-region)
  ("C--" . er/contract-region))

;; autocomplete
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; syntax check with eslint
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

;; rjsx mode
(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'"
  :config
  (setq js-indent-level 2))

;; tide setup function
(defun setup-tide-mode()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; needs typescript installed globally
(use-package tide
  :ensure t
  :after (rjsx-mode company flycheck)
  :hook (rjsx-mode . setup-tide-mode))

;; needs prettier installed globally.
(use-package prettier-js
  :ensure t
  :after (rjsx-mode)
  :hook (rjsx-mode . prettier-js-mode))

(setq ring-bell-function 'ignore)

(defun openStyles ()
  "Open styles file in new window if it exists.."
  (interactive)
  (if (file-exists-p (concat default-directory "styles.js"))
      (progn
	(split-window-right)
	(find-file-other-window (concat default-directory "styles.js"))
      )
    (message default-directory)))

(global-set-key [f5] 'openStyles)

;; org mode related
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-support-shift-select t)

(use-package htmlize
  :ensure t)

(setq org-todo-keywords
      '((sequence "TODO" "BLOCKED" "REVIEW" "|" "DONE")))

(setq org-log-done 'time)
(setq org-log-done 'note)

(setq org-todo-keyword-faces
      '(("TODO" . "green") ("STARTED" . "white") ("REVIEW" . "orange")
	("BLOCKED" . (:foreground "red" :weight bold))))

(cd "e:/programing/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" default)))
 '(package-selected-packages
   (quote
    (htmlize org-bullets afternoon-theme prettier-js prettier tide rjsx-mode flycheck company expand-region treemacs-projectile treemacs wc-mode dashboard projectile helm which-key use-package doom-themes doom-modeline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
