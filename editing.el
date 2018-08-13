
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.12.2/")
(require 'yasnippet)
(setq yas-snippet-dirs '("~/emacs-config/snippets"))
(yas-global-mode)
(setq yas-triggers-in-field t)

(electric-pair-mode 1)

(global-set-key (kbd "M-{") 'insert-pair) ;; To match builtin cmd for parens

(delete-selection-mode)

(windmove-default-keybindings)

(defun my-c-mode-common-hook ()
  (flycheck-mode)
  (highlight-lines-matching-regexp ".\{81\}" 'hi-yellow)
  (c-set-offset 'substatement-open 0)
  (setq c++-tab-always-indent t)
  (linum-mode 1)
  (setq c-basic-offset 4)
  (setq c-indent-level 4))

(global-set-key (kbd "C-x C-g") 'ffip)
(global-set-key (kbd "C-x C-a") 'ag)

;; Replacement for <C-up> and <C-down>
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

((lambda ()
   ;; I'm having trouble breaking my arrow key habit, maybe disabling them will help
   (global-unset-key (kbd "<left>"))
   (global-unset-key (kbd "<right>"))
   (global-unset-key (kbd "<up>"))
   (global-unset-key (kbd "<down>"))
   (global-unset-key (kbd "<C-left>"))
   (global-unset-key (kbd "<C-right>"))
   (global-unset-key (kbd "<C-up>"))
   (global-unset-key (kbd "<C-down>"))
   (global-unset-key (kbd "<M-left>"))
   (global-unset-key (kbd "<M-right>"))
   (global-unset-key (kbd "<M-up>"))
   (global-unset-key (kbd "<M-down>"))))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

(setq-default indent-tabs-mode nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
