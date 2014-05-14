; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     September 2, 2012
;     * Initial creation
;     * added slime-setup and set default lisp program to sbcl

;; This line says not to invoke linedit when running sbcl from emacs.
(setq inferior-lisp-program "/usr/bin/sbcl --noinform --no-linedit")
(setq slime-lisp-implementations
      '((sbcl ("sbcl" "--core" "/home/matt/.emacs.d/sbcl.core-for-slime"))))
(add-to-list 'load-path "~/src/")

;; from `info slime', section 7.3 (tips and tricks): Connects to lisp
;; whenever you open a lisp file.
(add-hook 'slime-mode-hook
	  (lambda ()
	    (unless (slime-connected-p)
	      (save-excursion (slime)))))

;; Run this function the first time you want to use slime.
(slime-setup '(slime-fancy))

;; Add a fun mode that makes `lambda' appear as the literal greek character.
(add-to-list 'lisp-mode-hook '(lambda () (pretty-lambda-mode 1)))
