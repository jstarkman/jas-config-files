(global-linum-mode 1)
(column-number-mode 1)

(show-paren-mode 1)

(setq
 c-default-style    "java"
 c-basic-offset     4
 cperl-indent-level 4
 show-paren-delay   0
 )

(setq-default tab-width 4)

(load-theme 'tsdh-dark t)

(global-whitespace-mode 1)

(add-to-list 'load-path "/home/jas497/LabHome/disembodied_emacs_config/")

(autoload 'markdown-mode   "markdown-mode.el"   "Major mode for Markdown" t)
(autoload 'smart-tabs-mode "smart-tabs-mode.el" "Tabs to indent, spaces to align" t)
(autoload 'markdown-preview-mode "markdown-preview-mode.el" "Preview markdown!" t)

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

c-default-style
