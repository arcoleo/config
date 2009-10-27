; how to determine platform / emacs version?

(tool-bar-mode -1)
(setq max-lisp-eval-depth 4192)
(setq max-specpdl-size 32000) 

(add-to-list 'load-path "~/apps/emacs/yasnippet")

(load "~/.emacs.d/version.el")
(load "~/.emacs.d/os.el")
(load "~/.emacs.d/backups.el")
(load "~/.emacs.d/font.el")
(load "~/.emacs.d/frame_title_bar_path.el")
(load "~/.emacs.d/yes-no.el")
(load "~/.emacs.d/key-bindings.el")
(load "~/.emacs.d/tabs4.el")
(load "~/.emacs.d/init-python.el")
(load "~/.emacs.d/searching.el")
(load "~/.emacs.d/recreate-killed-buffers.el")
(load "~/.emacs.d/window.el")
(load "~/.emacs.d/perl.el")
(load "~/.emacs.d/wombat.el")
(require 'ido)
(ido-mode t)

;(load "~/.emacs.d/my-autocomplete.el")

(load-file "~/apps/emacs/cedet/common/cedet.el")
(global-ede-mode 1)
(semantic-load-enable-code-helpers)

(load "~/.emacs.d/my-ecb.el")

;; Auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'yasnippet)
(yas/initialize)
;(yas/load-directory “~/apps/emacs/yasnippet/snippets”)

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))



;; get a buffer menu with the right mouse button.
(global-set-key (kbd "<mouse-3>") 'mouse-buffer-menu)

;; make commenting easy ;)
(global-set-key (kbd "M-#") 'comment-region)
(global-set-key (kbd "C-#") 'comment-region)


; Use womat theme
;(require 'color-theme-wombat)
;(color-theme-wombat)


(require 'tramp)
(setq tramp-default-method "rsync")


; auto update files
;(global-auto-revert-tail-mode 1)

; high light current line
(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)
;; To customize the background color
(set-face-background 'hl-line "#330")  ;; Emacs 22 Only
;(set-face-background 'highlight "#330")  ;; Emacs 21 Only


;'global-whitespace-mode
;(autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t)
;(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)

; error - this does doesn't work
;(add-hook 'python-mode-hook 'turn-on-show-whitespace-mode)


;(autoload 'whitespace-mode t)
(global-set-key [backspace] 'delete-backward-char)

(setq py-smart-indentation nil)
                (setq py-indent-offset 4)
                (setq py-continuation-offset 0)

