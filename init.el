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

;; A new maintainer took over ffip and ruined everything. Breaking compatibility
;; and changing the way an existing package works is evil. But some people just
;; don't care. It's amazing how far some people go in the world while creating
;; chaos everywhere they go.
(load (concat config-dir "vendored/find-file-in-project.el"))

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

;; For large insert statements in sql backups, sometimes the output of ag causes
;; a stack overflow in the emacs regexp matcher (which I believe the ag package
;; uses to run syntax highlighting in the compilation buffer). Technically, .sql
;; files can also contain source code, but I personally do not like the idea of
;; implementing complex business logic in sql queries.
(setq-default ag-ignore-list '("*.sql"))

(defun .emacs () (interactive) (find-file user-init-file))
(defun emacs-config () (interactive) (find-file config-dir))

(load "server")
(unless (server-running-p)
  (server-start))
