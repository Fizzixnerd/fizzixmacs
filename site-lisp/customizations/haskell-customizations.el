;;Haskell Mode customizations.

(add-path "~/.stack/snapshots/x86_64-linux-nopie/lts-8.23/8.0.2/share/x86_64-linux-ghc-8.0.2/HaRe-0.8.4.0/elisp")

(require 'haskell-mode)
(require 'haskell-process)
<<<<<<< HEAD
(require 'hare)
(require 'ghc)
=======
>>>>>>> intero
(require 'company)
(require 'company-quickhelp)
(require 'speedbar)
(require 'intero)

(add-to-list 'company-backends 'company-intero)
(global-intero-mode)

(add-hook 'haskell-mode-hook
	  (lambda ()
<<<<<<< HEAD
	    (ghc-init)
	    (hare-init)
=======
>>>>>>> intero
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
