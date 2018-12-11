(require 'cc-mode)

(defun my-c-mode-common-hook ()
	(setq c-basic-style "bsd"
    	c-basic-offset 4)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
