;;; yatemplate-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "yatemplate" "yatemplate.el" (22714 376 774510
;;;;;;  703000))
;;; Generated autoloads from yatemplate.el

(defvar yatemplate-dir (locate-user-emacs-file "templates") "\
The directory containing file templates.")

(custom-autoload 'yatemplate-dir "yatemplate" t)

(defvar yatemplate-separator ":" "\
Separator used for splitting filenames.

This is the separator that is used to split template filenames into
the ordering and regular expression parts.

Note that this will be used as the SEPARATORS argument of
`split-string', so be careful when setting this to a value that
has special meaning in regular expressions.")

(custom-autoload 'yatemplate-separator "yatemplate" t)

(put 'yatemplate-owner 'safe-local-variable #'stringp)

(put 'yatemplate-license 'safe-local-variable #'stringp)

(autoload 'yatemplate-fill-alist "yatemplate" "\
Fill `auto-insert-alist'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("test-yatemplate.el" "yatemplate-pkg.el")
;;;;;;  (22714 376 790023 361000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; yatemplate-autoloads.el ends here
