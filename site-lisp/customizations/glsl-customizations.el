(require 'glsl-mode)

(add-hook 'glsl-mode-hook
	  (lambda ()
	    (irony-mode 0)
	    (eldoc-mode 0)
	    (flycheck-mode 0)))
