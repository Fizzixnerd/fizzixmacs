;; c++-customizations.el
;; Created : April 23, 2012
;;
;; This file is not a part of GNU Emacs
;;
;; This file is under the GNU General Public License, version 2.
;;
;; April 23, 2012: * Made lazy c++ files (of .lzz extension) load c++-mode.
;;
;; October 19, 2012: * Moved the .lzz extension hook to
;;                     file-associations-cusomizations.el.
;;
;; July 19, 2013: * Added c++11 fontlock hack so that it recognizes
;;                  some newer keywords.

;; The following code is from stackexchange.com
;; (http://stackoverflow.com/questions/8549351/c11-mode-or-settings-for-emacs)

(require 'company)
(require 'flycheck)

(require 'irony)
(require 'company-irony)
(require 'flycheck-irony)
(require 'irony-eldoc)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-to-list 'company-backends 'company-irony)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'company-complete)
  (define-key irony-mode-map [remap complete-symbol]
    'company-complete))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-hook 'irony-mode-hook 'company-mode)
(add-hook 'irony-mode-hook 'flycheck-mode)
(add-hook 'irony-mode-hook 'irony-eldoc)
(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)

;;;; THIS WAS COMMENTED OUT ON JULY 26, 2015.
;; (require 'company)
;; (require 'company-rtags)

;; (add-to-list 'company-backends 'company-rtags)

;; (add-hook 'c++-mode-hook (lambda ()
;; 			   (company-mode 1)
;; 			   (company-quickhelp-mode 1)
;; 			   (local-set-key (kbd "C-M-d") 'company-show-doc-buffer)))


;; ;; START C++11 FONTLOCK HACK
;; (require 'font-lock)

;; (defun --copy-face (new-face face)
;;   "Define NEW-FACE from existing FACE."
;;   (copy-face face new-face)
;;   (eval `(defvar ,new-face nil))
;;   (set new-face new-face))

;; (--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
;;          'font-lock-keyword-face)
;; (--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
;;          'font-lock-doc-face)
;; (--copy-face 'font-lock-doc-string-face ; comment markups
;;          'font-lock-comment-face)

;; (global-font-lock-mode t)
;; (setq font-lock-maximum-decoration t)

;; (add-hook
;;  'c++-mode-hook
;;  '(lambda ()
;;     ;; We could place some regexes into `c-mode-common-hook', but note
;;     ;; that their evaluation order matters.
;;     (font-lock-add-keywords
;;      nil '(;; complete some fundamental keywords
;;            ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
;;            ;; namespace names and tags - these are rendered as
;;            ;; constants by cc-mode
;;            ("\\<\\(\\w+::\\)" . font-lock-function-name-face)
;;            ;;  new C++11 keywords
;;            ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
;;            ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
;;            ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
;;            ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
;;            ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
;;            ;; hexadecimal numbers
;;            ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
;;            ;; integer/float/scientific numbers
;;            ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
;;            ;; c++11 string literals
;;            ;;       L"wide string"
;;            ;;       L"wide string with UNICODE codepoint: \u2018"
;;            ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
;;            ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
;;            ;;       R"(user-defined literal)"
;;            ;;       R"( a "quot'd" string )"
;;            ;;       R"delimiter(The String Data" )delimiter"
;;            ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
;;            ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)" 1 font-lock-keyword-face t) ; start delimiter
;;            (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\(.*?\\))[^\\s-\\\\()]\\{0,16\\}\"" 1 font-lock-string-face t)  ; actual string
;;            (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(.*?\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; end delimiter

;;            ;; user-defined types (rather project-specific)
;;            ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
;;            ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
;;            ))
;;     ) t)
;; ;; END C++11 FONTLOCK HACK

