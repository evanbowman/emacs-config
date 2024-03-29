
(global-set-key (kbd "M-{") 'insert-pair)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-;") 'avy-goto-char)
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
(global-unset-key (kbd "<M-down>"))

(global-set-key (kbd "C-1") 'ff-find-other-file)
(global-set-key (kbd "C-2") 'ag-project)
(global-set-key (kbd "C-3") 'ffip)
(global-set-key (kbd "C-8") 'compile)
(global-set-key (kbd "C-9") 'magit-status)

(defun swap-theme ()
  (interactive)
  (if (eq *current-theme* 'spacemacs-dark)
      (setq *current-theme* 'spacemacs-light)
    (setq *current-theme* 'spacemacs-dark))
  (load-theme *current-theme* t))

(global-set-key (kbd "C-7") 'swap-theme)


(when (eq system-type 'darwin)
  ;; bind meta key to option (alt)
  (setq mac-option-modifier 'meta)
  ;; smooth scrolling
  (setq mouse-wheel-scroll-amount '(1))
  (setq mouse-wheel-progressive-speed nil))

(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)
