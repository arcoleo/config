(when (load "flymake" t)
         (defun flymake-pyflakes-init ()
           (let* ((temp-file (flymake-init-create-temp-buffer-copy
                              'flymake-create-temp-inplace))
              (local-file (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
             (list "pyflakes" (list local-file))))
 
         (add-to-list 'flymake-allowed-file-name-masks
                  '("\\.py\\'" flymake-pyflakes-init)))
 
   (add-hook 'find-file-hook 'flymake-find-file-hook)

; Add flymake errors to mini-buffer
; Flymake marks the errors with red. But it does not prints the error on screen. So I found a script that writes the errors on the current line to mini-buffer. Here is the script that I added to my .emacs file

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
   (let ((help (get-char-property (point) 'help-echo)))
    (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)
