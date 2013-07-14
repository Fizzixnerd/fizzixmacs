; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;     * Initial creation
;     * Moved everything out of init.el

; * load-path is a path searched by function load-library
; * load-file loads a file from a given filepath
; * load-library loads a library, searching load-path
; * load tries load-library if it doesn't look like a filepath, and uses
;   load-file if it does.
; * load-dirs loads all the directories held in the variable 'load-dirs
;   and all the subdirectories thereof if the variable 'load-dir-recursive
;   is t.

(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet/lisp")
;; Prevents regular CEDET from loading, which would screw everything up
(load-file "~/.emacs.d/site-lisp/cedet/cedet-devel-load.el")

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(add-to-list 'load-path "~/.emacs.d/elpa/popup-0.5/")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.4/")
(add-to-list 'load-path "~/.emacs.d/elpa/ac-slime-0.2/")
(add-to-list 'load-path "~/.emacs.d/elpa/load-dir-0.0.3/")
(add-to-list 'load-path "~/.emacs.d/elpa/pos-tip-0.4.5/")

; Fuck, I don't know what to do with these. I will leave them here, I
; guess.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(ede-project-directories (quote ("/home/matt/src/cl/ncurses" "/home/matt/Documents/src/matt/python/pygame/bouncing_ball" "/home/matt/Documents/sources/matt/java/DotComBust" "/home/matt/Documents/sources/matt/go/echo")))
 '(inhibit-startup-screen t)
 '(preview-auto-cache-preamble t)
 '(preview-gs-options (quote ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-tooltip))
 '(semantic-complete-inline-analyzer-idle-displayor-class (quote semantic-displayor-tooltip))
 '(semantic-java-dependency-system-include-path (quote ("/usr/share/java/")))
 '(semantic-mode t)
 '(semantic-python-dependency-system-include-path (quote ("/usr/lib/python2.7")) t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; These libraries should always be loaded.
(load-library "customizations/ede-customizations.el")
(load-library "customizations/ac-customizations.el")
(load-library "customizations/package-customizations.el")
(load-library "customizations/ido-customizations.el")
(load-library "customizations/ispell-customizations.el")
(load-library "customizations/hs-customizations.el")
(load-library "customizations/navigation-customizations.el")
(load-library "customizations/file-association-customizations.el")
(load-library "customizations/shell-customizations.el")
;; tex and cl are included here because they contain hooks and I don't
;; know how to deal with that at the moment... I should change this to
;; autoloads at some point.
(load-library "customizations/tex-customizations.el")
(load-library "customizations/cl-customizations.el")

;; These libraries should only be loaded in their respective major
;; modes.
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (load-library "customizations/c++-customizations.el")))
(add-hook 'python-mode-hook
	  '(lambda ()
	     (load-library "customizations/python-customizations.el")))

(put 'upcase-region 'disabled nil)
