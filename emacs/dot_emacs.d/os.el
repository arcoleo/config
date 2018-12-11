;; Get current system's name
(defun insert-system-name()
	(interactive)
	"Get current system's name"
	(insert (format "%s" system-name))
)

;; Get current system type
(defun insert-system-type()
	(interactive)
	"Get current system type"
	(insert (format "%s" system-type))
)

;; Check if system is Darwin/Mac OS X
(defun system-type-is-darwin ()
	(interactive)
	"Return true if system is darwin-based (Mac OS X)"
	(string-equal system-type "darwin")
)

;; Check if system is GNU/Linux
(defun system-type-is-gnu ()
	(interactive)
	"Return true if system is GNU/Linux-based"
	(string-equal system-type "gnu/linux")
)

;; disable closing emacs in Mac OS X
(if (system-type-is-darwin)
	(global-unset-key "\C-z")
)
