;; ui tweaks
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(toggle-truncate-lines t)

(setq org-agenda-files '("~/college/senior/sched.org"))

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu-devel" . "https://elpa.gnu.org/devel/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

(package-initialize)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      lsp-headerline-breadcrumb-enable nil
      lsp-idle-delay 1.0
      lsp-headerline-breadcrumb-enable nil
      header-line-format nil
      )

(use-package exec-path-from-shell
  :ensure t
  :demand t
  :config
  (exec-path-from-shell-initialize))

;; (load-theme 'violetdream t)

(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  (doom-themes-treemacs-theme "doom-tokyo-night")
  :config
  (load-theme 'doom-tokyo-night t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; fonts
(set-face-attribute 'default nil
		    ;; :family "departuremono nerd font"
		    :family "blexmono nerd font"
		    ;; :family "victormono nerd font"
		    :height 130
            :weight 'medium 
		    )

(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)

;; transparency
(set-frame-parameter nil 'alpha-background 90) ;; frames (emacs client)
(add-to-list 'default-frame-alist '(alpha-background . 90)) ;; default window (emacs)

;; evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo)
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

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1)
  )


;; mics
(use-package diminish
  :ensure t)

(use-package no-littering
  :ensure t
  :init
  (setq no-littering-etc-directory "~/.cache/emacs/etc/")
  (setq no-littering-var-directory "~/.cache/emacs/var/")
  :config
  (no-littering-theme-backups))

;; undo-tree
;; (use-package undo-tree
;;   :diminish
;;   :ensure t
;;   :config
;;   (global-undo-tree-mode 1)
;;   (setq undo-tree-auto-save-history 0))

(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'"))

(use-package nix-drv-mode
  :ensure nix-mode
  :mode "\\.drv\\'")

(use-package nix-shell
  :ensure nix-mode
  :commands (nix-shell-unpack nix-shell-configure nix-shell-build))

(use-package nix-repl
  :ensure nix-mode
  :commands (nix-repl))

(use-package direnv
  :ensure t
  :config
  (direnv-mode))

(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'"
  :hook ((dockerfile-mode . lsp-deferred)
         (before-save . lsp-format-buffer)))

;; shell-file-name "/usr/bin/zsh"
(use-package vterm
  :ensure t
  :config
  (setq vterm-max-scrollback 5000
        vterm-kill-buffer-on-exit t
        vterm-timer-delay 0.00)
  (add-hook 'vterm-mode-hook (lambda ()
                               (display-line-numbers-mode -1)))
  )

(use-package multi-vterm
  :ensure t
  :config
  (add-hook 'vterm-mode-hook
            (lambda ()
              (setq-local evil-insert-state-cursor 'box)
              (evil-insert-state)))
  (define-key vterm-mode-map [return]                      #'vterm-send-return)

  (setq vterm-keymap-exceptions nil)
  (evil-define-key 'insert vterm-mode-map (kbd "C-c <escape>") #'vterm--next-insert)
  )


;; (use-package vterm-toggle
;;   :after vterm
;;   )

;; magit
(use-package transient 
  :ensure t)
(use-package magit
  :ensure t)

;;;;;;;;;;;; ts ;;;;;;;;;;;;

(require 'treesit)

(use-package astro-ts-mode)

(use-package typst-ts-mode
  :ensure t
  :custom
  (typst-ts-mode-watch-options "--open"))

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  ;; (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t))
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

;; go
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (before-save . gofmt-before-save)))

;;;;;;;;;;;; lsp ;;;;;;;;;;;;

(defun get-ts-path ()
  (let* ((output (shell-command-to-string
                  "nix-store --query --requisites /run/current-system | grep typescript | sed -n '2p'"))
         (trimmed (string-trim output)))
    (concat trimmed "/lib/node_modules/typescript/lib")))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-completion-provider :none)
  :hook ((c-mode             . lsp-deferred)
         (c++-mode           . lsp-deferred)
         (php-mode           . lsp-deferred)
         (js-mode            . lsp-deferred)
         (js-ts-mode         . lsp-deferred)
         (python-mode        . lsp-deferred)
         (css-ts-mode        . lsp-deferred)
         (typescript-ts-mode . lsp-deferred)
         (nix-mode           . lsp-deferred)
         (rustic-mode        . lsp-deferred)
         (tsx-ts-mode        . lsp-deferred)
         (go-mode            . lsp-deferred)
         (lsp-mode           . lsp-enable-which-key-integration))
  :config
  ;; C
  (setq lsp-clients-clangd-executable "clangd")
  (setq lsp-clients-clangd-args
        '("--background-index"      ; index project in background
          "--clang-tidy"            ; enable clang-tidy diagnostics
          "--completion-style=detailed"
          "--header-insertion=never"
          "--log=error"))
  (setq lsp-enable-on-type-formatting nil)

  ;; rust
  (setq lsp-eldoc-render-all t)
  (setq eldoc-echo-area-use-multiline-p 1)
  (setq lsp-idle-delay 0.6)
  (setq lsp-inlay-hint-enable t)
  (setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (setq lsp-rust-analyzer-display-closure-return-type-hints t)
  (setq lsp-rust-analyzer-display-parameter-hints nil)
  (setq lsp-auto-guess-root nil)
  :commands lsp-deferred)


(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-position 'at-point)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-peek-enable t))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(astro-ts-mode . "astro"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("astro-ls" "--stdio"))
    :activation-fn (lsp-activate-on "astro")
    :server-id 'astro-ls
    :initialization-options
    (lambda ()
      (list :typescript
            (list :tsdk (get-ts-path)))))))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "typst"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection '("tinymist" "--stdio"))
    :activation-fn (lsp-activate-on "typst")
    :server-id 'tinymist
    )))

(use-package lsp-tailwindcss
  :ensure t
  :after lsp-mode
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  :config
  (setq lsp-tailwindcss-server-path
        "/etc/profiles/per-user/owlenz/bin/tailwindcss-language-server")
  (setq lsp-tailwindcss-server-command
        `(,(executable-find "tailwindcss-language-server") "--stdio"))
  (setq lsp-tailwindcss-server-options
        `(:typescript (:tsdk ,(get-ts-path))))
  (dolist (mode '(astro-ts-mode css-ts-mode typescript-ts-mode tsx-ts-mode js-ts-mode))
    (add-to-list 'lsp-tailwindcss-major-modes mode)))


;; WEB MODE
(use-package web-mode
  :ensure t)

(add-hook 'c-mode-hook 'hs-minor-mode)

(add-hook 'org-mode-hook
          (lambda ()
            (visual-line-mode 1)
            (display-line-numbers-mode -1)
            (flyspell-mode 1)))

;; EGLOT
;; (use-package eglot
;;   :ensure t
;;   :config
;;   (let ((ts-path (get-ts-path)))
;;     (message "ts-path: %s" ts-path)
;;     (add-to-list 'eglot-server-programs
;;                  '(astro-mode . ("astro-ls" "--stdio"
;;                                  :initializationOptions
;;                                  (:typescript (:tsdk (concat ts-path "/lib/node_modules/typescript/lib")))))))
;;   (add-to-list 'eglot-server-programs
;;                `((typst-ts-mode) .
;;                  ,(eglot-alternatives `("tinymist"
;;                                         ,typst-ts-lsp-download-path
;;                                         "typst-lsp"))))
;;   :init
;;   (add-hook 'astro-mode-hook 'eglot-ensure)
;;   )

(use-package php-mode
  :ensure t
  :hook (php-mode . my-php-mode-setup)
  :bind (:map php-mode-map ("M-<tab>" . completion-at-point))
  :config
  (setq php-manual-path "~/php_manual")
  (custom-set-variables
   '(php-mode-coding-style 'psr2)
   '(php-mode-template-compatibility nil)
   '(php-imenu-generic-expression 'php-imenu-generic-expression))
  (defun my-php-mode-setup ()
    (setq-local completion-at-point-functions
                (list #'php-complete-complete-function)
                        )))



;; vertico
;; Emacs minibuffer configurations.
(use-package emacs
  :ensure nil
  :custom
  (enable-recursive-minibuffers t)
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
  :bind ("C-c p" . cape-prefix-map)
  :bind ("M-<tab>" . completion-at-point)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package eat :ensure t)

(use-package eca
  :ensure t
  :vc (:url "https://github.com/editor-code-assistant/eca-emacs" :rev :newest))

(use-package savehist
  :config
  (savehist-mode 1))

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


;;;;;;;;; dired ;;;;;;;;;
(use-package dired
  :custom ((dired-listing-switches "-algh --group-directories-first")))

(with-eval-after-load 'dired
  (put 'dired-find-alternate-file 'disabled nil)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map [mouse-2] 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "C-a") 'dired-create-empty-file))

;; (use-package nerd-icons-dired
;;   :ensure t
;;   :hook (dired-mode . nerd-icons-dired-mode))
  

;; keybindings
(use-package general
  :ensure t
  :config 
  (general-evil-setup)
  )

(general-create-definer my-leader
  :states '(normal insert visual emacs)
  :keymaps 'override
  :prefix "SPC" ;; set leader
  :global-prefix "M-SPC")
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

  "vt" '(multi-vterm :wk "multi vterm")
  )

;; keybindings
(global-set-key (kbd "<escape>") 'keyboard-quit)
(evil-define-key 'normal 'global (kbd "K") 'man)

;; lsp
(use-package lsp-java
  :ensure t)


(use-package ein 
  :ensure t)


(use-package dap-mode 
  :ensure t)


(use-package pyvenv
  :ensure t
  :config (pyvenv-mode)
  )


(font-lock-add-keywords
 'c-mode
 '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-call-face)))

(use-package org
  :ensure t
  )
