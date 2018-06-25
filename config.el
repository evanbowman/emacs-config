;;; My emacs config
;;;
;;; I have this in a separate file so emacs Custom doesn't spit junk
;;; into it.
;;;
;;; Evan Bowman

(require 'package)

(dolist (element '(("melpa" "https://melpa.org/packages/")
                   ("marmalade" "https://marmalade-repo.org/packages/" 5)
                   ("elpa" "http://elpa.gnu.org/packages/" 4)))
  (add-to-list 'package-archives (cons (car element) (cadr element)) t)
  (when (> emacs-major-version 24)
    (add-to-list 'package-archive-priorities (cons (car element) (car (cddr element))) t)))

(package-initialize)

(defun install-dependencies(package-list)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (switch-to-buffer "*Messages*")
      (package-install package))))

(install-dependencies
 (let ((dependencies '(yasnippet
                       cmake-mode
                       magit
                       protobuf-mode
                       flycheck
                       js2-mode
                       lua-mode
                       rust-mode
                       yaml-mode
                       spacemacs-theme
                       ag
                       powerline
                       find-file-in-project)))
   (cond ((> emacs-major-version 24)
          (cons 'magit dependencies))
         (t dependencies))))

(setq ring-bell-function 'ignore)

(load "~/emacs-config/editing.el")
(load "~/emacs-config/appearance.el")

(when (eq system-type 'darwin)
  ;; bind meta key to option (alt)
  (setq mac-option-modifier 'meta)
  ;; smooth scrolling
  (setq mouse-wheel-scroll-amount '(1))
  (setq mouse-wheel-progressive-speed nil))
