;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable auto-complete
(add-to-list 'load-path "~/.emacs.d/lisp/vendor/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lisp/vendor/clang")

(require 'auto-complete-config)
(require 'auto-complete-clang)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/vendor/auto-completion/dict")

(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
(define-key ac-mode-map  [(backtab)] 'auto-complete)

(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
/usr/include/c++/4.9.0
/usr/include/c++/4.9.0/x86_64-unknown-linux-gnu
/usr/include/c++/4.9.0/backward
/usr/local/include
/usr/lib/clang/3.4.1/include
/usr/include
")))


(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev
                             ac-source-dictionary
                             ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook    'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook      'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook          'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook           'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(defun my-ac-clang-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(if (executable-find "clang")
    (add-hook 'c-mode-common-hook 'my-ac-clang-mode-setup))

(my-ac-config)

