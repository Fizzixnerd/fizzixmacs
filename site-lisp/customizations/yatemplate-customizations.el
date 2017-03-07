;;; Created: March 4, 2017
;; Matthew Walker.
;; GPLv3.
;
; Requires `f' and `yatemplate'.

(require 'yatemplate)
(require 'f)

(auto-insert-mode)

(setq yatemplate-dir "~/.emacs.d/yatemplates")
(setq yatemplate-owner "Matthew Walker <matt.g.d.walker@gmail.com>")
(setq yatemplate-license-alist (list 
				'(gpl3 . "https://www.gnu.org/licenses/gpl-3.0-standalone.html")
				'(gpl2 . "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html")
				'(bsd2 . "Copyright 2017 Matthew Walker

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.")))

(yatemplate-fill-alist)

(defun yatemplate-today ()
  "Return the date in 'MMM DD, YYYY' format.  Requires a *nix
shell and the standard 'date' program."
  (interactive)
  (string-trim (shell-command-to-string "date +'%b %d, %Y'")))

(defun yatemplate-get-license (license-id)
  "Return either a link to or the text of (for small licenses)
the license indicated by license-id.  Currently acceptable values
are 'gpl3, 'gpl2, 'bsd2.  See `yatemplate-license-alist'"
  (alist-get license-id yatemplate-license-alist))

(defun hs-cabal-project-p ()
  "Return t if we can find a cabal file for this project, else
nil."
  (interactive)
  (f-exists? (f-join (hs-project-root) 
		     (string-join (list (hs-project-name) ".cabal")))))

(defun hs-stack-project-p ()
  "Return t if we can find a stack.yaml file for this project,
else nil."
  (interactive)
  (f-exists? (f-join (hs-project-root) 
		     "stack.yaml")))

(defun hs-cabal-filepath ()
  "Return the cabal file filepath of the project if we can find it,
else nil."
  (interactive)
  (and (hs-cabal-project-p)
       (f-join (hs-project-root) 
	       (string-join (list (hs-project-name) ".cabal")))))

(defun hs-stack-filepath ()
  "Return the stack.yaml filepath of the project if we can find
it, else nil."
  (interactive)
  (and (hs-stack-project-p)
       (f-join (hs-project-root) 
	       "stack.yaml")))

;; (defun path-split (fp &optional nondirectory-p)
;;   "Split a filepath into components on the separator and return
;; as a list.  Currently only support '/' as a separator."
;;   (if nondirectory-p
;;       (subseq (split-string fp "/") 1)
;;     (subseq (butlast (split-string fp "/")) 1)))

;; (defun path-join (file-path-component-list &optional relative-p directory-p no-prepend-p)
;;   "Inverse of `path-split'."
;;   (if (null file-path-component-list)
;;       ""
;;     ;; else: non-empty argument
;;     (if (null (cdr file-path-component-list))
;; 	(first file-path-component-list)
;;       ;; else: more than one path component
;;       (let ((separator (if (string-suffix-p "/" (first file-path-component-list))
;; 			   ""
;; 			 "/"))
;; 	    (prepend (if relative-p
;; 			 "./"
;; 		       "/"))
;; 	    (postpend (if directory-p
;; 			  "/"
;; 			"")))
;; 	(string-join (list
;; 		      (or (and (not no-prepend-p)
;; 			       prepend)
;; 			  "")
;; 		      (path-join (cons 
;; 				  (string-join (list 
;; 						(first file-path-component-list)
;; 						(second file-path-component-list)) 
;; 					       separator)
;; 				  (cddr file-path-component-list))
;; 				 t
;; 				 nil
;; 				 t)
;; 		      postpend))))))

(defun hs-project-name ()
  "Return the name of the project, as indicated by the name of
the project root directory."
  (interactive)
  (first (last (f-split (hs-project-root)))))

(defun pwd* ()
  "Return the current working directory."
  (interactive)
  (subseq (pwd) 10))

(defun last* (lst)
  "Return the last element of a list."
  (first (last lst)))

(defun hs-project-root ()
  "Return the project root directory.  If a project root cannot
be found then it is assumed to be the current directory."
  (interactive)
  (if (ignore-errors (projectile-project-root))
      (projectile-project-root)
    (pwd*)))

(defun drop-while (p lst)
  "Return a new list like lst but with the first sequence of
values for which p returns non-nil removed."
  (if (not (null lst))
      (if (apply p (first lst) nil)
	  (drop-while p (cdr lst))
	lst)
    lst))

(defun hs-file-src ()
  "Return the primary 'src' directory for this file, by guessing
that it's the first lower-case path component."
  (interactive)
  (apply #'f-join (reverse (drop-while (lambda (x)
					 (let ((first-char (subseq x 0 1)))
					   (and (not (string= first-char ".")) 
						(equal first-char (upcase first-char))))) 
				       (reverse (f-split (pwd*)))))))

(defun hs-file-module-path ()
  "Return the 'module path' for use in `hs-file-module-name'."
  (interactive)
  (let ((module-path (apply #'f-join 
			    (subseq (f-split buffer-file-name) 
				    (length (f-split (hs-file-src)))))))
    (or (and (not (string= module-path ""))
	     module-path)
	(string-join (list "./" (last* (path-split buffer-file-name t)))))))

(defun hs-file-module-name ()
  "Return the current file's fully qualified module name, derived
from its `hs-file-src'."
  (interactive)
  (letrec ((module-path-list (f-split (hs-file-module-path)))
	   (final-name (first (split-string (last* module-path-list) "\\."))))
    (string-join (append (butlast module-path-list) 
			 (list final-name))
		 ".")))

(hs-file-module-name)

;; (string-join (drop-while (lambda (x)
;; 			     (let ((first-char (subseq x 1)))
;; 			       (equal first-char (downcase first-char)))) 
;; 			   (reverse (path-split (pwd*))))
;; 	       "."))

(defun hs-filepath-to-module-name ()
  (interactive)
  (let ((proj-src (hs-find-project-src))
	(basename (file-name-nondirectory buffer-file-name)))