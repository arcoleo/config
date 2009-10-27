;(setq default-frame-alist
;	(append default-frame-alist
;	'((font . "Inconsolata-10")
;)))

;(set-default-font "Bitstream Vera Sans Mono-9")
;(set-default-font "Monaco-9")
;(set-default-font "Monospace-10")
;(set-default-font "Inconsolata-10")

(if (system-type-is-darwin)
	(setq default-frame-alist
	(append default-frame-alist
	'((font . "Inconsolata-13")
))))

(if (system-type-is-gnu)
	(setq default-frame-alist
	(append default-frame-alist
	'((font . "Inconsolata-12")
))))

(when (featurep 'aquamacs)
	(set-default-font "-apple-inconsolata-medium-r-normal--13-130-72-72-m-130-iso10646-1")
)
