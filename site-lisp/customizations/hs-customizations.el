;; Created April 23, 2012
;; Enable Code folding in emacs.  Use C-c @ C-c to fold and unfold
;; April 23, 2012: * first edit
;;                 * enabled hs-minor-mode globally (SCRATCH THAT)
;;                 * hs cannot be enabled in fundamental mode, so I guess
;;                   I'll just have to hook it to all the modes I'm using...

(defun my-hs-mode-hook ()
  (hs-minor-mode))

(add-hook 'c-mode-common-hook 'my-hs-mode-hook)
(add-hook 'java-mode-hook 'my-hs-mode-hook)
(add-hook 'python-mode-hook 'my-hs-mode-hook)
(add-hook 'common-lisp-mode 'my-hs-mode-hook)
