;;;
;;; Entry Point
;;;

(setq ring-bell-function 'ignore)

(dolist (element '("deps"
                   "editing"
                   "gui"
                   "keys"))
  (let ((path (concat "~/emacs-config/" element)))
    (when (not (load path))
      (error "failed to load %s") path)))

;; I still like google better
(setq eww-search-prefix "https://www.google.com/search?q=")

(defun .emacs () (interactive) (find-file user-init-file))
(defun emacs-config () (interactive) (find-file "~/emacs-config/"))
