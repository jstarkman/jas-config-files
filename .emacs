;;;Organisation:
;;;  first, default emacs changes
;;;  then, (require 'foo)
;;;  then, custom functions
;;;  then, keybindings

;; Turn off mouse interface early in startup to avoid momentary display
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;might still be needed
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq
	  inhibit-startup-message            t	 ;no splash screen
	  auto-save-default                  nil ;no auto-save-mode, eithe
	  read-buffer-completion-ignore-case t   ;case-insensitive buffer names
	  show-paren-delay                   0   ;now!
	  show-paren-priority                999 ;so `visible-mark' can override it
	  c-default-style    "java"
	  c-basic-offset     4
	  cperl-indent-level 4
)

(show-paren-mode t)              ;show parens
(global-linum-mode t)            ;and lines
(setq-default c-basic-offset 4)  ;and line indents
(setq-default tab-width 4)       ;force it
(column-number-mode t)           ;and columns
(set-face-background 'region nil);no highlighting
;(global-whitespace-mode 1)       ;makes foreign code easier

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;added by custom.  Do not mess with this.
(custom-set-variables
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(fill-column 80)
 '(python-indent-offset 4))
(custom-set-faces)

;;Python wanted this
(setq-default tab-width 4)

(add-hook 'python-mode-hook
		  (lambda ()
			(setq indent-tabs-mode t)
			(setq tab-width 4)
			(setq python-indent 4)))

;;Octave
(add-hook 'octave-mode-hook
		  (lambda ()
			(abbrev-mode 1)
			(auto-fill-mode 1)))


;Now for plugins and requires
(setq me "~/jas-config-files/disembodied_emacs_config/")
(add-to-list 'load-path me)
(add-to-list 'load-path (concat me "lua-mode.el"))

;more modes
(autoload 'multi-mode      "multi-mode"         "Allows multiple major modes at once" t)
(autoload 'arduino-mode    "arduino-mode"       "Major mode for C++-for-Arduino" t)
(autoload 'octave-mode     "octave-mod"         "Major mode for Octave" t)
(autoload 'markdown-mode   "markdown-mode.el"   "Major mode for Markdown" t)
(autoload 'smart-tabs-mode "smart-tabs-mode.el" "Tabs to indent, spaces to align" t)
(autoload 'lua-mode        "lua-mode.el"        "Lua editing mode." t)
(autoload 'markdown-preview-mode "markdown-preview-mode.el" "Preview markdown!" t)
(autoload 'groovy-mode     "groovy-mode.el"     "Groovy editing mode." t)
(autoload 'rust-mode       "rust-mode"          "Major mode for Rust" t)

(add-to-list 'auto-mode-alist '("\\.m$"   . octave-mode  ))
(add-to-list 'auto-mode-alist '("\\.md$"  . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode     ))
(add-to-list 'auto-mode-alist '("\\.rs$"  . rust-mode    ))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;javascript
(defalias 'espresso-mode 'js-mode) ;javascript-mode also points to js-mode

;; Make rectangular selections easier to see
(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark) ;rebound later with Hyper
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
    (autoload 'rm-set-mark "rect-mark"
      "Set mark for rectangle." t)
    (autoload 'rm-exchange-point-and-mark "rect-mark"
      "Exchange point and mark for rectangle." t)
    (autoload 'rm-kill-region "rect-mark"
      "Kill a rectangular region and save it in the kill ring." t)
    (autoload 'rm-kill-ring-save "rect-mark"
      "Copy a rectangular region to the kill ring." t)

;custom functions

; http://stackoverflow.com/a/25212377
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))


;keybindings
(setq w32-pass-apps-to-system     nil
      w32-apps-modifier          'hyper ;H-X Menu key
      w32-pass-lwindow-to-system  nil
      w32-lwindow-modifier       'super ;s-X
      w32-pass-rwindow-to-system  nil
      w32-rwindow-modifier       'alt) ;A-X On Caps lock (hold it)
;type brackets in pairs
(global-set-key (kbd "H-j")
				(lambda () (interactive) (insert "{}") (backward-char 1)))
(global-set-key (kbd "H-k")
				(lambda () (interactive) (insert "()") (backward-char 1)))
(global-set-key (kbd "H-l")
				(lambda () (interactive) (insert "[]") (backward-char 1)))
(global-set-key (kbd "H-e") ;for \LaTeX
				(lambda () (interactive) (insert "$$") (backward-char 1)))
;rectangle select
(global-set-key (kbd "H-@")     'rm-set-mark)
(global-set-key (kbd "H-2")     'rm-set-mark)
(global-set-key (kbd "H-x")     'rm-exchange-point-and-mark)
(global-set-key (kbd "H-w")     'rm-kill-region)
(global-set-key (kbd "H-S-w")   'rm-kill-ring-save)
(global-set-key (kbd "H-d")     'delete-rectangle)
(global-set-key (kbd "H-y")     'yank-rectangle)
(global-set-key (kbd "<H-tab>") 'open-rectangle)
(global-set-key (kbd "H-c")     'clear-rectangle)
(global-set-key (kbd "H-S-s")   'string-rectangle)        ;replace contents of lines
(global-set-key (kbd "H-s")     'string-insert-rectangle) ;insert on lines
;see whitespace
(global-set-key (kbd "<H-SPC>") 'whitespace-mode)
;; Move more quickly
(global-set-key (kbd "H-i")     'imenu)
(global-set-key (kbd "C-<")     'beginning-of-buffer)
(global-set-key (kbd "C->")     'end-of-buffer)
(global-set-key (kbd "C-S-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (previous-line 5)))
(global-set-key (kbd "C-S-f") (lambda () (interactive) (forward-char 5)))
(global-set-key (kbd "C-S-b") (lambda () (interactive) (backward-char 5)))
;visual REs
(define-key global-map (kbd "H-r") 'vr/replace)
(define-key global-map (kbd "H-q") 'vr/query-replace)
(define-key global-map (kbd "H-m") 'vr/mc-mark) ;if multi-cursors
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

;;Useful and overlooked keybindings
; M-/ expands abbreviation (search backwards for match)

; M-[clu] for Caps, lower, and UPPER cases
; M-m to start of line, after indents
; M-z deletes from point to inputted symbol
; M-SPC to kill all whitespace but one space
; M-g g is same as M-x goto-line
; C-t transpose characters
; M-t transpose words
; C-M-t transpose sexp
; C-x C-t transpose lines
; C-x n [nw] for narrowing (hide rest of buffer)
; C-x v for version control
; C-x C-o like M-SPC but leaves a line
; M-x align
; M-x dired Windows Explorer for Emacs
; M-x occur
; F3 and F4 for C-x (), to record/stop/play kbd macros

;;Useless M-x
; yow and psychoanalyze-pinhead
; emacs-uptime
; viper-mode and evil (the Extensible VI Layer for emacs)
; dunnet, tetris, et alli
; butterfly
