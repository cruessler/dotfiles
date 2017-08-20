; https://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

; https://github.com/emacs-helm/helm
(use-package helm
  :ensure t)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

; Hide scroll bar
; https://www.emacswiki.org/emacs/ScrollBar
(scroll-bar-mode -1)
; Hide tool bar
; https://www.emacswiki.org/emacs/ToolBar#toc1
(tool-bar-mode -1)

; https://github.com/oneKelvinSmith/monokai-emacs
(use-package monokai-theme
  :ensure t)

(load-theme 'monokai t)

; Show line numbers
; http://superuser.com/a/212669
; https://www.emacswiki.org/emacs/LineNumbers
(global-linum-mode t)

; http://orgmode.org/
(use-package org
  :ensure t)

; https://tex.stackexchange.com/questions/364914/using-koma-script-article-with-org-mode/364982
(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("koma-article" "\\documentclass{scrartcl}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

; Let the default latex header (which contains several exports) be empty
; http://orgmode.org/manual/Header-and-sectioning.html
(with-eval-after-load "ox-latex"
  (setq org-latex-default-packages-alist '()))

; Use booktabs for tables
(custom-set-variables
  '(org-latex-tables-booktabs t))

; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t)
; https://github.com/bbatsov/helm-projectile
(use-package helm-projectile
  :ensure t)

(projectile-mode)

; https://www.emacswiki.org/emacs/SetFonts
(set-face-attribute 'default t :font "Source Code Pro-10")

; https://github.com/emacs-evil/evil
; put Evil at the end to let it detect other packages it might have
; keybindings for
; see https://nathantypanski.com/blog/2014-08-03-a-vim-like-emacs-config.html
(use-package evil
  :ensure t)

(require 'evil)
(evil-mode 1)
