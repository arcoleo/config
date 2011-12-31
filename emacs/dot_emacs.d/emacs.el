(print "Loading emacs.el")
; how to determine platform / emacs version?
(setq inhibit-splash-screen t)
; (setq tool-bar-mode -1)


(load "version.el")
(load "os.el")
(load "backups.el")
; (load "~/.emacs.d/font.el")
(load "frame_title_bar_path.el")
(load "yes-no.el")
(load "key-bindings.el")
(load "tabs4.el")
(load "~/.emacs.d/init-python.el")
(autoload 'python-mode "init-python.el" "Python mode" t)
; (load "~/.emacs.d/init-cc.el")
(load "~/.emacs.d/searching.el")
; (load "~/.emacs.d/recreate-killed-buffers.el")
; (load "~/.emacs.d/window.el")
;(load "~/.emacs.d/perl.el")
; (load "wombat.el")
;(add-to-list 'load-path "~/apps/emacs/yasnippet")
; (add-to-list 'load-path "~/apps/emacs/ecb")
(require 'ido)
(ido-mode t)
(setq linum-format "%d  ")
;(load "~/my-autocomplete.el")








;(load-file "~/apps/emacs_dir/cedet/common/cedet.elc")
;(require 'cedet)
;(semantic-mode 1)
;(global-ede-mode 1)
;(semantic-load-enable-code-helpers)
; (semantic-load-enable-gaudy-code-helpers)
;(sematic-load-enabled-all-exuberent-ctags-support)

;(load "~/.emacs.d/my-ecb.el")
;(require 'sr-speedbar)
;(pymacs-load "ropemacs" "rope-")

;; Auto-complete
;(require 'auto-complete)
;(require 'auto-complete-config)
;(global-auto-complete-mode t)
;(load "~/.emacs.d/my-autocomplete")

;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory “~/apps/emacs/yasnippet/snippets”)

;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))



;; get a buffer menu with the right mouse button.
;(global-set-key (kbd "<mouse-3>") 'mouse-buffer-menu)

;; make commenting easy ;)
;(global-set-key (kbd "M-#") 'comment-region)
;(global-set-key (kbd "C-#") 'comment-region)


; Use womat theme
;(require 'color-theme-wombat)
;(color-theme-wombat)


(require 'tramp)
(setq tramp-default-method "scp")


; auto update files
;(global-auto-revert-tail-mode 1)

; high light current line
(global-hl-line-mode 1)
; (line-number-mode 1)
(column-number-mode 1)
;; To customize the background color
(set-face-background 'hl-line "#232")  ;; Emacs 22 Only
;(set-face-background 'highlight "#330")  ;; Emacs 21 Only
;(set-background-color "black")
;(set-face-background 'default "black")
;(set-face-background 'region "black")
;(set-face-foreground 'default "white")
;(set-face-foreground 'region "gray60")
;(set-foreground-color "white")
;(set-cursor-color "red")
; (set-foreground-color "white")

; aquamacs



;'global-whitespace-mode
;(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
;(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)

; error - this does doesn't work
;(add-hook 'python-mode-hook 'turn-on-show-whitespace-mode)


;(autoload 'whitespace-mode t)
;(global-set-key [backspace] 'delete-backward-char)

;(setq py-smart-indentation nil)
;                (setq py-indent-offset 4)
;                (setq py-continuation-offset 0)

