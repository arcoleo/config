;; Frame title bar formatting to show full path of file
(setq-default
	frame-title-format
	(list '((buffer-file-name " %f" (dired-directory 
		dired-directory
		(revert-buffer-function " %b"
		("%b - Dir:  " default-directory)))))))

(setq-default
	icon-title-format
	(list '((buffer-file-name " %f" (dired-directory
		dired-directory
		(revert-buffer-function " %b"
		("%b - Dir:  " default-directory)))))))
