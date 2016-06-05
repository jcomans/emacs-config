;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Yasnippet Config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable yasnippet
(add-to-list 'load-path
              "~/.emacs.d/lisp/vendor/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq require-final-newline nil)

;; Use IDO for prompting
(setq yas/prompt-functions '(yas/ido-prompt))
