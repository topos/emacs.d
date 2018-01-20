(require 'auto-complete)
(add-to-list 'ac-modes 'sql-mode)

;; depends on setting up ssh tunnels
(setq sql-connection-alist
      '((giltprod (sql-product 'postgres)
                  (sql-server "localhost")
                  (sql-port 5632)
                  (sql-user "gilt_prod_readonly")
                  (sql-database "gilt_prod"))
        (irishub (sql-product 'postgres)
                 (sql-port 5532)
                 (sql-server "localhost")
                 (sql-user "irishub_readonly")
                 (sql-database "irishub"))))

(defun sql-giltprod ()
  (interactive)
  (setq sql-product 'postgres)
  (sql-connect 'giltprod))

(defun sql-irishub ()
  (interactive)
  (setq sql-product 'postgres)
  (sql-connect 'irishub))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)
            (setq-local show-trailing-whitespace nil)
            (auto-complete-mode t)))

(add-hook 'sql-mode-hook
          (lambda ()
            (setq-local ac-ignore-case t)
            (auto-complete-mode)))
