;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++ Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keep basic offset small
(setq c-basic-offset 2)
;; Setup the styles used by c-mode, use Allman for C/C++
(setq c-default-style '((java-mode   . "java"  )
			(awk-mode    . "awk"   )
			(python-mode . "python")
			(other       . "bsd"   ) ))

;; Also load python-mode for python2 and python3
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))
(add-to-list 'interpreter-mode-alist '("python3" . python-mode))

;; Use auto-newline and subword-mode
(defun my-c-mode-common-hook ()
  ;(c-toggle-auto-newline 1)
  (subword-mode 1) )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Use clang format if we have clang
(if (executable-find "clang")
    (load "~/.emacs.d/lisp/vendor/clang/clang-format.el"))

(global-set-key [XF86Launch5] 'clang-format-region)
(global-set-key [XF86Launch9] 'clang-format-buffer)


(defun my-c-setup ()
  (c-set-offset 'innamespace [0]))

(add-hook 'c++-mode-hook 'my-c-setup)

(setq load-path
       (cons (expand-file-name "~/.emacs.d/lisp/vendor/irony") load-path))

(require 'irony)
(require 'irony-cdb)
(require 'irony-completion)
(require 'irony-diagnostics)
(require 'irony-snippet)

;(load "~/.emacs.d/lisp/vendor/irony/irony-cdb-clang-complete.el")
;(load "~/.emacs.d/lisp/vendor/irony/irony-cdb.el")
;(load "~/.emacs.d/lisp/vendor/irony/irony-cdb-json.el")
;(load "~/.emacs.d/lisp/vendor/irony/irony-cdb-libclang.el")
;; (load "~/.emacs.d/lisp/vendor/irony/irony-completion.el")
;; (load "~/.emacs.d/lisp/vendor/irony/irony-diagnostics.el")
;; (load "~/.emacs.d/lisp/vendor/irony/irony-snippet.el")


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
