; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     February 25, 2012
;     * Initial creation
;     March 7, 2012
;     * Added CEDET stuff
;     * Changed "load" calls to "require" calls
;     * Added semantic things, and actually started to try to use
;         this; followed tutorial from:
;         http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html ...
;         It isn't very good, but whatever
;     * NEW DEPENDENCY: REQUIRES GNU global: sudo apt-get install global
;     * Added imenu TAGS item
;     March 8, 2012
;     * Changed the imenu hook to a lambda function
;     September 15, 2012
;     * Big changes
;     * Now requires CEDET version 1.1
;     * Completely rewrote the file to work with new version

(require 'cedet)
(require 'semantic)

;; Note: apparently cedet can get pissy if you enable using "t"
;; instead of "1". I'm looking at you, global-semanticdb-minor-mode!
(global-ede-mode 1)
(ede-enable-generic-projects)

;; uses exuberant-ctags to parse for new languages only
;(semantic-load-enable-primary-exuberent-ctags-support)

(add-hook 'semantic-init-hooks
	  '(lambda () (imenu-add-to-menubar "Tags")))

(defun complete-instance-variables-and-methods ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))

(defun semantic-enable-idle-helpers ()
  (semantic-idle-completions-mode 1)
  (semantic-idle-summary-mode 1))

(defun semantic-enable-other-helpers ()
  (semantic-idle-completions-mode 1)
  (semantic-idle-summary-mode 1)
  (semantic-idle-scheduler-mode 1)
  (semantic-auto-parse-mode 1)
  (semantic-stickyfunc-mode 1)
  (semantic-mru-bookmark-mode 1)
  (semanticdb-minor-mode 1))

(defun lisp-semantic-hook ()
  (semantic-enable-other-helpers))

(defun c-like-semantic-hook ()
  (semantic-enable-idle-helpers)
  (semantic-enable-other-helpers)
  (complete-instance-variables-and-methods))

(add-hook 'c-mode-common-hook 'c-like-semantic-hook)
(add-hook 'java-mode-common-hook 'c-like-semantic-hook)
(add-hook 'python-mode-common-hook 'c-like-semantic-hook)
(add-hook 'common-lisp-mode-hook 'lisp-semantic-hook)

;;;;;;;;;;;;;;;
;; THIS IS ALL FOR OLD CEDET STUFF (version 1.0)
;;;;;;;;;;;;;;;
;; (require 'cedet)
;; (require 'ede)
;; (require 'semantic)
;; (require 'srecode)

;; (global-ede-mode t)
;; (semantic-mode t)
;; (semantic-gcc-setup)

;; ; Load ALL CEDET files!  ALL OF THEM
;; ;(require 'load-dir)
;; ;(add-to-list 'load-dirs "/usr/share/emacs/24.1.50/lisp/cedet")
;; ;(setq load-dirs-recursive t)
;; ;(load-dirs)
;; ;(setq load-dirs-recursive nil)

;; ; mode stuff.
;; ;(global-semantic-idle-completions-mode t)
;; (global-semantic-decoration-mode t)
;; (global-semantic-idle-scheduler-mode t)
;; (global-semantic-idle-summary-mode t)
;; (global-semantic-mru-bookmark-mode t)
;; (global-semantic-stickyfunc-mode t)
;; (global-semanticdb-minor-mode t)

;; ; GNU global stuff
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)
;; (semanticdb-enable-gnu-global-databases 'cc-mode)

;; ; This adds the Tags item to the menubar
;; (add-hook 'semantic-init-hooks
;; 	  '(lambda () (imenu-add-to-menubar "Tags")))

;; ; Makes semantic automatically try to complete structure and object names
;; ; in C-like languages, Java and Python
;; (defun complete-instance-variables-and-methods ()
;;   (local-set-key "." 'semantic-complete-self-insert)
;;   (local-set-key ">" 'semantic-complete-self-insert))
;; (add-hook 'c-mode-common-hook 'complete-instance-variables-and-methods)
;; (add-hook 'java-mode-common-hook 'complete-instance-variables-and-methods)
;; (add-hook 'python-mode-common-hook 'complete-instance-variables-and-methods)

;; ; Tab completion done by auto-complete.el
