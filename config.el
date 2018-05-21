;;; My emacs config
;;;
;;; I have this in a separate file so emacs Custom doesn't spit junk
;;; into it.
;;;
;;; Evan Bowman

(require 'package)

(dolist (element '(("melpa" "https://melpa.org/packages/" 10)
                   ("marmalade" "https://marmalade-repo.org/packages/" 5)
                   ("elpa" "http://elpa.gnu.org/packages/" 4)))
  (add-to-list 'package-archives (cons (car element) (cadr element)) t)
  (add-to-list 'package-archive-priorities (cons (car element) (car (cddr element))) t))

(package-initialize)

(defun install-dependencies(package-list)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (switch-to-buffer "*Messages*")
      (package-install package))))

(install-dependencies '(yasnippet
                        cmake-mode
                        magit
                        protobuf-mode
                        flycheck
                        js2-mode
                        lua-mode
                        rust-mode
                        yaml-mode
                        spacemacs-theme
                        gruvbox-theme
                        ag
                        powerline))

(setq ring-bell-function 'ignore)

(load "~/config/editing.el")
(load "~/config/appearance.el")

(when (eq system-type 'darwin)
  ;; bind meta key to option (alt)
  (setq mac-option-modifier 'meta)
  ;; smooth scrolling
  (setq mouse-wheel-scroll-amount '(1))
  (setq mouse-wheel-progressive-speed nil))
