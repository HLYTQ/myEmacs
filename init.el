
;; This is my emacs init file
;; After use SpacemacsI want to write my personal emacs


;; china software source
(setq package-archives
      '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;; use-package settings
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand t
      use-package-always-minimally t
      use-package-verbose t)

;;个别时候会出现签名检验失败
(setq package-check-signature nil)

;; 初始化软件包管理器
(require 'package)
(unless (bound-and-true-p package--initialized)
    (package-initialize))

;; 刷新软件源索引
(unless package-archive-contents
    (package-refresh-contents))

;; 第一个扩展插件：use-package，用来批量统一管理软件包
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
   (package-install 'use-package))


;; load my config file path
(add-to-list 'load-path (expand-file-name
			             (concat user-emacs-directory "lisp")))

;; config file
(require 'init-elpa)
(require 'basicSetting)
(require 'apperance)
(require 'emacs-ide)
(require 'bigfuckEvil)
(require 'doeverything)

(add-to-list 'load-path (expand-file-name
                         (concat user-emacs-directory "myPlugged")))
;; other plugged
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-tokyo-night))
 '(custom-safe-themes
   '("636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "e1f4f0158cd5a01a9d96f1f7cdcca8d6724d7d33267623cc433fe1c196848554" "f64189544da6f16bab285747d04a92bd57c7e7813d8c24c30f382f087d460a33" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" default))
 '(display-line-numbers-type 'visual)
 '(package-selected-packages
   '(highlight-indent-guides rainbow-blocks treemacs-all-the-icons tree-sitter-langs tree-sitter flycheck orderless magit markdown-preview-eww flymake-cursor dired-ranger dirvish lsp-treemacs pdf-tools pandoc-mode all-the-icons-dired evil-terminal-cursor-changer page-break-lines doom-themes projectile restart-emacs monokai-theme atom-one-dark-theme use-package doom-modeline))
 '(tool-bar-mode nil)
 '(warning-suppress-log-types '((use-package) (use-package)))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 188 :width normal)))))
