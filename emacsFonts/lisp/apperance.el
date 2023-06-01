;; The file contain some config about my emacs's apperance


;; Load theme early to avoid the blinking
(if (>= emacs-major-version 28)
    (load-theme 'modus-operandi t)
  (load-theme 'doom-tokyo-night-padded-modeline t))

;; nerd-icons package do not work well on my emacs
;; I replace by all-the-icons
;;(use-package nerd-icons
;;  :ensure nil
;;  :demand
;;  :config (setq emacs-nerd-icons-font-family "FiraCode Nerd Font"))

;; this is nyan cat, dress my modeline
(use-package nyan-mode
      :ensure t
      :hook (doom-modeline-mode . nyan-mode)
      :config
(setq default-mode-line-format
      (list ""
            'mode-line-modified
            "<"
            "kirchhoff"
            "> "
            "%10b"
            '(:eval (when nyan-mode (list (nyan-create))));;注意添加此句到你的format配置列表中
            " "
            'default-directory
            " "
            "%[("
            'mode-name
            'minor-mode-list
            "%n"
            'mode-line-process
            ")%]--"
            "Line %l--"
            '(-3 . "%P")
            "-%-"))
      (nyan-mode t);;启动nyan-mode
      ;;(nyan-start-animation);;开始舞动吧（会耗cpu资源）
      )

;; use doom-modeline to diress my emcas
;; O NO!!! the icons can not display
(use-package doom-modeline
      :ensure t
      :init (doom-modeline-mode 1)
      :config
      (setq doom-modeline-icons (display-graphic-p)
            doom-modeline-height 40
            doom-modeline-modal-icon t
            doom-modeline-lsp t
            doom-modeline-major-mode-color-icon t
            doom-modeline-bar-width 3
            doom-modeline-buffer-file-name-style 'relative-to-project
            doom-modeline-github nil)
     )

;;(use-package nerd-icons-dired
;;  :ensure nil
;;  :commands nerd-icons-dired-mode
;;  :hook (dired-mode . nerd-icons-dired-mode))

;; This package I try to solve the problem about
;; all-the-icons-dired not have color, but it
;; doesn't work
;; (add-to-list 'load-path
;;              "~/.emacs.d/myPlugged/font-lock-plus-master")
;; (require 'font-lock+)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-dired
  :if (display-graphic-p))
(add-hook 'dired-mode-hook
          'all-the-icons-dired-mode
          'all-the-icons-dired-face)

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

;; page break line for dashboard
;; this part do not use 'use-package' way,
;; but I think don't need so strict
(require 'page-break-lines)
(page-break-lines-mode)
(set-fontset-font "fontset-default"
                  (cons page-break-lines-char page-break-lines-char)
                  (face-attribute 'default :family))

;; something together with dashboard
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p")
  'projectile-command-map)

;; dashboard
(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-center-content t)
  ;;(setq dashboard-startup-banner "~/.emacs.d/myPlugged/doom.txt")
  (setq dashboard-startup-banner "~/Pictures/icons8-doom-400.png")
  (setq dashboard-banner-logo-title "Fortune favors the brave.")
  (setq dashboard-show-shortcuts t)
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-page-separator "\n\f\n")
  (setq dashboard-set-file-icons t)
  (setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (agenda . 5)))
)

(use-package rainbow-mode
  :ensure t
  :hook (css-mode . rainbow-mode))
(use-package rainbow-delimiters
  :enable t
  :hook (prog-mode . rainbow-delimiters-mode))

(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-responsive 'stack)

;;注意这行中的F8 , 可以改成你想要的按键
;; steel form emacs-china.org
(global-set-key [(f1)] 'loop-alpha)
(setq alpha-list '((100 95) (90 70) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

(provide 'apperance)
