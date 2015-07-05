;;; Package --- init
;;; Commentary:
;;; tankosamurai\'s emacs init.el
;;; supports emacs 24.4 or higher.
;;; Code:

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'use-package)

(use-package better-defaults)

(use-package tomorrow-color-theme)

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(use-package pallet
  :init
  (pallet-mode t))

(use-package guru-mode
  :config
  (guru-global-mode t))

(use-package expand-region
  :bind
  ("C-c e" . er/expand-region))

(use-package yasnippet
  :init
  (yas-global-mode t))

(use-package company
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.125)
  (setq company-minimum-prefix-length 1)
  :bind
  ("C-c y" . company-yasnippet))

(use-package smooth-scrolling
  :config
  (set 'smooth-scroll-margin 1))

(use-package smartparens
  :config
  (smartparens-global-mode t))

(use-package flycheck
  :config
  (global-flycheck-mode t))

(use-package magit
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  :bind
  ("C-c m" . magit-status))

(use-package wdired
  :config
  (bind-keys :map dired-mode-map
    ("r" . wdired-change-to-wdired-mode)))

(use-package dired-subtree
  :config
  (bind-keys :map dired-mode-map
    ("i" . dired-subtree-toggle)))

(use-package projectile
  :config
  (setq projectile-completion-system 'grizzl))

(use-package helm-projectile
  :config
  (helm-projectile-on)
  :bind
  ("C-c p" . helm-projectile))

(use-package helm-config
  :init
  (helm-mode t)
  :bind
  ("C-x b" . helm-buffers-list)
  ("C-c h" . helm-mini))

(use-package whitespace-cleanup-mode
  :init
  (global-whitespace-cleanup-mode))

(use-package haskell-mode
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))

(cond
 ((eq system-type 'gnu/linux)
  (setq-default dired-listing-switches "-aBhl --group-directories-first"))
 ((eq window-system 'mac)
  (setq-default ns-command-modifier 'meta)
  (setq-default ns-alternate-modifier 'super)))

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-screen t)
(setq-default inhibit-splash-screen t)
(setq-default truncate-lines t)
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(setq-default debug-on-error t)
(setq-default frame-title-format "%b - emacs")
(setq-default require-final-newline t)
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)
(global-unset-key (kbd "C-x C-c"))
(cua-mode t)
(column-number-mode t)

(provide 'init)
;;; init.el ends here
