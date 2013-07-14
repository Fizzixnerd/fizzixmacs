#! /bin/bash

sbcl --noinform --end-runtime-options --no-userinit --eval "(progn (mapc 'require '(sb-bsd-sockets sb-posix sb-introspect sb-cltl2 asdf)) (save-lisp-and-die \"sbcl.core-for-slime\"))" --end-toplevel-options
