;; code to place all backups in one location

(when (not (file-directory-p "~/.emacs.d/.backup"))
    (make-directory "~/.emacs.d/.backup"))
(if (file-directory-p "~/.emacs.d/.backup")
    (setq backup-directory-alist '(("." . "~/.emacs.d/backup"))))

