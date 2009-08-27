;; code to place all backups in one location

(when (not (file-directory-p "~/.backup"))
	(make-directory "~/.backup"))
(if (file-directory-p "~/.backup")
	(setq backup-directory-alist '(("." . "~/backup"))))

