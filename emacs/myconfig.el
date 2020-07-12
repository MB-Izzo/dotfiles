(setq inhibit-startup-message t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

;;(global-hl-line-mode +1)

(delete-selection-mode 1)

(setq backup-directory-alist '(("." . "~/.saves")))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(show-paren-mode 1)

(setq org-src-tab-acts-natively t)

(setq bookmark-default-file "~/.emacs.d/my-bookmarks")
;; save bookmark file (1 = every change)
(setq bookmark-save-flag 1)

(setq ring-bell-function 'ignore)

(cd "e:/programing/")

(setq backup-directory-alist `(("." . "~/.saves")))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;;(use-package afternoon-theme
 ;; :ensure t
 ;; :config
 ;; (load-theme 'afternoon t))

(use-package all-the-icons
:ensure t)

(set-face-attribute 'default nil :font "Hack-12")

;; (use-package smart-mode-line
  ;;   :ensure t
  ;;   :config
  ;;   (setq sml/no-confirm-load-theme t)
  ;;   (sml/setup)
  ;;   (setq sml/theme 'dark)
  ;;   (set-face-attribute 'mode-line nil :font "Hack-11")
  ;; )
(use-package doom-modeline
  :ensure t
  :hook(after-init . doom-modeline-mode))

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

(use-package rjsx-mode
:ensure t
:mode "\\.js\\'"
:config
(setq js-indent-level 2))

(use-package markdown-mode
:ensure t
:commands (markdown-mode gfm-mode)
:mode (("README\\.md\\'" . gfm-mode)
       ("\\.md\\'" . markdown-mode)
       ("\\.markdown\\'" . markdown-mode))
:init (setq markdown-command "multimarkdown"))

(use-package smartparens
  :ensure t
  :hook
  (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config)
)

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

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

(use-package which-key
:ensure t
:config (which-key-mode))

(use-package expand-region
:ensure t
:bind
("C-=" . er/expand-region)
("C--" . er/contract-region))

(use-package company
:ensure t
:init
(add-hook 'after-init-hook 'global-company-mode))

(use-package company-quickhelp
  :ensure t
  :config
  (company-quickhelp-mode 1)
)

(use-package flycheck
:ensure t
:init
(global-flycheck-mode))

(defun setup-tide-mode()
  "Setup function for tide."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (company-mode +1))

;; needs typescript installed globally
(use-package tide
  :ensure t
  :after (rjsx-mode company flycheck)
  :hook (rjsx-mode . setup-tide-mode))

(use-package prettier-js
:ensure t
:after (rjsx-mode)
:hook (rjsx-mode . prettier-js-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(setq org-support-shift-select t)

(use-package htmlize
:ensure t)

(use-package buffer-move
  :ensure t
  :bind
  ("<C-S-up>" . 'buf-move-up))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1) 
)

(use-package yasnippet-snippets
  :ensure t
)

(defun newline-without-break-of-line ()
  "1. move to end of the line.
  2. insert newline with index"

  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))

(global-set-key (kbd "<C-return>") 'newline-without-break-of-line)

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
'(("t" "Todo" entry (file "e:/programing/emacs_data/sprints.org")
"* TODO %^{Description} \n %? \n :LOGBOOK:\n - Added: %U \n :END:" :empty-lines 1))
)

(setq org-todo-keywords
      '((sequence "TODO" "BLOCKED" "REVIEW" "|" "DONE")))

(setq org-log-done 'time)
;;(setq org-log-done 'note)

(setq org-todo-keyword-faces
      '(("TODO" . "yellow") ("NEXT" . "white") ("WAITING" . "orange")
	("DELAYED" . (:foreground "red" :weight bold))
        ("DONE" . "green") ("CANCELLED" . "grey")))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(defun openStyles ()
  "Open styles file in new window if it exists."
  (interactive)
  (if (file-exists-p (concat default-directory "styles.js"))
      (progn
	(split-window-right)
	(find-file-other-window (concat default-directory "styles.js"))
      )
   )
   (if (file-exists-p (concat (file-name-sans-extension buffer-file-name) ".module.css"))
      (progn
	(split-window-right)
	(find-file-other-window (concat (file-name-sans-extension buffer-file-name) ".module.css"))
      ))
   (message (concat (file-name-sans-extension buffer-file-name) ".module.css"))
   )

(global-set-key [f5] 'openStyles)

(global-set-key (kbd "C-x C-a")  (lambda () (interactive)
				     (cd "~/.emacs.d/")
				     (call-interactively 'find-file)))

(defun openTasks ()
  "Open sprint tasks in new frame."
  (interactive)
  (split-window-right)
  (find-file-other-window "e:/programing/emacs_data/sprints.org"))
(global-set-key [f2] 'openTasks)

(defun git-bash () (interactive)
  (let ((explicit-shell-file-name "c:/Program Files (x86)/Git/git-bash.exe"))
    (call-interactively 'shell)))
(global-set-key [f1] 'git-bash)
(add-hook 'shell-mode-hook
   (lambda ()
(face-remap-set-base 'comint-highlight-prompt :inherit nil)))

(use-package web-mode 
:ensure t
:custom
(web-mode-css-indent-offset 2))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(defun set-newline-and-indent ()
(local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'rjsx-mode 'set-newline-and-indent)
