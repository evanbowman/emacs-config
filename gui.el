
(setq inhibit-splash-screen t)

(show-paren-mode)

(setq linum-format " %d ")

(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (load-theme 'spacemacs-dark t))

(require 'powerline)
(powerline-default-theme)

(display-time-mode 1)
(set 'display-time-default-load-average nil)
