; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;     * Initial creation
;     * Moved everything out of init.el
;     April 21, 2012
;     * Added semantic sources
;     * Added ropemacs sources
;     * Took advantage of hooks
;     September 2, 2012
;     * Added some Common Lisp support
;     September 10, 2012
;     * Found the cause of the "can't compile nil" startup error.  See
;       the comment above (require 'slime) for details.
;     September 16, 2012
;     * Updated requries to reflect new version of CEDET (1.1)
;     May 30, 2013
;     * Updated requires so that it works with the new version of CEDET 1.1...
;       sigh...

(require 'auto-complete)
(require 'auto-complete-config)
(require 'cedet)
(require 'semantic/ia)
(require 'pos-tip)
(require 'yasnippet)

;; This line causes the compile error (can't compile nil).  It seems
;; that at the end of slime.el, there is a problem.  See the
;; (let ... (#'byte-compile '(slime-...
;; form in that file for details.
;(require 'slime)
;; Workaround for the compile error.  See above.
;(require 'ac-slime)
(require 'ac-geiser)

;(ac-config-default)

(defun my-ac-java-mode-hook ()
  (setq ac-sources (append '(ac-source-semantic)
			   ac-sources)))

(defun my-ac-common-lisp-mode-hook ()
  (setf ac-sources (append '(ac-source-slime-simple)
			   ac-sources)))

(defun my-ac-racket-mode-hook ()
  (setf ac-sources (append '(ac-source-geiser)
			    ac-sources)))

;(add-hook 'c-mode-common-hook 'my-ac-cc-mode-hook)
(add-hook 'python-mode-hook 'my-ac-python-mode-hook)
(add-hook 'java-mode-hook 'my-ac-java-mode-hook)
; This block must be eval'd in this order
;(progn 
;(add-hook 'slime-mode-hook 'my-ac-common-lisp-mode-hook)
;(add-hook 'slime-repl-mode-hook 'my-ac-common-lisp-mode-hook)
;(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'racket-mode-hook 'my-ac-racket-mode-hook)
;(eval-after-load 'auto-complete
;  '(add-to-list 'ac-modes 'slime-repl-mode))

(setq ac-auto-show-menu 1.5)
(setq ac-quick-help-delay 1.5)
