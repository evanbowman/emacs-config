
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.12.2/")
(require 'yasnippet)
(setq yas-snippet-dirs '("~/config/snippets"))
(yas-global-mode)
(setq yas-triggers-in-field t)

(electric-pair-mode 1)

(global-set-key (kbd "M-{") 'insert-pair) ;; To match builtin cmd for parens

(delete-selection-mode)

(windmove-default-keybindings)

(defun my-c-mode-common-hook ()
  (flycheck-mode)
  (c-set-offset 'substatement-open 0)
  (setq c++-tab-always-indent t)
  (linum-mode 1)
  (setq c-basic-offset 4)
  (setq c-indent-level 4))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)