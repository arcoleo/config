(defun show-full-path ()
    "Show the full path file name in the minibuffer."
    (interactive)
    (message (buffer-file-name))
    (kill-new (file-truename buffer-file-name))
)

