

;; org mode setting
(require 'org)
(setq org-log-done t)
(use-package org-bullets
  :ensure t
  :commands org-bullets-mode
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶"))
)

;; pdf tools
(pdf-loader-install)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))) ;; 用pdf-tools 打开 pdf
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer) ;; 在完成编译后刷新 pdf 文件

(provide 'doeverything)
