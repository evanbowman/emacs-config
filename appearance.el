
(setq inhibit-splash-screen t)

(show-paren-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq linum-format " %d ")

(when window-system (load-theme 'gruvbox t))

(require 'powerline)
(powerline-default-theme)
