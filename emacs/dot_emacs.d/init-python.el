

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)
(add-hook 'python-mode-hook
      (lambda ()
	(set-variable 'py-indent-offset 4)
	(set-variable 'indent-tabs-mode nil)
	(setq py-smart-indentation nil)
    (setq py-indent-offset 4)
    (setq py-continuation-offset 0)

	(define-key py-mode-map (kbd "RET") 'newline-and-indent)
	(smart-operator-mode-on)
	))
    
;; pymacs
(setenv "PYMACS_PYTHON" "python2.6") 
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(eval-after-load "pymacs"
    '(add-to-list 'load-path "~/apps/emacs/rope/ropemacs")
)
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)
