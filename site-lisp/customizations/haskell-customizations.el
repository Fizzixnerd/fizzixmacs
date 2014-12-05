;; Haskell Mode customizations.

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook
	     (lambda ()
	       (ghc-init)
	       (turn-on-haskell-indentation)
	       (turn-on-haskell-doc)
	       (turn-on-haskell-decl-scan)))

