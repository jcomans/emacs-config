;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make sure we load our own version of org
(add-to-list 'load-path "~/.emacs.d/lisp/vendor/org")
;; The default org directory
(setq org-directory "~/Dropbox/org-mode/desktop")

;; Mobile org setup
(setq org-mobile-inbox-for-pull
      "~/Dropbox/org-mode/desktop/refile-mobile.org")
(setq org-mobile-directory
      "~/Dropbox/org-mode/mobile")

;; Agenda setup
(setq org-agenda-files
      (quote ("~/Dropbox/org-mode/desktop/refile.org")))

;; Global key binding
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)

;; Capture setup
(setq org-default-notes-file
      "~/Dropbox/org-mode/desktop/refile.org")

;; General config
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
