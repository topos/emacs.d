(require 'package)

(package-initialize)

(defun ensure-package-installed (&rest packages)
  "ensure packages are installed, ask for installation if it’s not"
  (mapcar
   (lambda (package)
     (unless (package-installed-p package)
       (package-install package)))
   packages)
  )

;; add package names to the list
(ensure-package-installed
 'ace-window
 'anzu
 'auto-complete
 'browse-kill-ring
 'csv-mode
 'dash
 'diff-hl
 'diminish
 'discover-my-major
 'dockerfile-mode
 'easy-kill
 'ensime
 'epl
 'exec-path-from-shell
 'expand-region
 'flycheck
 'gist
 'git-timemachine
 'gitconfig-mode
 'gitignore-mode
 'god-mode
 'grizzl
 'guru-mode
 'haskell-mode
 'json-mode
 'magit
 'markdown-mode
 'move-text
 'operate-on-number
 'ov
 'paganini-theme
 'pg
 'projectile
 'scala-mode
 'smart-mode-line
 'smartparens
 'smartrep
 'sqlplus
 'sqlup-mode
 'undo-tree
 'use-package
 'vkill
 'volatile-highlights
 'web-mode
 'yaml-mode
 'zenburn-theme
 'zop-to-char
 )
