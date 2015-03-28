;; Haskell Mode customizations.

(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'company)
(require 'company-ghc)
(require 'company-ghci)
(require 'company-quickhelp)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (ghc-init)
	    (company-mode 1)
	    (company-quickhelp-mode 1)
	    (auto-complete-mode 0)
	    (local-set-key (kbd "C-M-d") 'company-show-doc-buffer)
	    (subword-mode +1)
	    (flymake-mode 0)
	    (turn-on-haskell-indentation)
	    (turn-on-haskell-doc-mode)
	    (turn-on-haskell-decl-scan)
	    (setq haskell-process-suggest-remove-import-lines t)
	    (setq haskell-process-auto-import-loaded-modules t)
	    (setq haskell-process-log t)))

