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
