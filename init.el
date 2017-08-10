; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 24, 2012
;     * Initial creation
;     * Moved everything out of init.el
;     July 19, 2013
;     * Added load-path entry for the standalone cc-mode package
;
; * load-path is a path searched by function load-library
; * load-file loads a file from a given filepath
; * load-library loads a library, searching load-path
; * load tries load-library if it doesn't look like a filepath, and uses
;   load-file if it does.
; * load-dirs loads all the directories held in the variable 'load-dirs
;   and all the subdirectories thereof if the variable 'load-dir-recursive
;   is t.

;(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet/")
;(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet/lisp")
;; Prevents regular CEDET from loading, which would screw everything up
;(load-file "~/.emacs.d/site-lisp/cedet/cedet-devel-load.el")

;(add-to-list 'load-path "~/.emacs.d/")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elpa/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
;(add-to-list 'load-path "~/.emacs.d/site-lisp/glsl-mode/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/cc-mode-5.32.5/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/company-quickhelp-20150322.451.el")
;(add-to-list 'load-path "~/.emacs.d/elpa/company-ghc-20150613.123/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/company-rtags.el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/stack-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ghc-mod-elisp")

; Fuck, I don't know what to do with these. I will leave them here, I
; guess.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex --enable-write18 -shell-escape")
 '(column-number-mode t)
 '(company-auto-complete (quote (quote company-explicit-action-p)))
 '(company-ghc-show-info t)
 '(doc-view-continuous t)
 '(ede-project-directories (quote ("/home/matt/src/silveretta/src")))
 '(elpy-rpc-python-command "python3")
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-program-name "cabal repl")
 '(inferior-haskell-use-web-docs (quote always))
 '(inferior-haskell-wait-and-jump t)
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
    ("~/Documents/school/jph311/project/proposal/proposal.org")))
 '(package-selected-packages
   (quote
    (elpy python-docstring flycheck-popup-tip flycheck-pycheckers company-jedi jedi jedi-core flymake-haskell-multi adoc-mode persp-fr persp-mode persp-projectile term-projectile helm-projectile projectile org-projectile package-build shut-up git commander f dash s company-cabal ag ahk-mode cask cask-mode cmake-font-lock company-bibtex company-cmake company-dict company-lua company-math company-nand2tetris company-shell dante ecb wtf virtualenv unbound smex slime-ritz slime-js slime-fuzzy sauron quack python-mode pretty-mode-plus pretty-lambdada pos-tip pep8 nose monokai-theme markdown-mode magit lua-mode load-dir less javadoc-help ipython idomenu highlight-indentation hc-zenburn-theme guru-mode google-translate god-mode ghc-imported-from fuzzy flymake-shell flymake-ruby flymake-python-pyflakes flymake find-file-in-project fic-ext-mode erc epl emms djvu dired+ dart-mode d-mode ctypes csharp-mode crontab-mode company-ghci company-ghc company-c-headers company-auctex color-theme-twilight color-theme-dawn-night cmake-mode clojure-mode autopair auto-complete-auctex ac-slime ac-python ac-geiser ac-clang Save-visited-files)))
 '(preview-auto-cache-preamble t)
 '(preview-gs-options
   (quote
    ("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
 '(python-check-command "/usr/bin/pyflakes3")
 '(python-shell-interpreter "python3")
 '(quack-pretty-lambda-p t)
 '(quack-smart-open-paren-p t)
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(semantic-c-dependency-system-include-path (quote ("/usr/include")))
 '(semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-tooltip))
 '(semantic-complete-inline-analyzer-idle-displayor-class (quote semantic-displayor-tooltip))
 '(semantic-java-dependency-system-include-path (quote ("/usr/share/java/")))
 '(semantic-mode t)
 '(semantic-python-dependency-system-include-path
   (quote
    ("/usr/lib/python2.7" "/usr/lib/python2.7/dist-packages")))
 '(show-paren-mode t)
 '(sql-database "matt")
 '(sql-product (quote postgres))
 '(sql-user "matt")
 '(tool-bar-mode nil))

;; These libraries should always be loaded.
(load-library "customizations/package-customizations.el")

(require 'yasnippet)
(yas-global-mode 1)

(load-library "customizations/desktop-customizations.el")
(load-library "customizations/ede-customizations.el")
(load-library "customizations/ac-customizations.el")
(load-library "customizations/ido-customizations.el")
(load-library "customizations/ispell-customizations.el")
(load-library "customizations/hs-customizations.el")
(load-library "customizations/navigation-customizations.el")
(load-library "customizations/file-association-customizations.el")
(load-library "customizations/shell-customizations.el")
(load-library "customizations/org-customizations.el")
(load-library "customizations/erc-customizations.el")
;; c++, tex, and cl are included here because they contain hooks and I don't
;; know how to deal with that at the moment... I should change this to
;; autoloads at some point.
(load-library "customizations/tex-customizations.el")
(load-library "customizations/racket-customizations.el")
;(load-library "customizations/cl-customizations.el")
(load-library "customizations/c++-customizations.el")
;(load-library "customizations/glsl-customizations.el")
(load-library "customizations/visual-customizations.el")
(load-library "customizations/haskell-customizations.el")
(load-library "customizations/mail-customizations.el")
(load-library "customizations/web-customizations.el")
(load-library "customizations/template-replace.el")
(load-library "customizations/pdfview-customizations.el")
(load-library "customizations/helm-customizations.el")
(load-library "customizations/yatemplate-customizations.el")

;; These libraries should only be loaded in their respective major
;; modes.

(add-hook 'python-mode-hook
	  '(lambda ()
	     (load-library "customizations/python-customizations.el")))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
