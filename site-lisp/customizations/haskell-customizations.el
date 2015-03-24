;; Haskell Mode customizations.

(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'company)
(require 'company-ghc)
(require 'company-ghci)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (company-mode)
	    (auto-complete-mode 0)
	    (subword-mode +1)
	    (ghc-init)
	    (turn-on-haskell-indentation)
	    (turn-on-haskell-doc-mode)
	    (turn-on-haskell-decl-scan)
	    (setq haskell-process-suggest-remove-import-lines t)
	    (setq haskell-process-auto-import-loaded-modules t)
	    (setq haskell-process-log t)))

