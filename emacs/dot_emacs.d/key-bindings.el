;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key Bindings / Key Map
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key [C-M-tab] 'other-window)

;; go to specific line in current buffer
; FIXME
(global-unset-key "\M-g")
(global-set-key "\M-g" 'goto-line)

;; Eat space at point up to non-space
(global-set-key "\C-ce" 'fixup-whitespace)

;; Remap Home and End keys to move within current line, and C-Home and
;; C-End keys to beginning and end of buffer
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [C-home] 'beginning-of-buffer)
(global-set-key [C-end] 'end-of-buffer)

;; Make DEL delete the current character not the last character
;; (behave like delete not like backspace)
(global-set-key [delete] 'delete-char)
(global-set-key [backspace] 'delete-backward-char)

;; Rebind C-z to start a shell (use .emacs_shellname for the shells rc file)
(global-set-key "\C-z" 'shell)

;; Maps F1 to give the manual entry for the current word
(global-set-key [f1] (lambda () (interactive) (manual-entry (current-word))))


(defun my-compile-clean-func ()
  "This function does a clean compile."
  (interactive)
  (compile (format "make clean")))

;; Programming
(global-set-key [f5] 'eval-current-buffer)
(global-set-key [C-f11] 'compile)
(global-set-key [f11] 'recompile)
(global-set-key [S-f11] 'my-compile-clean-func)
(global-set-key [S-f7] 'next-error)
