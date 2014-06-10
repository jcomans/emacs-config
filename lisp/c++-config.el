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

;; Use clang format if we have clang
(if (executable-find "clang")
    (load "~/.emacs.d/lisp/vendor/clang/clang-format.el"))
