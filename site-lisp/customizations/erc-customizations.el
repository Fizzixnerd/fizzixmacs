; Author: Matt Walker (matt.g.d.walker@gmail.com)
; Changelog:
;     July 22, 2013
;     * Initial creation
;     August 16, 2013
;     * Enabled:
;       -Autoaway
;       -Default Nicks
;       -Default Ports
;       -Default Servers
;       -Logging
;       -Notifications
;       -Scroll-to-Bottom
;       -Smilies (disabled due to 100% cpu bug.)
;       -Sounds (not yet fully enabled.)
;       -mIRC Colors

(require 'erc)

;; sounds
(erc-sound-mode)
;; display modifications
;; (erc-smiley-mode)
(setq erc-interpret-mirc-color t)
;; timestamps
(setq erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format " [%H:%M:%S]"
      erc-insert-timestamp-function 'erc-insert-timestamp-right)
;; scroll to bottom
(erc-scrolltobottom-mode)
;; notifications
(erc-notifications-mode)
;; logging
(setq erc-log-channels-directory (expand-file-name "~/.erc/logs"))
(erc-log-mode)

;; autoaway
;(setq erc-away-nickname "Fizzixnerd|autoaway|"
;      erc-autoaway-idle-seconds (* 15 60))
;(erc-autoaway-mode)

;; default server settings
;; (setq erc-server "irc.ponychat.net"
;;       erc-port 6667
;;       erc-nick "Fizzixnerd")

(setq erc-server "chat.freenode.net"
      erc-port 6667
      erc-nick "Fizzixnerd")
;; autojoin settings
(setq erc-autojoin-channels-alist '(("ponychat.net" "#bronystate") ("freenode.net" "#lisp")))

