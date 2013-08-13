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
      (quote ("~/Dropbox/org-mode/desktop/")))

;; Global key binding
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "<f5>")   'org-mobile-push)
(global-set-key (kbd "C-<f5>") 'org-save-all-org-buffers)
(global-set-key (kbd "<f9>")   'org-mobile-pull)

;; Capture setup
(setq org-default-notes-file
      "~/Dropbox/org-mode/desktop/refile.org")

(setq org-capture-templates
      (quote (("t" "todo" entry (file+headline "refile.org" "Tasks")
               "* TODO %?\n%U\n")
	      ("h" "Habit" entry (file+headline "refile.org" "Habits")
               "* NEXT %?\n%U\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;; TODO setup
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|"
			"CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-treat-S-cursor-todo-selection-as-state-change nil)
(setq org-use-fast-todo-selection t)

(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)

;; Refile setup
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes (quote confirm))

(setq org-completion-use-ido t)

(defun verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'verify-refile-target)

;; Agenda setup
(setq org-agenda-custom-commands
      (quote (("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
	      ("r" "Tasks to Refile" tags "REFILE"
               ((org-agenda-overriding-header "Tasks to Refile")
                (org-tags-match-list-sublevels t)))
	      )))
