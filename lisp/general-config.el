;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Appearance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable the anoying splash screen
(setq inhibit-splash-screen t)

;; Set a black background
(add-to-list 'default-frame-alist '(background-color . "black"))
(add-to-list 'default-frame-alist '(foreground-color . "wheat"))

;; Monospace 8 seems to be nice for linux machines
(set-default-font "Monospace-8")

;; Disable the tool bar
(tool-bar-mode -1)
;; Disable the menu bar
(menu-bar-mode -1)

;; Don't highlight the marked region
(transient-mark-mode -1)

;; Show line and column number in status bar
(setq line-number-mode t)
(setq column-number-mode t)
;; Show the time and date in status bar
(setq display-time-day-and-date t)
(setq display-time-24hr-format  t)
(display-time)

;; Always show line numbers
;(global-linum-mode t)

(define-global-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (when (not (memq major-mode
		     (list 'doc-view-mode)))
      (linum-mode))))

(my-global-linum-mode t)

;; Show matching parentheses
(show-paren-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Behavior
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Disable backup files
(setq make-backup-files -1)
;; If we enable backups, put them in a separate dir without
;; version numbers
(setq version-control-nil)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Always keep buffers in sync with files on disk
(global-auto-revert-mode 1)

;; Make sure dired doesn't open a new buffer each time
(put 'dired-find-alternate-file 'disabled nil)

;; Enable IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Enable 'advanced' commands
(put 'upcase-region 'disabled nil)

;; Enable fullscreen switching and bind to F11
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
			  (if (equal 'fullboth current-value)
			      (if (boundp 'old-fullscreen) old-fullscreen nil)
			    (progn (setq old-fullscreen current-value)
				   'fullboth)))))

(global-set-key [f11] 'toggle-fullscreen)

;; Prevent long delays on shutdown with clipboard manager
(setq x-select-enable-clipboard-manager nil)

;; Use C-x k to end a client session
(add-hook 'server-switch-hook
	  (lambda ()
	    (when (current-local-map)
	      (use-local-map (copy-keymap (current-local-map))))
	    (when server-buffer-clients
	      (local-set-key (kbd "C-x k") 'server-edit))))

;; When opening 2 files, show them side-by-side
(defun 2-windows-vertical-to-horizontal ()
  (let ((buffers (mapcar 'window-buffer (window-list))))
    (when (= 2 (length buffers))
      (delete-other-windows)
      (set-window-buffer (split-window-horizontally) (cadr buffers)))))

(add-hook 'emacs-startup-hook '2-windows-vertical-to-horizontal)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; External programs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set Chromium as the browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;; Use aspell for spell checking
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Additional functionality
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lisp/vendor/load-dir")
(require 'elisp-load-dir)
