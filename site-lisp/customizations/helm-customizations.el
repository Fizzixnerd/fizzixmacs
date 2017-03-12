; Created March 4, 2017.
; Matthew Walker.
; GPLv3.
;
; See
; https://github.com/thierryvolpiatto/emacs-tv-config/blob/master/init-helm-thierry.el
; for more ideas.

(require 'helm)
(require 'helm-config)
(require 'helm-ag)
(require 'helm-bbdb)
(require 'helm-bibtex)
(require 'helm-c-yasnippet)
(require 'helm-company)
(require 'helm-flycheck)
(require 'helm-flymake)
(require 'helm-flyspell)
(require 'helm-ghc)
(require 'helm-gitignore)
(require 'helm-google)
(require 'helm-hoogle)
(require 'helm-org-rifle)
(require 'helm-projectile)
(require 'helm-pydoc)
(require 'helm-smex)
(require 'helm-swoop)
(require 'helm-youtube)

(global-set-key (kbd "M-x")                          'undefined)
(global-set-key (kbd "M-x")                          'helm-M-x)
(global-set-key (kbd "M-y")                          'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f")                      'helm-find-files)
(global-set-key (kbd "C-c <SPC>")                    'helm-all-mark-rings)
(global-set-key (kbd "C-x r b")                      'helm-filtered-bookmarks)
(global-set-key (kbd "C-h r")                        'helm-info-emacs)
(global-set-key (kbd "C-:")                          'helm-eval-expression-with-eldoc)
(global-set-key (kbd "C-,")                          'helm-calcul-expression)
(global-set-key (kbd "C-h d")                        'helm-info-at-point)
(global-set-key (kbd "C-h i")                        'helm-info)
(global-set-key (kbd "C-x C-d")                      'helm-browse-project)
(global-set-key (kbd "C-h C-f")                      'helm-apropos)
(global-set-key (kbd "C-h a")                        'helm-apropos)
(global-set-key (kbd "C-c i")                        'helm-imenu-in-all-buffers)
(global-set-key (kbd "C-s")                          'helm-occur)
(define-key global-map [remap jump-to-register]      'helm-register)
(define-key global-map [remap list-buffers]          'helm-mini)
(define-key global-map [remap dabbrev-expand]        'helm-dabbrev)
(define-key global-map [remap find-tag]              'helm-etags-select)
(define-key global-map [remap xref-find-definitions] 'helm-etags-select)

(helm-mode)
(helm-adaptive-mode)
(helm-push-mark-mode)
(helm-popup-tip-mode)
(helm-top-poll-mode)

