(setq irony-mode-packages
      '(irony
	company
	company-irony
	flycheck
	flycheck-irony
	irony-eldoc))

(defun irony-mode/init-company ()
  (use-package company))

(defun irony-mode/init-flycheck ()
  (use-package flycheck))

(defun irony-mode/init-irony-eldoc ()
  (use-package irony-eldoc))

(defun irony-mode/init-company-irony ()
  (use-package company-irony))

(defun irony-mode/init-flycheck-irony ()
  (use-package flycheck-irony
	       :init
	       (progn
		 (add-hook 'flycheck-mode-hook 'flycheck-irony-setup))))

(defun irony-mode/init-irony ()
  (use-package irony
	       :init
	       (progn
		 (add-hook 'c++-mode-hook 'irony-mode)
		 (add-hook 'c-mode-hook 'irony-mode)
		 (add-hook 'objc-mode-hook 'irony-mode)
		 (add-hook 'irony-mode-hook
			   (lambda ()
			     (define-key irony-mode-map [remap completion-at-point]
			       'company-complete)
			     (define-key irony-mode-map [remap complete-symbol]
			       'company-complete)))
		 (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
		 (add-hook 'irony-mode-hook 'my-irony-mode-hook)
		 (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
		 (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
		 (add-hook 'irony-mode-hook 'company-mode)
		 (add-hook 'irony-mode-hook 'flycheck-mode))))

