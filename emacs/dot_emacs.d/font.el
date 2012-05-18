(if (system-type-is-darwin)
    (setq default-frame-alist
    (append default-frame-alist
    '((font . "Inconsolata-11")
))))

(if (system-type-is-gnu)
    (setq default-frame-alist
    (append default-frame-alist
    '((font . "Inconsolata-11")
))))

(when (featurep 'aquamacs)
    (set-default-font "-apple-inconsolata-medium-r-normal--13-130-72-72-m-130-iso10646-1")
)
