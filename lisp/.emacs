;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main Emacs configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Load the different configration files

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/lisp/general-config"   nil t)

;(load "~/.emacs.d/lisp/cedet-config"     nil t)
(load "~/.emacs.d/lisp/c++-config"       nil t)
(load "~/.emacs.d/lisp/cmake-config"     nil t)
(load "~/.emacs.d/lisp/latex-config"     nil t)
(load "~/.emacs.d/lisp/yasnippet-config" nil t)
(load "~/.emacs.d/lisp/org-mode-config"  nil t)
(load "~/.emacs.d/lisp/lua-mode-config"  nil t)
