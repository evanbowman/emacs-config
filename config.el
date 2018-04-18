;;; My emacs config
;;;
;;; I have this in a separate file so emacs Custom doesn't spit junk
;;; into it.
;;;
;;; Evan Bowman

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(setq package-list '(yasnippet
                     cmake-mode
                     magit
                     protobuf-mode
                     js2-mode
                     lua-mode
                     rust-mode
                     yaml-mode
                     zenburn-theme))

(package-initialize)

(defun install-dependencies(package-list)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

(install-dependencies package-list)

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.12.2/")
(require 'yasnippet)
(setq yas-snippet-dirs '("~/config/snippets"))
(yas-global-mode)
(setq yas-triggers-in-field t)

(setq inhibit-splash-screen t)

(electric-pair-mode 1)
(show-paren-mode)
(global-set-key (kbd "M-{") 'insert-pair) ;; To match builtin cmd for parens

(scroll-bar-mode -1)
(tool-bar-mode -1)
(delete-selection-mode)
(setq ring-bell-function 'ignore)

(setq linum-format " %d ")

(windmove-default-keybindings)

(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  (setq c++-tab-always-indent t)
  (linum-mode 1)
  (setq c-basic-offset 4)
  (setq c-indent-level 4))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(setq-default indent-tabs-mode nil)

(when (eq system-type 'darwin)
  ;; bind meta key to option (alt)
  (setq mac-option-modifier 'meta)
  ;; smooth scrolling
  (setq mouse-wheel-scroll-amount '(1))
  (setq mouse-wheel-progressive-speed nil))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; The only thing missing at this point is the custom syntax theme. I
;; don't have it autoloaded except in the .emacs, because load-theme
;; is unreliable in emacs -nw and I want the config to be completely
;; portable.
