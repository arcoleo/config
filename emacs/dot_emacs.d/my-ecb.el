;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
(add-to-list 'load-path "~/apps/emacs/ecb")
(require 'ecb)
'(ecb-highlight-tag-with-point (quote highlight-scroll))
'(ecb-process-non-semantic-files t)
'(ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(pyc\\|elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))))
'(ecb-tree-expand-symbol-before t)
'(ecb-use-speedbar-instead-native-tree-buffer nil)
'(ecb-highlight-tag-with-point (quote highlight-scroll))
'(ecb-tip-of-the-day nil)
'(ecb-windows-width 0.25)
'(ediff-split-window-function (quote split-window-horizontally))


'(speedbar-show-unknown-files t)
'(speedbar-use-images t)

'(file-cache-filter-regexps (quote ("~$" "\\.o$" "\\.exe$" "\\.a$" "\\.elc$" ",v$" "\\.output$" "\\.$" "#$" "\\.class$" "\\.pyc$" "\\.svn/.*$")))

