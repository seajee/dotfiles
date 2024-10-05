(setq inhibit-startup-message t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(load-theme 'modus-vivendi t)
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
;; (package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
