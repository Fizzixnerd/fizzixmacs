;;Haskell Mode customizations.

(require 'haskell-mode)
(require 'haskell-process)
(require 'company)
(require 'company-quickhelp)
(require 'speedbar)
(require 'intero)

(add-to-list 'company-backends 'company-intero)
(global-intero-mode)

(add-hook 'haskell-mode-hook
	  (lambda ()
	    (company-mode 1)
	    (company-quickhelp-mode 1)
	    (local-set-key (kbd "C-M-d") 'company-show-doc-buffer)
	    (local-set-key (kbd "C-c C-r") 'haskell-process-load-or-reload)
	    (subword-mode +1)
	    (turn-on-haskell-indentation)
	    (turn-on-haskell-doc-mode)
	    (turn-on-haskell-decl-scan)
	    (setq haskell-process-suggest-remove-import-lines t)
	    (setq haskell-process-auto-import-loaded-modules t)
	    (haskell-session-change)
	    (define-key haskell-cabal-mode-map [remap completion-at-point]
	      'company-complete)
	    (define-key haskell-cabal-mode-map [remap complete-symbol]
	      'company-complete)))

(speedbar-add-supported-extension ".hs")
