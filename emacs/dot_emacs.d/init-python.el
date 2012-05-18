

;(autoload 'python-mode "python-mode" "Python Mode." t)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;(require 'python-mode)
;(print "Loading init-python.el")
;(require 'python)

;'(py-pychecker-command "~/.emacs.d/pychecker.sh")
;'(py-pychecker-command-args (quote ("")))
;'(python-check-command "~/.emacs.d/pychecker.sh")

;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-hook 'python-mode-hook
;    (lambda ()
;    (set-variable 'py-indent-offset 4)
;    (set-variable 'indent-tabs-mode nil)
;    (setq py-smart-indentation nil)
;    (setq py-indent-offset 4)
;    (setq py-continuation-offset 0)
;    (define-key python-mode-map (kbd "RET") 'newline-and-indent)
    ; (smart-operator-mode-on)
;))
; (print "Debug")    
;; pymacs
;(setenv "PYMACS_PYTHON" "python2.6") 
;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;(eval-after-load "pymacs"
;    '(add-to-list 'load-path "~/apps/emacs/rope/ropemacs")
;)
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;(pymacs-load "ropemacs" "rope-")
;(setq ropemacs-enable-autoimport t)

;(require 'ecb)
;(print "End init-python")


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
