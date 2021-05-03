
(setq inhibit-splash-screen t)

(show-paren-mode)

(setq linum-format " %d ")

(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (load-theme 'spacemacs-dark t))

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


(defun light-theme ()
  (interactive)
  (load-theme 'spacemacs-light))


(defun dark-theme ()
  (interactive)
  (load-theme 'spacemacs-dark))


(require 'tea-time)

(setq tea-time-sound (concat config-dir "Temple_Bell.wav"))

(defun herbal-tea ()
  (interactive)
  (tea-timer (* 3 60)))

(defun green-tea ()
  (interactive)
  (tea-timer (* 3 60)))

(defun black-tea ()
  (interactive)
  (tea-timer (* 5 60)))
