;; ui tweaks
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq truncate-lines t)
(setq org-agenda-files '("~/Documents/college/third/second_sem/college.org"))
(add-to-list 'load-path (expand-file-name "packages" user-emacs-directory))


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)


;; mics
(use-package diminish
  :ensure t)

(use-package no-littering
  :ensure t
  :config
  (no-littering-theme-backups)
  )

;; undo-tree
(use-package undo-tree
  :diminish
  :ensure t
  :config
  (global-undo-tree-mode 1))

(use-package vterm
  :ensure t
  :config
  (setq shell-file-name "/bin/zsh"
        vterm-max-scrollback 5000
        vterm-timer-delay 0.01)
  )

;; (use-package vterm-toggle
;;   :after vterm
;;   )

;; magit
(use-package magit
  :ensure t)

;; evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree)
  )

(use-package evil-collection
  :after evil
  :ensure t
  :init
  (evil-collection-init))

(use-package evil-commentary
  :ensure t
  :after evil
  :init
  (evil-commentary-mode)
  )

;; vertico
;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

(use-package vertico
  :ensure t
  :after evil electric
  :custom
  (vertico-count 10) ;; Show more candidates
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode)
  :config
  (define-key vertico-map (kbd "C-j") #'vertico-next)
  (define-key vertico-map (kbd "C-k") #'vertico-previous)
  )

(use-package corfu
  :ensure t
  :custom
  (corfu-cycle t)
  :init
  (global-corfu-mode)
  )

(use-package cape
  :ensure t
  :bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
  ;; Alternatively bind Cape commands individually.
  :bind (("C-c f" . cape-file))
  ;;        ("C-c p h" . cape-history)
  ;;        ("C-c p f" . cape-file)
  ;;        ...)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  )

(use-package orderless
  :ensure t
  :custom
  ;; (orderless-style-dispatchers '(orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; which key
(use-package which-key
  :init
  (which-key-mode 1)
  :diminish
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order
        which-key-allow-imprecise-window-fit nil
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.3
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit nil
        which-key-separator " -> " ))

;; zen

(use-package visual-fill-column
  :ensure t)

(require 'writeroom-mode)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "C-a") 'dired-create-empty-file)
  )

;; keybindings
(use-package general
  :ensure t
  :config
  (general-evil-setup)
  )


;; keybindings
;;;; Create a leader key definition
(general-create-definer my-leader
  :states '(normal insert visual emacs)
  :keymaps 'override
  :prefix "SPC" ;; set leader
  :global-prefix "M-SPC") ;; access leader in insert mode

(my-leader
 ;; buffers
 "b"  '(:ignore t :wk "buffer")
 "bb" '(switch-to-buffer :wk "Switch buffer")
 "bi" '(ibuffer :wk "Ibuffer")
 "bd" '(kill-current-buffer :wk "Kill this buffer")
 "bn" '(next-buffer :wk "Next buffer")
 "bp" '(previous-buffer :wk "Previous buffer")
 "br" '(revert-buffer :wk "Reload buffer")
 ;; files
 "f"  '(:ignore t :wk "Files")
 "ff" '(find-file :wk "Find File")
 "fd" '(dired :wk "Dired")
 ;; evaluation
 "e"  '(:ignore t :wk "Evaluation")
 "ee" '(eval-last-sexp :wk "Evaluate last expression")
 "er" '(eval-buffer ~/.config/emacs/init.el :wk "Evaluate config file")
 ;; magit
 "g"  '(:ignore t :wk "Magit")
 "gg" '(magit :wk "Magit")
 ;; windows
 "w"  '(:ignore t :wk "Windows")
 "wv" '(split-window-vertically :wk "split vertical window")
 "wh" '(split-window-below :wk "split horizontal window")

 "vt" '(vterm :wk "vterm")

 "uz" '(writeroom-mode :wk "Zen Mode")
 )

(global-set-key (kbd "<escape>") 'keyboard-quit)
(evil-define-key 'normal 'global (kbd "K") 'man)
()

;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; transparency
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))


;; fonts
(set-face-attribute 'default nil
                    :family "blexmono nerd font"
                    :height 160
                    )

(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)

;; lsp
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (c-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp-deferred)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.1
      company-minimum-prefix-length 1
      lsp-headerline-breadcrumb-enable nil
      lsp-idle-delay 1.0)

(font-lock-add-keywords
 'c-mode
 '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-call-face)))

(setq header-line-format nil)
(setq lsp-headerline-breadcrumb-enable nil)
(load-theme 'violetdream t)

(use-package org)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(corfu diminish dired dired-du evil-collection evil-commentary
           general magit no-littering orderless undo-tree vertico
           visual-fill-column vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
