;;; pushbullet-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "pushbullet" "pushbullet.el" (21958 4228 139888
;;;;;;  354000))
;;; Generated autoloads from pushbullet.el

(autoload 'pushbullet-clear-devices "pushbullet" "\
Clear the device id cache, useful if new devices are added

\(fn)" t nil)

(autoload 'pushbullet "pushbullet" "\
Pushes the selection as a note to all registered devices. Title
   defaults to buffer-name but is accepted as a user input. If
   there is no selection, the entire buffer is sent.

  For this to work you must have set `pushbullet-api-key' to the
  api key of your pushbullet account.

\(fn START END TITLE)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pushbullet-autoloads.el ends here
