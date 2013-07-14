;; file-association-customizations.el
;; Created : October 19, 2012
;;
;; This file is not a part of GNU Emacs
;;
;; This file is under the GNU General Public License, version 2.
;;
;; October 19, 2012: * Created file; moved association of .lzz files
;;                     to c++-mode from c++-customizations to here.

(add-to-list 'auto-mode-alist '("\\.lzz\\'" . c++-mode))
