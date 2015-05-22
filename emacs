(tool-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

;;Enable column number
(setq column-number-mode t)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Support Wheel Mouse Scrolling
(mouse-wheel-mode t)

;; Show line number
;;(global-linum-mode t)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; Hide splash screen
(setq inhibit-splash-screen t)

;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)

(cua-mode 1)

;; Enable Package manager
(require 'package)
(package-initialize)

(require 'ido)
    (ido-mode t)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; NeoTree configuration
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme 'ascii)
;;(require 'dirtree)
;;(global-set-key [f8] '
;;(require 'direx)
;;(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
  
(require 'python-mode)
;; try to automagically figure out indentation
(setq py-smart-indentation t)

(require 'gandalf-theme)
;;(require 'color-theme)
;;(set-background-color "bharadwaj")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-xemacs)
