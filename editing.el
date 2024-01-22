
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.12.2/")
(require 'yasnippet)
(setq yas-snippet-dirs '("~/emacs-config/snippets"))
(yas-global-mode)
(setq yas-triggers-in-field t)

(electric-pair-mode 1)

(delete-selection-mode)

;;;
;;; Kotlin
;;;
(require 'flycheck-kotlin)
(add-hook 'kotlin-mode-hook
          (lambda ()
            (flycheck-mode)
            (setq kotlin-tab-width 4)))

;;;
;;; C++
;;;
(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-gcc-language-standard "c++17")
            (setq flycheck-clang-language-standard "c++17")))

;;;
;;; C-Mode common
;;;
(add-hook 'c-mode-common-hook
          (lambda ()
            (flycheck-mode)
            (c-set-offset 'substatement-open 0)
            (setq c++-tab-always-indent t)
            (linum-mode 1)
            (setq c-basic-offset 4)
            (setq c-indent-level 4)))

;;;
;;; JSON
;;;
(add-hook 'json-mode-hook
          (lambda () (local-set-key (kbd "C-c C-c") #'json-pretty-print)))

;;;
;;; Docker
;;;
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


(setq-default indent-tabs-mode nil)


(defun prog-mode-before-save-hook ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))


(add-hook 'before-save-hook 'prog-mode-before-save-hook)


(setq-default fill-column 80)

;; 'git-link prepends https://, which doesn't work for GitHub remotes hosted on
;; the local network.
(defun git-link-http ()
  (interactive)
  (let ((region (git-link--get-region)))
    (git-link (git-link--select-remote)
              (car region)
              (car (cdr region)))
    (kill-new (replace-regexp-in-string "https" "http" (current-kill 0 nil)))))


;;;
;;; skyland-lisp
;;;

(font-lock-add-keywords 'lisp-mode '(("defn" . font-lock-keyword-face)))
(font-lock-add-keywords 'lisp-mode '(("defn/c" . font-lock-keyword-face)))
