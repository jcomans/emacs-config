;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CEDET Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable some submodes for semantic
(setq semantic-default-submodes
      '(global-semantic-idle-scheduler-mode
	global-semanticdb-minor-mode
	;global-semantic-idle-summary-mode
	;global-semantic-idle-completions-mode
	global-semantic-highlight-func-mode
	global-semantic-decoration-mode
	global-semantic-stickyfunc-mode ))

;; Enable Semantic code analyzer
(semantic-mode t)

;; Enable EDE
(global-ede-mode t)

;; Check if there are project definitions
(if (file-directory-p "~/.emacs.d/ede-projects")
    (elisp-load-dir "~/.emacs.d/ede-projects"))
    

;; Example project definition
;; (ede-cpp-root-project "NAME" :file "FILENAME"
;;		      :include-path '( "/include" "../include" "/c/include" )
;;		      :system-include-path '( "/usr/include/c++/3.2.2/" )
;;		      :spp-table '( ("MOOSE" . "")
;;				    ("CONST" . "const") ) )
