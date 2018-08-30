
(require 'package)

(dolist (element '(("melpa" "https://melpa.org/packages/" 9)
                   ("marmalade" "https://marmalade-repo.org/packages/" 5)
                   ("elpa" "http://elpa.gnu.org/packages/" 4)))
  (add-to-list 'package-archives (cons (car element) (cadr element)) t)
  (when (> emacs-major-version 24)
    (add-to-list 'package-archive-priorities (cons (car element) (car (cddr element))) t)))

(package-initialize)

((lambda (package-list)
   (unless package-archive-contents
     (package-refresh-contents))
   (dolist (package package-list)
     (unless (package-installed-p package)
       (switch-to-buffer "*Messages*")
       (package-install package))))
 (let ((dependencies '(yasnippet
                       cmake-mode
                       js2-mode
                       lua-mode
                       rust-mode
                       yaml-mode
                       protobuf-mode
                       flycheck
                       spacemacs-theme
                       ag
                       powerline
                       find-file-in-project
                       avy)))
   (cond ((> emacs-major-version 24)
          (append '(magit) dependencies))
         (t dependencies))))
