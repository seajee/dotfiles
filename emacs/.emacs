(setq inhibit-startup-message t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(load-theme 'gruber-darker t)
(set-frame-font "Iosevka 13" nil t)

(push '(fullscreen . maximized) default-frame-alist)

(savehist-mode 1)
(save-place-mode 1)

(setq custom-file "~/.emacs-custom")
(load custom-file 'noerror 'nomessage)

(setq make-backup-files nil)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(unless (package-installed-p 'gruber-darker-theme)
  (package-refresh-contents)
  (package-install 'gruber-darker-theme))

(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
