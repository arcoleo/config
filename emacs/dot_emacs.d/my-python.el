(defun my-python ()
	(lambda ()
		(autoload 'python-mode "python-mode" "Python Mode." t)
		(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
		(add-to-list 'interpreter-mode-alist '("python" . python-mode))
		(setq py-smart-indentation nil)
		(define-key python-mode-map "C-m" 'newline-and-indent)
        ;; highlight XXX style code tags in source files
        (font-lock-add-keywords 'python-mode
            '(("\\<\\(FIXME\\|HACK\\|XXX\\|TODO\\):?" 1 font-lock-warning-face prepend)))

        ;; some custom keybindings
      (local-set-key (kbd "C-c a") 'py-beginning-of-def-or-class)
      (local-set-key (kbd "M-<right>") 'py-forward-into-nomenclature)
      (local-set-key (kbd "M-<left>") 'py-backward-into-nomenclature)
      (local-set-key (kbd "M-DEL") 'py-backward-kill-nomenclature)

    ;; compile (<f5>) is execute
      (unless (or (file-exists-p "makefile")
                  (file-exists-p "Makefile"))
        (set (make-local-variable 'compile-command)
             (concat "python " buffer-file-name)))
    '(py-XXX-tag-face ((t (:background "yellow" :foreground "#f00"))) t)
    '(py-builtins-face ((t (:inherit font-lock-keyword-face :weight normal))) t)


	)
)

(add-hook 'python-mode-hook 'my-python)

