;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; settings for LSP MODE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (defun lsp-save-actions ()
    "LSP actions before save."
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
	(add-hook 'before-save-hook #'lsp-format-buffer t t))
  :hook ((lsp-mode . #'lsp-enable-which-key-integration)
         (lsp-mode . #'lsp-save-actions)
         ((c-mode
           c++-mode
           go-mode
           java-mode
           js-mode
           python-mode
           rust-mode
           web-mode) . lsp-deferred))
  :config
  (setq lsp-auto-guess-root t
	    lsp-headerline-breadcrumb-enable nil
	    lsp-keymap-prefix "C-c l"
	    lsp-log-io nil)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

;;(use-package flymake
;;  :hook (prog-mode . flymake-mode)
;;  ;; (add-hook 'post-command-hook 'display-flymake-error)
;;  :config
;;  (global-set-key (kbd "M-n") #'flymake-goto-next-error)
;;  (global-set-key (kbd "M-p") #'flymake-goto-prev-error)
;;  )
;;
;;(eval-after-load 'flymake '(require 'flymake-cursor))

(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil) ; 如果单行信息很长会自动换行
  (global-set-key (kbd "M-n") #'flycheck-next-error)
  (global-set-key (kbd "M-p") #'flycheck-previous-error)
  :hook
  (prog-mode . flycheck-mode)
  (flycheck-error-list-mode)
  )

(use-package company
  :hook (after-init . global-company-mode)
  :config (setq company-minimum-prefix-length 1
                company-show-quick-access t
                company-idle-delay 0
                company-echo-delay 0))

(use-package lsp-treemacs
  :confg
  (lsp-treemacs-sync-mode 1)
  (lsp-treemacs-error-list-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; settings for Program Languages ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Golang
(use-package go-mode)

;; Lisp
;; You can choose paredit or lispy,but I use none of them,as they defined too many keybindings.
;; (use-package paredit :init (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode))
;; (use-package lispy :init (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1))))

;; Rust
(use-package rust-mode
  :config
  (setq rust-format-on-save t)
  (define-key rust-mode-map (kbd "C-c C-c") 'rust-run))

(use-package json-mode)
(use-package markdown-mode)
(use-package protobuf-mode)
(use-package quickrun)
(use-package cmake-mode)

;; vterm for my emacs, use to replace eshell
(use-package vterm
  :ensure t
  :config
  (setq vterm-shell "zsh")
  (setq vterm-kill-buffer-on-exit t)
)

;; treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winnum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  )

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package magit)

(require 'tree-sitter)
(require 'tree-sitter-langs)
(tree-sitter-require 'rust)
(tree-sitter-require 'cpp)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
(add-hook 'c++-mode-hook #'tree-sitter-hl-mode)
(add-hook 'rust-mode-hook #'tree-sitter-hl-mode)


(provide 'emacs-ide)
