; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;     * Initial creation
;     * Moved everything out of init.el
;     November 5, 2012
;     * Added smex

;; Regular ido completion
(ido-mode)

;; smart M-x completion, a la ido
(smex-initialize)
(global-set-key "\M-x" 'smex)
