;; Older versions of emacs did not have these variables
;; (emacs-major-version and emacs-minor-version.)  Let's define them
;; if they're not around, since they make it much easier to
;; conditionalize on the emacs version.

(if (and (not (boundp 'emacs-major-version))
         (string-match "^[0-9]+" emacs-version))
    (setq emacs-major-version
          (string-to-int (substring emacs-version
                                    (match-beginning 0) (match-end 0)))))
(if (and (not (boundp 'emacs-minor-version))
         (string-match "^[0-9]+\\.\\([0-9]+\\)" emacs-version))
    (setq emacs-minor-version
          (string-to-int (substring emacs-version
                                    (match-beginning 1) (match-end 1)))))

;; Define a function to make it easier to check which version we're
;; running.

(defun running-emacs-version-or-newer (major minor)
  (or (> emacs-major-version major)
      (and (= emacs-major-version major)
         (>= emacs-minor-version minor))))

;; This variable didn't exist in pre 21.1 versions, but its nice to
;; have to set the title bar text.

(if (not (boundp 'emacs-program-version))
    (setq emacs-program-version
     (concat (int-to-string emacs-major-version)"."
              (int-to-string emacs-minor-version))))
