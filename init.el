;;; My emacs config
;;;
;;; I have this in a separate file so emacs Custom doesn't spit junk
;;; into it.
;;;
;;; Evan Bowman

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
