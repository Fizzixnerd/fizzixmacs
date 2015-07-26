;; file-association-customizations.el
;; Created : October 19, 2012
;;
;; This file is not a part of GNU Emacs
;;
;; This file is under the GNU General Public License, version 2.
;;
;; October 19, 2012: * Created file; moved association of .lzz files
;;                     to c++-mode from c++-customizations to here.
;; July 19, 2013: * Associated .h files with c++-mode by default.
;; July 28, 2013: * Associated .hdl files with c-mode.

(require 'rust-mode)
(require 'glsl-mode)
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.lzz\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

;; hdl files are close enough to syntax C, so this works well enough.
(add-to-list 'auto-mode-alist '("\\.hdl\\'" . c-mode))

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
