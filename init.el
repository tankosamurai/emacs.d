;;; Package --- init
;;; Commentary:
;;; tankosamurai\'s emacs init.el
;;; supports emacs 24.4 or higher.
;;; Code:

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'use-package)

(use-package better-defaults)

(use-package pallet
  :init
  (pallet-mode t))

(use-package guru-mode
  :config
  (guru-global-mode t))

(use-package expand-region
  :bind
  ("C-," . er/expand-region)
  ("C-." . er/contract-region))

(use-package company
  :config
  (global-company-mode))

(use-package shackle
  :config
  (shackle-mode)
  (setq shackle-rules '(
    ("\\`\\*helm.*?\\*\\'" :regexp t :align below :ratio 0.8))))

(use-package smooth-scrolling
  :config
  (set 'smooth-scroll-margin 2))

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

(use-package dired-subtree
  :config
  (bind-keys :map dired-mode-map
    ("i" . dired-subtree-toggle)))

(use-package helm-company
  :config
  (setq company-idle-delay 0.1)
  (bind-keys :map company-mode-map
    ("C-:" . helm-company))
  (bind-keys :map company-active-map
    ("C-:" . helm-company)))

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
  ("C-c h" . helm-mini))

(use-package auto-save-buffers-enhanced
  :config
  (auto-save-buffers-enhanced t))

(use-package ws-butler
  :config
  (ws-butler-global-mode))

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-screen t)
(setq-default inhibit-splash-screen t)
(setq-default truncate-lines t)
;; (setq-default make-backup-files nil)
;; (setq-default auto-save-default nil)
(setq-default debug-on-error t)
(setq-default dired-listing-switches "-aBhl  --group-directories-first")
(setq-default frame-title-format "%b - emacs")
(setq-default require-final-newline t)
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)
(cua-mode t)
(column-number-mode t)

(provide 'init)
;;; init.el ends here
