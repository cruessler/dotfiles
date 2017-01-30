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

; https://github.com/emacs-evil/evil
(use-package evil
  :ensure t)

(require 'evil)
(evil-mode 1)

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

; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t)
; https://github.com/bbatsov/helm-projectile
(use-package helm-projectile
  :ensure t)

(projectile-mode)
