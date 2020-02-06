;;;
;;; Entry Point
;;;

(setq ring-bell-function 'ignore)

(setq config-dir (file-name-directory load-file-name))
(message config-dir)

(dolist (element '("deps"
                   "editing"
                   "gui"
                   "keys"))
  (let ((path (concat config-dir element)))
    (message path)
    (when (not (load path))
      (error "failed to load %s") path)))

(cond
 ((eq system-type 'windows-nt)
  ;; Magit needs to be told where git lives in Windows, ffip needs to know
  ;; where find lives, and the git package from the git website conveniently
  ;; includes both executables.
  (let ((git-loc "c:/Users/ebowman/AppData/Local/Programs/Git/"))
    (setq ffip-find-executable (concat git-loc "usr/bin/find.exe"))
    (setq magit-git-executable (concat git-loc "bin/git.exe")))

  ;; FIXME! Better to put it in AppData, but I was lazy and had it on my
  ;; Desktop on the particular occasion when I had to use Windows for a
  ;; presentation.
  (setq ag-executable "c:/Users/ebowman/Desktop/bin/ag.exe")))

;; I still like google better
(setq eww-search-prefix "https://www.google.com/search?q=")

(defun .emacs () (interactive) (find-file user-init-file))
(defun emacs-config () (interactive) (find-file config-dir))

(load "server")
(unless (server-running-p)
  (server-start))
