; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;     * Initial creation
;     * Moved everything out of init.el
;     September 11, 2012
;     * This shit is fucking broken now.  Fuck you Emacs24

; Not sure if this will break things
(require 'package)
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
			 ("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
