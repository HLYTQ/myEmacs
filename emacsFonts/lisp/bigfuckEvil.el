
;; 在emacs中用 evil，这何尝不是一种 NTR


(use-package evil
  :init
  (evil-mode t)
)


;; my evil-leader is imitate spacemacs
;; Fortunely, it works well
(use-package evil-leader
  :init (global-evil-leader-mode)
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "s" 'swiper
    "f" 'counsel-find-file
    "cfz" 'counsel-fzf
    "bd" 'kill-buffer ;; like vim
    "bb" 'switch-to-buffer
    "<SPC>" 'counsel-M-x
    "'" 'vterm-other-window ;; like spacemacs
    "j" 'windmove-down
    "h" 'windmove-left
    "k" 'windmove-up
    "l" 'windmove-right
    "tt" 'treemacs
    "ts" 'lsp-treemacs-symbols
    "te" 'lsp-treemacs-errors-list
    "cs" 'evil-surround-change
    "ds" 'evil-surround-delete
    )
)

;; for vim cursor status in terminal
(use-package evil-terminal-cursor-changer
  :init (evil-terminal-cursor-changer-activate)
)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; setting relative line
(use-package emacs
  :init (global-hl-line-mode)
  :config
  (setq display-line-numbers-type 'visual)
  )

(provide 'bigfuckEvil)
