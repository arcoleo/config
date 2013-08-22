(print "Loading emacs.el")
; how to determine platform / emacs version?
(setq inhibit-splash-screen t)
; (setq tool-bar-mode -1)


(load "version.el")
(load "os.el")
(load "backups.el")
(load "font.el")
(load "frame_title_bar_path.el")
(load "yes-no.el")
(load "key-bindings.el")
(load "tabs4.el")

(if (not (featurep 'aquamacs))
    (progn
        (load "tabbar.el")
        (tabbar-mode)
    )
)


(add-hook 'python-mode-hook "init-python.el" "Python mode" t)

; (load "~/.emacs.d/init-cc.el")
(load "~/.emacs.d/searching.el")
; (load "~/.emacs.d/recreate-killed-buffers.el")
; (load "~/.emacs.d/window.el")

(require 'ido)
(ido-mode t)
(setq linum-format "%d  ")
;(load "~/my-autocomplete.el")

;; Auto-complete
;(require 'auto-complete)
;(require 'auto-complete-config)
;(global-auto-complete-mode t)
;(load "~/.emacs.d/my-autocomplete")

;; get a buffer menu with the right mouse button.
;(global-set-key (kbd "<mouse-3>") 'mouse-buffer-menu)

;; make commenting easy ;)
;(global-set-key (kbd "M-#") 'comment-region)
;(global-set-key (kbd "C-#") 'comment-region)

(require 'tramp)
(setq tramp-default-method "scp")

; auto update files
;(global-auto-revert-tail-mode 1)

; high light current line
(global-hl-line-mode 1)
(column-number-mode 1)
;; To customize the background color
;(set-face-background 'hl-line "#232")  ;; Emacs 22 Only
;(set-face-background 'highlight "#330")  ;; Emacs 21 Only

; aquamacs



;'global-whitespace-mode
;(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
;(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)

; error - this does doesn't work
;(add-hook 'python-mode-hook 'turn-on-show-whitespace-mode)


;(autoload 'whitespace-mode t)
;(global-set-key [backspace] 'delete-backward-char)
