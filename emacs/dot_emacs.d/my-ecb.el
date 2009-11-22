;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
(add-to-list 'load-path "~/apps/emacs/ecb")
(require 'ecb)                          ;emacs code browser -- slow load, auto start 
;(require 'ecb-autoloads)                 ;emacs code browser -- fast load, select start 
(custom-set-variables 
	;; custom-set-variables was added by Custom. 
	;; If you edit it by hand, you could mess it up, so be careful. 
	;; Your init file should contain only one such instance. 
	;; If there is more than one, they won't work right. 
	'(ecb-highlight-tag-with-point (quote highlight-scroll))
	'(ecb-process-non-semantic-files t)
	'(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(pyc\\|elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
	'(ecb-tree-expand-symbol-before t)
	'(ecb-use-speedbar-instead-native-tree-buffer nil)
	'(ecb-highlight-tag-with-point (quote highlight-scroll))
	'(ecb-tip-of-the-day nil)
	'(ecb-windows-width 0.25)
	'(ediff-split-window-function (quote split-window-horizontally))
	'(file-cache-filter-regexps (quote ("~$" "\\.o$" "\\.exe$" "\\.a$" "\\.elc$" ",v$" "\\.output$" "\\.$" "#$" "\\.class$" "\\.pyc$" "\\.svn/.*$")))
)


;(setq speedbar-show-unknown-files t)
;(setq speedbar-use-images t)

