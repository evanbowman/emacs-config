
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
            (setq flycheck-gcc-language-standard "c++11")
            (setq flycheck-clang-language-standard "c++11")))

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

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun query-replace-swap (a b)
  "Swap two pieces of text wherever they appear, using `query-replace-regexp'."
  (interactive "sSwap: \nswith: ")
  (let ((use-region (and transient-mark-mode mark-active)))
    (query-replace-regexp
     (rx (or (group (eval a)) (eval b)))
     (quote (replace-eval-replacement replace-quote (if (match-string 1) b a)))
     nil
     (when use-region (region-beginning))
     (when use-region (region-end)))))

(setq-default fill-column 80)

;; 'git-link prepends https://, which doesn't work for GitHub remotes hosted on
;; the local network.
(defun git-link-lan ()
  (interactive)
  (let ((region (git-link--get-region)))
    (git-link (git-link--select-remote)
              (car region)
              (car (cdr region)))
    (kill-new (substring (current-kill 0 nil) 8))))
