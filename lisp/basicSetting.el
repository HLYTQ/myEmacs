;; set language environment
(set-language-environment 'utf-8)

;; Cleaner GUI
(unless (eq system-type 'darwin)
  (menu-bar-mode -1))

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; close default welcom screen
(setq inhibit-splash-screen t)

;; use y & n to replace yes & no
(defalias 'yes-or-no-p 'y-or-n-p)

;; speed
(setq gc-cons-threshold most-positive-fixnum)

;; HideShow Minor Mode
(use-package hideshow
  :init (add-hook 'hs-minor-mode-hook (lambda () (diminish 'hs-minor-mode)))
  :hook (prog-mode . hs-minor-mode))

;; Abbrev
(setq-default abbrev-mode t)

;; auto save
;; `save-some-buffers' is provided by files.el (builtin)
;; `pulse-momentary-highlight-one-line' is provided by pulse.el (builtin)
(use-package pulse-and-save
  :ensure nil
  :init
  (defun pulse-save-buffers (&rest args)
    (save-some-buffers t)
    (pulse-momentary-highlight-one-line (point)))
  ;; auto save when frame lose focus, Alt-Tab
  (add-function :after after-focus-change-function #'pulse-save-buffers)
  ;; auto save when buffer changed
  (dolist (command '(other-window
                     switch-to-buffer
                     next-buffer
                     previous-buffer))
    (advice-add command :after #'pulse-save-buffers)))

;; restart
(use-package restart-emacs)

;; auto revert
;; `global-auto-revert-mode' is provided by autorevert.el (builtin)
(use-package autorevert
  :hook (after-init . global-auto-revert-mode))

;; Delete Behavior
(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'after-init-hook 'delete-selection-mode)

;; Electric-Pair
(add-hook 'after-init-hook 'electric-indent-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'electric-layout-mode)

;; ibuffer
(use-package ibuffer
  :init (defalias 'list-buffers 'ibuffer))

;; Line Number
;; this package introduced in Emacs 26, so only enabled when 26+
(use-package display-line-numbers
  :if (> emacs-major-version 26)
  :hook (prog-mode . display-line-numbers-mode))

;; Org Mode
(setq org-hide-leading-stars t
      org-startup-indented t)

;; Parentheses
(use-package paren
  :ensure nil
  :config (setq-default show-paren-style 'mixed
                        show-paren-when-point-inside-paren t
                        show-paren-when-point-in-periphery t)
  :hook (prog-mode . show-paren-mode))


;; Save Place
(save-place-mode 1)

;; don't make backup file
(setq make-backup-files nil)

;; only use spaces instead of TAB, use C-q TAB to input the TAB char
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Diminish Builtins
(dolist (elem '(abbrev-mode eldoc-mode))
  (diminish elem))
(add-hook 'hs-minor-mode-hook (lambda () (diminish 'hs-minor-mode)))

;; strong search ivy-counsel-swiper
(use-package ivy
    :defer 1
    :demand
    :hook (after-init . ivy-mode)
    :config
    (ivy-mode 1))
(use-package counsel
    :after (ivy)
    :bind (("M-x" . counsel-M-x)
            ("C-x C-f" . counsel-find-file)
            ("C-c f" . counsel-recentf)
            ("C-c g" . counsel-git)))

(use-package swiper
    :after ivy
    :bind (("C-s" . swiper)
            ("C-r" . swiper-isearch-backward))
    :config (setq swiper-action-recenter t
                    swiper-include-line-number-in-search t))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist
        '((counsel-M-x . ivy-posframe-display-at-frame-center)
          (complete-symbol . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode 1)
  )

;; key tips
(use-package which-key
  :defer nil
  :config (which-key-mode))

;; windows choice
(use-package ace-window
  :config
  (ace-window-display-mode)
  (setq aw-background nil))
(global-set-key (kbd "M-o") 'ace-window)

(provide 'basicSetting)
