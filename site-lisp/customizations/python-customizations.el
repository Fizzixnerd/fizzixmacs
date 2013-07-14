; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;     * Initial creation
;     * Moved everything out of init.el
;     March 7, 2012
;     * Moved some the autoloads around; changed them to requires
;     * Still not really sure what most of this stuff does


; This file contains everything related to python editing, including
; all pymacs stuff. Might want to break that up at some point. I have
; no idea what the real differences between python-mode and the other
; one are. In fact, most of this stuff is Greek to me.

(require 'pymacs)
(require 'python-mode)
(require 'yasnippet)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(setq py-python-command "python")
(setenv "PYMACS_PYTHON" "python")

(setq semantic-python-dependency-system-include-path
      '("/usr/lib/python2.7/"))
