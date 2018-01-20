(eval-when-compile (require 'use-package))
;;(require 'diminish) ;; if you use :diminish
;;(require 'bind-key) ;; if you use any :bind variant

(add-hook 'auto-mode-alist '(".hs$" . haskell-mode))
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(use-package intero :ensure t)
(intero-global-mode 1)
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;;(add-hook 'haskell-mode-hook 'intero-mode)

;;(use-package ensime :commands ensime ensime-mode)
(use-package ensime :ensure t)
(use-package sbt-mode :ensure t)
(use-package scala-mode :ensure t)
(add-hook 'scala-mode-hook 'ensime-mode)

(setq defer-loading-jde t)
(autoload 'jde-mode "jde" "JDE mode." t)
(setq auto-mode-alist (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))
(setq jdee-server-dir "/home/ml/src/jdee-server/target")

(add-hook 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-hook 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-hook 'auto-mode-alist '("rake$" . ruby-mode))

(add-hook 'go-mode-hook (lambda ()
                          (setq-default)
                          (setq tab-width 2)
                          (setq standard-indent 2)
                          (setq indent-tabs-mode nil)))

(add-hook 'json-mode-hook (lambda ()
                            (make-local-variable 'js-indent-level)
                            (setq js-indent-level 2)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default whitespace-line-column 256)
