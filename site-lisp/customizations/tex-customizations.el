; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;     * Initial creation
;     * Moved everything out of init.el

(require 'flymake)

; This seems to be related to flymake.  Not really sure what it does,
; or what it's for
(defun flymake-get-tex-args (file-name)
  (list "pdflatex"
	(list "-file-line-error" "-draftmode" "-interaction=nonstopmode"
	file-name)))

;This adds automatically loads flymake-mode with LaTeX mode. This
;seems to fail often, so I'm not sure I want to keep it.
(add-hook 'LaTeX-mode-hook 'flymake-mode)

; I believe this allows for automatic TeX code folding, which is
; handy.  I do not know what outline mode does.
(add-hook 'LaTeX-mode-hook '(lambda ()
			      (TeX-fold-mode 1)
			      (outline-minor-mode 1)
			      ))

; I think these are pretty self explanatory, except maybe
; TeX-PDF-mode. Not sure what it does.
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)

