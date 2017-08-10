; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;       * Initial creation
;       * Moved everything out of init.el
;     March 7, 2012
;       * Moved some the autoloads around; changed them to requires
;       * Still not really sure what most of this stuff does
;    Sept 7, 2013
;      * Added more support for ipython inferior shells.


; This file contains everything related to python editing, including
; all pymacs stuff. Might want to break that up at some point. I have
; no idea what the real differences between python-mode and the other
; one are. In fact, most of this stuff is Greek to me.

;(require 'python-mode)
(require 'elpy)
(require 'yasnippet)
(require 'flycheck)
(require 'python-mode)
(require 'python-docstring)
(require 'company)
(require 'jedi)

;(autoload 'python-mode "python-mode" "Python Mode." t)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;; Code:
(elpy-enable)
(elpy-use-ipython)
(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook
	  (lambda ()
	    (jedi-mode t)
	    (jedi:setup)
	    (company-mode-on)
	    (company-quickhelp-mode 1)
	    (flycheck-mode t)))


;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
	    ;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;;
