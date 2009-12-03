;; In emacs you can split each frame in several windows. Such a 
;; configuration is called window configuration. The window
;; configurations of all frames make a frame configuration. Here are
;; some functions which let you save and restore such a frame
;; configuration with only one key.

;; First we define a register which will be used by default for saving
;; the frame configuration:

(defparameter th-frame-config-register ?
  "The register which is used for storing and restoring frame
configurations by `th-save-frame-configuration' and
`th-jump-to-register'.")

;; The next thing is the saving function. If you call it with a prefix
;; arg you can choose a different register:

(defun th-save-frame-configuration (arg)
  "Stores the current frame configuration in register
`th-frame-config-register'. If a prefix argument is given, you
can choose which register to use."
  (interactive "P")
  (let ((register (if arg
                      (read-char "Which register? ")
                    th-frame-config-register)))
    (frame-configuration-to-register register)
    (message "Frame configuration saved in register '%c'."
             register)))

;; Now we need a function to restore a frame configuration. By default
;; it uses th-frame-config-register, but with a prefix arg you can
;; choose any register. (You can use this function not only for
;; restoring frame configs, but for everything you can do with
;; jump-to-register…)

(defun th-jump-to-register (arg)
  "Jumps to register `th-frame-config-register'. If a prefix
argument is given, you can choose which register to jump to."
  (interactive "P")
  (let ((register (if arg
                      (read-char "Which register? ")
                    th-frame-config-register)))
    (jump-to-register register)
    (message "Jumped to register '%c'."
             register)))

;; Ok, the last thing we gotta do is create some key bindings. 
;; I chose F7 and F8:

(global-set-key (kbd "<F7>")
                'th-save-frame-configuration)
(global-set-key (kbd "<F8>")
                'th-jump-to-register)

;; Now whenever you have a complex window/frame config press F7 to save
;; it and press F8 to restore it.
