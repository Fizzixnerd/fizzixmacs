(require 'quack)
(require 'geiser)

(add-hook 'racket-mode-hook
	  (lambda ()
	    (geiser-mode 1)
	    (run-geiser 'racket)))
