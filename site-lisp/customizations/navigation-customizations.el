; Author: Matt Walker <matt.g.d.walker@gmail.com>
; Changelog:
;     September 13, 2012
;     * Initial creation
;     * Created function, intended to be bound to C-a, that returns
;       you to the _logical_ beginning of the line before the _actual_
;       beginning.

(defun smart-move-beginning-of-line (&optional arg)
  "Move point to the first non-whitespace character on the
  current line.  If point is already located there, move to the
  beginning of the line."
  (interactive "P")
  (let ((point-old-position (point)))
    (back-to-indentation)
    (when (<= point-old-position (point))
      (move-beginning-of-line arg))))

;; Helper for skip-whitespace-or-forward-word and
;; next-n-chars-are-whitespace (n)
(defun count-whitespace (&optional rbegin rend)
  "Count the whitespace within the region defined by rbegin and
  rend.  If rbegin is nil or not passed, it defaults to point's
  current position.  rend defaults to mark (if set) or the end of
  the (possibly narrowed) buffer (if not)."
  (let ((rbegin (or rbegin
		    (point)))
	(rend   (or rend
		    (mark)
		    (point-max))))
    (how-many "[[:space:]|\n]" rbegin rend)))

;; (defun count-consecutive-whitespace (&optional pos)
;;   "Return the number of consecutive whitespace characters after
;; pos.  pos defaults to (point) if nil or not passed."
;;   (let ((count 0))
;;     (while (> (how-many)))))

;; Helper for skip-whitespace-or-forward-word
(defun next-n-chars-are-whitespace (n)
  "Return t if the next n characters after point are whitespace
  characters, else return nil.  n can be negative, in which case
  it checks the characters before point."
  (= (abs n) (count-whitespace (point) (+ (point) n))))

(defun skip-whitespace-or-forward-word (&optional arg)
  "If there are more than two whitespace characters after point,
  move point to the end of them.  Otherwise, equivalent to
  forward-word."
  (interactive "P")
  (if (next-n-chars-are-whitespace 3)
      (progn
	(forward-word arg)
	(backward-word arg))
    (forward-word arg)))

;; (defun skip-word (&optional arg)
;;   (interactive "P")
;;   (unless arg (setq arg 1))
;;   (mouse-skip-word arg))

;; the following block tells Emacs to automatically indent pasted
;; lines.
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
	   (and (not current-prefix-arg)
		(member major-mode '(emacs-lisp-mode lisp-mode
				     clojure-mode    scheme-mode
				     haskell-mode    ruby-mode
				     rspec-mode      python-mode
				     c-mode          c++-mode
				     objc-mode       latex-mode
				     plain-tex-mode))
		(let ((mark-even-if-inactive transient-mark-mode))
		  (indent-region (region-beginning) (region-end) nil))))))

(global-set-key [home] 'smart-move-beginning-of-line)
(global-set-key "\C-a" 'smart-move-beginning-of-line)
(global-set-key "\M-f" 'skip-whitespace-or-forward-word)
