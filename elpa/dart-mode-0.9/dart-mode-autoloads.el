;;; dart-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads (dart-mode) "dart-mode" "dart-mode.el" (21006 17576
;;;;;;  75173 382000))
;;; Generated autoloads from dart-mode.el
 (add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

(autoload 'dart-mode "dart-mode" "\
Major mode for editing Dart files.

The hook `c-mode-common-hook' is run with no args at mode
initialization, then `dart-mode-hook'.

Key bindings:
\\{dart-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("dart-mode-pkg.el") (21006 17576 91662
;;;;;;  615000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; dart-mode-autoloads.el ends here
