;; ------------------------------
;; Csomagkezelő beállítások

(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-always-defer t) ;; lazy load

;; ------------------------------
;; Környezeti PATH (NVM Node.js, PHPactor, stb)

(use-package exec-path-from-shell
  :config
  (dolist (var '("PATH" "NVM_DIR" "NODE_PATH"))
    (add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))

(add-to-list 'exec-path "/usr/bin")
(setenv "PATH" (concat "/usr/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/home/zsolt/phpactor-lsp/vendor/bin")
(setenv "PATH" (concat "/home/zsolt/phpactor-lsp/vendor/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/home/zsolt/.local/bin")
(setenv "PATH" (concat "/home/zsolt/.local/bin:" (getenv "PATH")))
(add-to-list 'exec-path "/home/zsolt/.nvm/versions/node/v18.20.8/bin")
(setenv "PATH" (concat "/home/zsolt/.nvm/versions/node/v18.20.8/bin/:" (getenv "PATH")))


;; ------------------------------
;; Alap csomagok

(use-package company
  :config (global-company-mode))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package yasnippet
  :config (yas-global-mode 1))

(use-package which-key
  :config (which-key-mode))

(use-package dtrt-indent
  :config (dtrt-indent-mode 1)) ;; automatikus indent detektálás

;; ------------------------------
;; LSP beállítás

(use-package lsp-mode
  :commands lsp
  :hook ((php-mode        . lsp)
         (python-mode     . lsp)
         (js2-mode        . lsp)
         (typescript-mode . lsp)
         (web-mode        . lsp)
         (c-mode          . lsp)
         (c++-mode        . lsp)
         (emacs-lisp-mode . lsp))
  :custom
  (lsp-auto-guess-root t)
  (lsp-file-watch-ignored-directories nil)
  (lsp-disabled-clients '(php-ls intelephense deno-ls pylsp ty-ls ruff-lsp))
  :config
  ;; PHPactor LSP kliens
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda ()
                       (if (executable-find "php")
                           '("/home/zsolt/phpactor-lsp/vendor/bin/phpactor" "language-server")
                         (error "PHP nem található a PATH-ban!"))))
    :major-modes '(php-mode)
    :server-id 'phpactor
    :priority 999)))

;; Python pyright LSP
(use-package lsp-pyright
  :after lsp-mode
  :hook (python-mode . lsp)
  :custom (lsp-pyright-python-executable-cmd "python3"))

;; ------------------------------
;; LSP UI és formázás

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-peek-enable t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-imenu-enable t)
  (lsp-ui-flycheck-enable t))

(use-package format-all
  :hook (prog-mode . format-all-mode))

;; ------------------------------
;; Nyelvek és módok

(use-package php-mode)
(use-package python-mode)
(use-package js2-mode :mode "\\.js\\'")
(use-package typescript-mode :mode "\\.ts\\'")
(use-package web-mode
  :mode ("\\.html\\'" "\\.blade\\.php\\'" "\\.tsx\\'" "\\.jsx\\'")
  :config (setq web-mode-enable-auto-quoting nil)) ;; ne generáljon automatikus idézőjeleket

(use-package emmet-mode
  :hook (web-mode css-mode))

(use-package cc-mode) ;; C és C++
(use-package sql-mode :ensure nil) ;; beépített

;; Emacs Lisp: beépített

;; ------------------------------
;; Debugging (DAP) - Debug Adapter Protocol

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  ;; PHP debug adapter (Xdebug)
  ;; Feltételezve, hogy Xdebug telepítve van PHP-hez
  ;; Beállítási példa:
  (require 'dap-php)
  ;; Python debug adapter
  (require 'dap-python)
  ;; JS debug adapter
  (require 'dap-node)
  ;; További adaptereket telepíthetsz szükség szerint
  )

;; ------------------------------
;; Egyéb hasznos beállítások

;; Tab helyett szóközök minden programozási módban
(setq-default indent-tabs-mode nil)

;; Automatikus backup fájlok kikapcsolása (ha zavar)
(setq make-backup-files nil)

;; Gyorsabb buffer váltás, jobban átlátható minibuffer
(use-package ivy
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :config (counsel-mode 1))

(use-package swiper
  :after ivy)

;; ------------------------------
;; Indulási idő megjelenítése

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs betöltve %s alatt" (emacs-init-time))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
