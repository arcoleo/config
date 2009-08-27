(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq column-number-mode t)

; (setq x-stretch-cursor 1)
(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
