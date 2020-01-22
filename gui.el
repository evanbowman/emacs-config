
(setq inhibit-splash-screen t)

(show-paren-mode)

(setq linum-format " %d ")

(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (load-theme 'solarized-dark t))

(require 'powerline)
(powerline-default-theme)

(setq current-theme nil)


(defun set-theme (theme)
  (interactive "theme: ")
  (if current-theme
      (progn
        (disable-theme current-theme)
        (setq current-theme theme)))
  (load-theme theme))
