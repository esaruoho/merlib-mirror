;;; dotemacs.el --- Will Mengarini's Emacs startup, run from .emacs or _emacs

;; Copyright (C) 1998 Will Mengarini

;; Author: Will Mengarini <seldon@eskimo.com>
;; URL: <http://www.eskimo.com/~seldon>
;; Created: Feb 1997
;; Keywords: dotemacs, .emacs, _emacs, init, initialize, startup, fungus

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; This is Will Mengarini's .emacs, renamed to dotemacs.el so it can be
;; loaded under Unix from .emacs or under DOS from _emacs.
;; On Su 10 Aug 97 this file had 2001 lines; on Sa 24 Apr 99, 6666.
;; Record length: 7,195 lines on Su 12 Sep 99.

;; Don't mess with me: (apply '+ (mapcar 'identity "MENGARINI"))

;; This file is *big*.  I considered breaking it up into components to be
;; (load)ed, but I'm not convinced that accomplishes anything useful.  The
;; time I spend wandering around this file is then spent choosing among
;; multiple files, most of which are large enough that they also take some
;; work to find things in them.  So instead the contents here are separated
;; by five-leading-semicolon headers, & the best way to quickly move thru
;; them is to use outline-minor-mode, for which control variable definitions
;; are provided at end of file.  If you're not familiar with
;; outline-minor-mode, just remember that you type C-c @ C-t to get a listing
;; of all the headings, type the usual motion keys to move among them, & type
;; C-c @ C-a to see all the text again.  When you realize how convenient this
;; is, see Emacs Info on Outline Mode & remap outline-minor-mode-prefix to
;; something less carpally hostile (I use C-c C-k).  M-x imenu may also help.

;; A sample .emacs or _emacs:
;;   (setq load-path (cons "~/elisp" load-path))
;;   (load "dotemacs")

;; On 2 Apr 1992 in the journal Nature the discovery was reported that
;; a giant ancient fungus had been living under the forests of Michigan
;; for at least 1,500 years, the oldest and largest living thing on Earth.
;; Software could get to be like that, I suppose, and Emacs, incorporating,
;; like the fungal thallus, all the the filamentous strands of Emacs Lisp
;; that now already thinly web the Earth, is surely a front runner.
;; But do not be distracted by such lives.  Even the life of Emacs,
;; like the life of that fungus, is an ephemerality; to grok life
;; one must transcend not only thermospace but cyberspace.

;;; Code:

(setq debug-on-error t);will be cleared at end of buffer

;; A lot of the code in other sections of this file was developed before all
;; my notation was organized, so don't waste time wondering "why didn't he
;; use his blonkflorb macro"; probably it hadn't been developed yet.

(require 'cl)

;;;;; ************************* UNCOMMON LISP ************************* ;;;;;

(defvar uncommon-lisp-verbose-load nil
  "Whether Uncommon Lisp displays various messages during its load process.
Some of these messages can be rather long, such as the text of multiple
macros defined by mapping constructs.  If you set this to t, you probably
also should set the variable message-log-max (an Emacs builtin).")

;;; Personal code while this is still in dotemacs:

(setq uncommon-lisp-verbose-load   t
      message-log-max            500)

(require 'grok) ;for 'grok-test

;;;; --------------------------- EVALUATION ---------------------------- ;;;;

;; ;? I think I'd prefer to hack this so it'll accept a bare symbol for
;; errors as equivalent to a singleton list.
(defmacro ignoring (errors &rest body)
  "Return nil if any of ERRORS is signalled while executing BODY.
This is an improvement on the 19.34 Common Lisp `ignore-errors', which
ignores everything.  Sample use:
  (ignoring (arith-error file-error)
    (require 'libertocracy)
    (message \"maybe\")
    (/ 0 0)
    (message \"never\"))
The body, if non-singleton, is surrounded by a `progn', so you can put
multiple forms there; but remember that the first time one of them signals an
ignored error, the *entire* `ignoring' form will immediately return nil,
without ever executing the rest of BODY.  This is not equivalent to
surrounding each form in BODY with `ignoring', which would guarantee
attempting them all.  Therefore, in the above example, the first message
might be seen, but the second will never be seen.

These forms are all equivalent:
  (ignoring (error) ...)
  (ignore-errors ...)
  (condition-case nil (progn ...) (error nil))

ignoring: (ERRORS &rest BODY)" ;Why do I need to code that by hand?
  `(condition-case nil
       ,(if (= (length body) 1)
            (car body)
          `(progn ,@body))
     (,(if (= (length errors) 1) (car errors) `,@errors)
       nil)))
(put 'ignoring 'lisp-indent-function 'defun)

;; ELisp has the function 'car-safe to return the car of its arg, or nil if
;; there is no car.  There's an analogous 'cdr-safe.  The concept is that
;; suffixing "-safe" to the symbol name returns nil if the requested value
;; doesn't exist.  Often I want to check whether a minor mode is enabled, but
;; I can't just check its mode variable for a non-nil value, because if the
;; mode hasn't been loaded the value is unbound.  Typically I code
;;   (and (boundp 'glamthwabble-mode) glamthwabble-mode)
;; but that sucks.  I want to check the value with something like a -safe
;; function, but I don't want any kind of other value-accessing like 'car
;; does.  The simplest ELisp function is 'identity, which just returns its
;; arg; what I want is 'identity-safe.  However, it needs to be a macro so it
;; can be invoked on void values, & since that's different from the other
;; -safe forms, perhaps a different naming scheme is better:

(defmacro void->nil (&rest EXPR)
  "Returns EXPR, or nil if void-function or void-variable were signalled
during the evaluation of EXPR.  This allows forms like
  (when (void->nil glamthwabble-mode)
    (special-handling))
which would otherwise require
  (when (and (boundp 'glamthwabble-mode) glamthwabble-mode)
    (special-handling))."
  `(ignoring (void-function void-variable)
     ,@EXPR))

;; An alternative approach to the same problem, which avoids macros &
;; condition-case, & maintains symmetry with other -safe functions:

(defun symbol-value-safe (symbol)
  "Return SYMBOL's value, or nil if that is void."
  (if (boundp symbol) (symbol-value symbol)))

(defun symbol-function-safe (symbol)
  "Return SYMBOL's function definition, or nil if that is void."
  (if (fboundp symbol) (symbol-function symbol)))

(defalias 'symbol-plist-safe 'symbol-plist)
(defalias 'symbol-name-safe  'symbol-name)

;; Actually, I don't like any of those solutions to the glamthwabble-mode
;; problem; condition-case is inefficient, & the -safe forms are too
;; verbose.  Here's a solution that's faithful to Emacs's naming conventions
;; & specific to the problem:

(defmacro void-to-nil (symbol)
  "Return the value of SYMBOL, or nil if it's unbound."
  (or (symbolp symbol) (error "void-to-nil must be invoked on a symbol"))
  `(if (boundp ',symbol) ,symbol))

;; Note that void->nil allows unbound functions but void-to-nil doesn't.  In
;; Scheme there's no distinction between function values & variable values.

;;;; --------------------------- ASSIGNMENT ---------------------------- ;;;;

;; Used with replace-match on strings:

(defmacro callf4 (FUNCTION ARG1 ARG2 ARG3 PLACE &rest ARGS)
  "Like callf2 but PLACE is the 4th arg to FUNCTION."
  `(setf ,PLACE (,FUNCTION ,ARG1 ,ARG2 ,ARG3 ,PLACE ,@ARGS)))

;; And why not generalize it for hack value:

(defmacro callfn (N FUNCTION &rest ARGS)
  "Like callf2 but PLACE is the Nth arg (origin 1) to FUNCTION."
  `(setf ,(nth (1- N) ARGS) (,FUNCTION ,@ARGS)))

;; In the following implementation of multiple values symbols' names could
;; conflict with the names of symbols to which assignments are being made.
;; In general, in Lumpen/Uncommon Lisp I'm tolerating that kind of thing,
;; just coding carefully & using SHOUTING to create an ersatz separate
;; namespace for such args.  (multiple-value-set [foo SYMBOLS bar] ...) would
;; fail, but is sufficiently unlikely to be tolerable.

;; I think this could be redone safely as a macro.  There is one use in
;; timelog.el of real multiple-value-set, evaluating the symbols dynamically.

(defun multiple-value-set (SYMBOLS VALUES)
  "Similar to 'multiple-value-setq in cl-macs.el.
\(multiple-value-set [s t u v] '(3 4 5))
sets s to 3, ignores 4, sets u to 5, & sets v to nil."
  (let ((I 0)
        SYMBOL)
    (while (< I (length SYMBOLS))
      (setq SYMBOL (elt SYMBOLS I))
      (or (eq SYMBOL t)
          (set SYMBOL (elt VALUES I)))
      (incf I))))

(defsetf thing-at-point (thing) (new-value)
  (let ((bounds (gensym))
        (start (gensym))
        (end (gensym)))
    `(let* ((,bounds (bounds-of-thing-at-point ,thing))
            (,start (car ,bounds))
          (,end (cdr ,bounds)))
       (setf (buffer-substring ,start ,end) ,new-value))))

;;;; --------------------------- COMPARISON ---------------------------- ;;;;

(defun file= (x y)
  "Return whether two strings name the same file."
  (equal (file-truename (expand-file-name (or x "")))
         (file-truename (expand-file-name (or y "")))))

;; Allow comparisons with more than 2 args, as Common Lisp does
;; for numeric comparisons.  Suffix names of variants with "*".
;; This is very useful in testing range membership, as in
;; (<=* ?a char ?z).  Common Lisp defines such comparisons applied
;; to singleton lists as t; extend that (as in APL) to '().

(loop for comparator in '(< <= = >= >
                          eq eql equal equalp
                          string= string< file= tree-equal)
      as comparator* = (intern (concat (symbol-name comparator) "*"))
      as doc = (format "Extended `%S', allowing > 2 args." comparator)
      ;; It's orthodox Common Lisp for the numeric comparators, but
      ;; Common Lisp still requires `equal' etc to take just 2 args.
      do (eval `(defun ,comparator* (&rest values)
                  ,doc
                  (let (x y)
                    (catch t
                      (while (setq x (pop values) y (car values))
                        (unless (,comparator x y)
                          (throw t nil)))
                      t)))))

(progn
  (assert      (<=* 1 3))
  (assert (not (<=* 3 1)))
  (assert      (<=* 1 3 5))
  (assert (not (<=* 1 5 3)))
  )

;; `/=' is a special case.

(defun /=* (&rest numbers)
  "Common Lisp `/=', allowing > 2 args and requiring all to differ."
  (let (x)
    (catch t
      (while (setq x (pop numbers))
        (if (member* x numbers :test '=)
            (throw t nil)))
      t)))

;;;; ---------------------------- SELECTION ---------------------------- ;;;;

(defmacro or* (&rest args)
  "Eval args till one yields a non-empty non-zero value, then return it.
The remaining args are not evalled at all.
If all args return values that are empty or zero, return nil.
The normal application of this is to select among alternatives, as in
\(log10 (or* x 1)) using 1 instead of x when x is 0; but note that `or*' can
also be useful when applied to a single argument, converting any empty or
zero value to nil."
  (cons 'or (mapcar (lambda (arg) `(or*-OK ,arg)) args)))

(defun or*-OK (value)
  "Return VALUE if it's not empty or zero, else nil.
This function is used in the implementation of the or* macro, q.v."
  (when (cond ((integerp value)
               (not (zerop value)))
              ((sequencep value)
               (not (zerop (length value))))
              ((floatp value)
               (require 'fastfuzz)
               (not (fastfuzzyzerop value))) ;from my fastfuzz.el
              ((symbolp value)
               (or (boundp value)
                   ;; I considered the possibility that the value may be
                   ;; another symbol.  Following a symbol-value chain would
                   ;; be asymmetrical with the definition of (or* '(()));
                   ;; '(()) is not considered "empty or zero".
                   (fboundp value)
                   (symbol-plist value)))
              ((hash-table-p value)
               (or*-OK (hash-table-count value)))
              ;; Subsequent data types take a bit of thought.  You can
              ;; use plain `or' to check whether some variable contains
              ;; things like buffers & frames or contains nil; `or*'
              ;; should actually look *inside* the value to see whether
              ;; it's "empty or zero".
              ((bufferp value)
               (and (buffer-live-p value)
                    (save-excursion
                      (set-buffer value)
                      (> (dot-max) 1))))
              ((windowp value)
               (and (window-live-p value)
                    (or*-OK (window-buffer value))))
              ((window-configuration-p value)
               (error "Unimplemented: (or* #<window-configuration>)")
               ;; <URL:Info:(elisp)Window Configurations>: "Primitives
               ;; to look inside of window configurations would make
               ;; sense, but none are implemented.  It is not clear they
               ;; are useful enough to be worth implementing."  It would be
               ;; possible to do this nonetheless with `walk-windows', but
               ;; it would be necessary to locally nil out
               ;; `window-size-change-functions' inside a `let' form.
               ;; Somehow I don't see hack value in that, just because it's
               ;; so tedious.  The other definitions of empty-or-zero-ness
               ;; here are all intuitively correct & elegantly implemented.
               )
              ((framep value)
               (and (frame-live-p value)
                    (loop for window being the windows of value
                          if (or*-OK window) return t)))
              ((frame-configuration-p value)
               (loop for frame in (mapcar 'car (cdr value))
                     if (or*-OK frame) return t)))
    value))

(defun or*-test ();Use C-x C-e here to test: (or*-test)
  (assert (equal 1   (or* 1)))
  (assert (equal 1   (or* 1 2)))
  (assert (equal 1.0 (or* 0.0 1.0)))
  (assert (equal 1.0 (or* 0.0 1.0 2.0)))
  (assert (equal 1   (or* 1 "")))
  (assert (equal 1   (or* "" 1)))
  (assert (equal 1   (or* 1 () 2 () 3)))
  (assert (equal 1   (or* 1 '() ())))
  (assert (equal "!" (or* "" "!")))
  (assert (equal "!" (or* [] "!")))
  (assert (equal "!" (or* [] 0 "" 0.0 () "!")))
  (assert (equal (current-buffer) (or* "" (current-buffer))))
  (grok-test (or*) (or))
  (grok-test (or* 0) (or (or*-OK 0)))
  (grok-test (or* 1) (or (or*-OK 1)))
  (grok-test (or* .1) (or (or*-OK .1)))
  (grok-test (or* "" [] ?!) (or (or*-OK "") (or*-OK []) (or*-OK ?!)))
  )

(defmacro case-eval (expr &rest clauses)
  "(case-eval EXPR (KEYLIST BODY...)...): `case', but KEYLISTs are (eval)led.
EXPR is evaluated and compared against the value of each key in each KEYLIST;
the corresponding BODY is evaluated.  If no clause succeeds, returns nil.
One atom may be used in place of a KEYLIST of one atom.  A KEYLIST of `t'
matches if no other key has yet matched.  Key values are compared by `eq'."
  ;; ;? I'm still using eq only because I wasn't using CL when I first coded
  ;; this, & am recoding @ a point when I'm not sure yet whether I can
  ;; continue using CL.  Comparisons should be done with `eql', either CL's
  ;; or one I clone from CL.  But there's no `memql', <sigh>.
  ;;    ;? Yes there is, member*.
  ;; Also, I like the concept of just building a giant cond.  The (eval)s in
  ;; the defun below have namespace problems that are ineluctable as long as
  ;; this is a function instead of a macro.
  `(do-case-eval ,expr ',clauses))
(defun do-case-eval (EXPR CLAUSES)
  "Used to implement a Lumpen Lisp version of Common Lisp's (case)."
  (let ((CAR (car CLAUSES)))
    (when (consp CAR)
      (let* ((CAAR (car CAR))
             (values (if (atom CAAR)
                         (eval CAAR)
                       (mapcar 'eval CAAR))))
        (if (or (eq t values)
                (eq EXPR values)
                (and (consp values)
                     (memq EXPR values)))
            (eval (cons 'progn (cdr CAR)))
          (do-case-eval EXPR (cdr CLAUSES)))))))
(put 'case-eval 'lisp-indent-function 1)

(let ((one 1)
      (two 2)
      (x 1))
  (or (eq  10 (case      1 (1 10) (2 20)))           (error "case      00"))
  (or (eq  20 (case      2 (2 20) (1 10)))           (error "case      01"))
  (or (eq  10 (case      1 (1 10) (2 20) (t 30)))    (error "case      02"))
  (or (eq  30 (case      3 (1 10) (2 20) (t 30)))    (error "case      03"))
  (or (eq  10 (case      x (1 10) (2 20)))           (error "case      04"))
  (or (eq  10 (case      x (2 20) (1 10)))           (error "case      05"))
  (or (eq  10 (case      x (1 10)))                  (error "case      06"))
  (or (eq nil (case      x (2 20)))                  (error "case      07"))
  (or (eq  30 (case      x (t 30)))                  (error "case      08"))
  (or (eq  10 (case-eval 1 (1 10) (2 20)))           (error "case-eval 09"))
  (or (eq  20 (case-eval 2 (2 20) (1 10)))           (error "case-eval 10"))
  (or (eq  10 (case-eval 1 (1 10) (2 20) (t 30)))    (error "case-eval 11"))
  (or (eq  30 (case-eval 3 (1 10) (2 20) (t 30)))    (error "case-eval 12"))
  (or (eq  10 (case-eval x (1 10) (2 20)))           (error "case-eval 13"))
  (or (eq  10 (case-eval x (2 20) (1 10)))           (error "case-eval 14"))
  (or (eq  10 (case-eval x (1 10)))                  (error "case-eval 15"))
  (or (eq nil (case-eval x (2 20)))                  (error "case-eval 16"))
  (or (eq  30 (case-eval x (t 30)))                  (error "case-eval 17"))
  (or (eq  10 (case-eval 1 (one 10) (two 20)))       (error "case-eval 18"))
  (or (eq  10 (case-eval x (two 20) (one 10)))       (error "case-eval 19"))
  (or (eq  30 (case-eval x (two 20) ((one 666) 30))) (error "case-eval 20"))
  (or (eq  12 (case-eval x (666 0) ((one two) 12) (t t)))
                                                     (error "case-eval 21")))

;;;; ----------------------------- MAPPING ----------------------------- ;;;;

(or (fboundp 'mapc) (fset 'mapc 'mapcar))

;; This is considerably more efficient than ELisp's Common Lisp 'map:

(defun map-vector (f &rest rest)
  "Common Lisp (map vector F &rest REST)."
  (case (length rest)
    ((0 1) (map-1-vector f (car rest)))
    (2 (map-2-vectors f (car rest) (nth 1 rest)))
    (t (apply 'map-n-vectors f rest))))

;; map-n-vectors is actually so efficient it'd take profiling or disassembly
;; to know whether it wouldn't just be better to use it as map-vector.

(defun map-1-vector (f x)
  "Common Lisp (map vector F X)."
  ;; Allows (callf2 map-1-vector '1+ v) to increment each element of vector v
  ;; by 1, or (callf2 map-1-vector (^ (e) (+ e x)) v) to do so by x.
  (let* ((length-result (length x))
         (result (make-vector length-result t))
         (i 0))
    (while (< i length-result)
      (aset result i (funcall f (elt x i)))
     (incf i))
    result))

(defun map-2-vectors (f x y)
  "Common Lisp (map vector F X Y)."
  (let* ((length-result (min (length x) (length y)))
         (result (make-vector length-result t))
         (i 0))
    (while (< i length-result)
      (aset result i (funcall f (elt x i) (elt y i)))
      (incf i))
    result))

(defun map-n-vectors (f &rest rest)
  "Common Lisp (map vector F &rest REST)."
  (let* ((length-result (min (mapcar 'length rest)))
         (result (make-vector length-result t))
         (i 0))
    (while (< i length-result)
      (aset result i (apply f (lmapcar v rest (elt v i))))
      (incf i))
    result))

;; All the mapwhatever functions are rendered uncomfortably verbose by the
;; verbosity of lambdas.

(defmacro mapcarX (&rest R)
  `(mapcar (lambda (X) ,@(subseq R 0 -1)) ,@(subseq R -1)))

(grok-test (mapcarX (aref X 2) vec) (mapcar (lambda (X) (aref X 2)) vec))

;; Of course that's not symbol-clash-safe, so the best I can do is hope 'X,
;; which in ELisp is distinct from 'x, doesn't get in the way.  <sigh>

;; I think mapcarX is obsoleted by lmapcar, below.  However, I sometimes
;; still find that mapcarX looks better just because the args are reversed;
;; see some uses below for autoloads.

;; The best strategy I've come up with is to complement every mapwhatever
;; with an lmapwhatever that has the lambda built in, benefiting from reduced
;; general verbosity.  Think of this as analogous to 'defun; purists didn't
;; like it because it obscured the functional nature of the language, but
;; it's more practical, & the functionality is all still there.

;; The form of the names "lmapwhatever" was chosen by elimination.  I didn't
;; want to use a verbose suffix like "-lambda" for the same reason 'defun
;; shouldn't have been named "define-lambda".  I couldn't use an "l" suffix
;; to "mapwhatever" because "map" & "mapl" are both names of symbols for
;; Common Lisp mapping functions.  I wanted to keep "map" someplace in the
;; name for apropos purposes.  So it had to be an "l" prefix.

(defmacro lmapcar (var sequence &rest body)
  "Like mapcar, but with the lambda built in as an implicit trailing progn.
\(lmapcar x [1 2 3] (* 2 x)) => (mapcar (lambda (x) (* 2 x)) [1 2 3]).
lmapcar: (VAR SEQUENCE &rest BODY)"
  `(mapcar (lambda (,var) ,@body) ,sequence))
(put 'lmapcar 'lisp-indent-function 2)

(fset 'lmapc 'lmapcar)
(put  'lmapc 'lisp-indent-function 2)

(defmacro lmapconcat (var separator sequence &rest body)
  "Like mapconcat, but with the lambda built in.
lmapconcat: (VAR SEPARATOR SEQUENCE &rest BODY)"
  `(mapconcat (lambda (,var) ,@body) ,sequence ,separator))
(put 'lmapconcat 'lisp-indent-function 3)

;; What follows is not quite mapcar*, since it encapsulates & pivots
;; mapcar*'s sequences arg.  ("Pivots" is Excel-speak; APL-speak
;; would be "transposes".)

(defmacro multiple-value-lmapcar (symbols value-rows &rest actions)
  "Like lmapcar, but takes a sequence of symbols as the lambda's arg.

multiple-value-lmapcar: (SYMBOLS VALUE-ROWS &rest ACTIONS)

A sequence of rows of values for those symbols is iterated over,
doing a multiple-value-set of the current value row to the symbol sequence
as the first action of the implicit lambda that ends the form.

Example: (multiple-value-lmapcar [x y z]    ;That's the symbol sequence;
                                [(1 2 3)    ;that's the first value row;
                                 (4 5 6)]   ;that's the second value row;
            (incf x y)                      ;this is the implicit
            (* x y z))                      ;(lambda (x y z) ...).
The effect is to execute (lambda (x y z) (incf x y (* x y z)) first
on '(1 2 3), then on '(4 5 6), and return a list of the results."
  (let ((value-row (make-symbol "uninterned::value-row")))
    `(mapcar (lambda (,value-row)
               (multiple-value-set ,symbols ,value-row)
             ,@actions)
           ,value-rows)))
(put 'multiple-value-lmapcar 'lisp-indent-function 2)

(grok-test (multiple-value-lmapcar [x y z] [(1 2 3)
                                            (4 5 6)]
             (incf x y)
             (* x y z))
           (mapcar (lambda (uninterned::value-row)
                     (multiple-value-set [x y z] uninterned::value-row)
                     (setq x (+ x y))
                     (* x y z))
                   [(1 2 3)
                    (4 5 6)]))

(fset 'multiple-value-lmapc 'multiple-value-lmapcar)
(put  'multiple-value-lmapc 'lisp-indent-function 2)

;; The GNU 19.34 CL extensions use (gensym) with a random-# seed for the
;; symbol-name counter because writing then reading uninterned symbols in
;; some context involving byte compilation can intern them.  Of course,
;; (print)ing then (read)ing them in any context would do that.  It seems to
;; me this problem could be solved by having both a print syntax & a read
;; syntax for uninterned symbols, & there would be no difficulty defining
;; one.  It'd be more complicated to define such a syntax for symbols
;; interned in other obarrays than `obarray', but it could be done.

;;;; ---------------------------- ITERATION ---------------------------- ;;;;

;; Now define 8 iteration macros that allow forms like
;;   (upto i 0 9
;;     (self-insert-format " %d" i))
;; which expands to
;;   (let ((i 0))
;;     (while (<= i 9)
;;       (self-insert-format " %d" i)
;;       (setq i (1+ i))))
;; All 8 have Zipfean aliases intended for eval-expression minibuffer use,
;; so after M-: invoking eval-expression, a minibuffer entry of
;;   (u i 0 9 (f " %d" i))
;; would insert the integers 0 to 9, separated by spaces, into the buffer,
;; respecting things like overwrite-mode & auto-fill.

;; If the value against which i is tested for loop termination
;; is an expression, it shouldn't be evaluated each time, but
;; should be assigned to some variable.  The expansion of
;;   (upto i 0 (something)
;;     (self-insert-format " %d" i))
;; looks like this:
;;   (let* ((uninterned::upto (something))
;;          (i 0))
;;     (while (<= i uninterned::upto)
;;       (self-insert-format " %d" i)
;;       (setq i (1+ i))))
;; See the Info node elisp|Macros|Problems with Macros for why another symbol
;; needs to be introduced, & why it needs to be uninterned.  The key thing to
;; grasp when grokking uninterned symbols is that Lisp is not a WYSIWYG
;; language, & the assertion that the expansion "looks like this", though
;; true, is misleading, because it implies that (read)ing that expansion
;; would produce the correct definition.  It wouldn't; (read)ing
;; "uninterned::upto" produces an *interned* symbol.  The value of a macro
;; expansion in most other programming languages is a string to be parsed in
;; place of the macro call; but in Lisp-family languages, it isn't a string
;; to be (read) but a list to be (eval)led, & the atoms of the list are
;; already Lisp objects.  An uninterned symbol may have the same name as an
;; interned one, but it's isolated in its own solitary namespace; it's alone
;; in its own private parallel universe, like Dr. Crusher on that ST:TNG
;; episode where she was trapped in a warp bubble & all the crew kept
;; disappearing.  I feel like that sometimes.  This is the code:
;;   (defmacro upto (var from upto &rest body)
;;     (if (atom upto)
;;         `(let ((,var ,from))
;;            (while (<= ,var ,upto)
;;              ,@body
;;              (incf ,var)))
;;       (let ((ui-upto (make-symbol "uninterned::upto")))
;;         `(let* ((,ui-upto ,upto)
;;                 (,var ,from))
;;            (while (<= ,var ,ui-upto)
;;              ,@body
;;              (incf ,var))))))
;; The test for (atom upto) is effectively a test of whether upto is a
;; constant & so doesn't need to be saved in a specially-created variable.

;; Note how much hairier the defmacro is than the macro expansion.  I want
;; all the hair to be dealt with by logic executed when the macro is
;; expanded, so the expansion itself is as optimal as it would be if the loop
;; had been coded by hand.

;; Now, you may wonder, if that's the defmacro code, why put it in a comment;
;; why not put it in *code*?  Well, remember I said I wanted *eight*
;; iteration macros.  `below' is like `upto', but
;;   (below i 0 9
;;     (self-insert-format " %d" i))
;; would insert only the numbers below 9, i.e. up to 8; it's exclusive of the
;; high boundary.  The only difference between the `below' macro & the
;; `upto' macro is whether the termination test is done with <= or <.
;; `upto-by' & `below-by' are the same as `upto' & 'below', except they take
;; another arg specifying the amount by which to increment (which in `upto' &
;; 'below' is always 1).  Again, the difference between these macros & the
;; other two is minimal.  And these four macros all iterate upward from their
;; starting value, so there need to be a complementary four that iterate
;; downward.  (That's not just done with a negative increment amount because
;; in Common Lisp "loop language", the `by' value is always positive, even
;; for downward-counting loops.  Remember that the loop needs to know whether
;; it's iterating upward or downward in order to know whether the termination
;; test is for greater than or less than; if the sign of the increment amount
;; determined that, it would need to be tested at runtime, & I want all these
;; macros to be as efficient as hand-coded loops.)

;; Something like
;;   (lmapc symbol [upto below downto above]
;;     (eval `(defmacro ,symbol ...)))
;; would be a start, but each of those symbols needs the corresponding
;; comparison operator paired with it.  This does that:
;;   (multiple-value-lmapc
;;       [    symbol    comparison    ]
;;       [[   upto      <=            ]
;;        [   below     <             ]
;;        [   downto    >=            ]
;;        [   above     >             ]]
;;     (eval `(defmacro ,symbol ...)))
;; The first 2 args to multiple-value-lmapc are vectors, & the second of
;; those vectors is a vector of vectors of the 2 values that the 2 symbols
;; are supposed to have.  So that runs the (eval) 4 times, the first time
;; with 'symbol bound to 'upto & comparison bound to '<=, the second with
;; 'symbol bound to 'below & comparison bound to '<, etc.

;; Now for each of those 4 macros, we need a corresponding -by macro in which
;; symbol as defined above is just the grammatical root of the macro symbol.
;;   (multiple-value-lmapc
;;       [    root      comparison    ]
;;       [[   upto      <=            ]
;;        [   below     <             ]
;;        [   downto    >=            ]
;;        [   above     >             ]]
;;     (lmapc symbol
;;         (list root
;;               (intern (concat (symbol-name root) "-by")))
;;       (eval `(defmacro ,symbol ...))
;; would run the (eval) 8 times, since the lmapc iterates over a 2-element
;; list of values of symbol built from each of the 4 possible roots.

;; The actual code needs some more columns of data to build the macros, so
;; the inner lmapc becomes another multiple-value-lmapc.  At that point
;; directly building the list as a Lisp object becomes syntactically
;; difficult, so it turns out to be easier to build a string & (read) it.
;; Note that this would cause a problem if I tried to (read) the name of an
;; uninterned symbol, but I don't; I only (read) the code that creates one.

(multiple-value-lmapc
    [    root      comparison    inc/dec   ]
    [[   upto      <=            incf      ]
     [   below     <             incf      ]
     [   downto    >=            decf      ]
     [   above     >             decf      ]]
  (multiple-value-lmapc
      [macro
       by
       comma-by
       atom-test
       make-ui-by
       let-ui-by
       comma-ui-by
       n-args-before-body
       ]
      (list (list root
                  ""
                  ""
                  (format "(atom %S)" root)
                  ""
                  ""
                  ""
                  3
                  )
            (list (read (concat (symbol-name root) "-by"))
                  " by"
                  " ,by"
                  (format "(and (atom %S) (atom by))" root)
                  "\n          (ui-by (make-symbol \"uninterned::by\"))"
                  "\n              (,ui-by ,by)"
                  " ,ui-by"
                  4
                  ))
    (let* ((defmacro (format "
\(defmacro %S (var from %S%s &rest body) ;LOOK ------>-------->------>----+
  (if %s                                                                  ;
      `(let ((,var ,from))                                                ;
         (while (%S ,var ,%S)                                             ;
           ,@body                                                         ;
           (%S ,var%s)))                                                  ;
    (let ((ui-%S (make-symbol \"uninterned::%S\"))%s)                     ;
      `(let* ((,ui-%S ,%S)%s                                              ;
              (,var ,from))                                               ;
         (while (<= ,var ,ui-%S)                                          ;
           ,@body                                                         ;
           (%S ,var%s))))))"                                              ;
                             macro root by ; <------;(defmacro %S <-------+
                             atom-test              ; (if %s
                             comparison root        ;     (while
                             inc/dec comma-by       ;(%S ,var%s)
                             root root make-ui-by   ;   (let ((ui-%S
                             root root let-ui-by    ;    `(let* ((,ui-%S
                             root                   ;     (while
                             inc/dec comma-ui-by    ;       (%S ,var%s)
                             )))
      ;; Now that definition is (read)able, but I want to display a message
      ;; showing what was defined, for which I need to remove the comments:
      (when uncommon-lisp-verbose-load
        (while (string-match " *;.*$" defmacro)
          (callf4 replace-match "" t t defmacro))
        (message "%s" defmacro))
      (put (eval (read defmacro)) 'lisp-indent-function n-args-before-body))))

(progn
  (grok-test (upto i 0 9
               (ignore i))
             (let ((i 0))
               (while (<= i 9)
                 (ignore i)
                 (setq i (1+ i)))))

  (grok-test (upto-by i 0 9 2
               (ignore i))
             (let ((i 0))
               (while (<= i 9)
                 (ignore i)
                 (setq i (+ i 2)))))

  (grok-test (upto i 0 (something)
               (ignore i))
             (let* ((uninterned::upto (something))
                    (i 0))
               (while (<= i uninterned::upto)
                 (ignore i)
                 (setq i (1+ i)))))

  (grok-test (upto-by i 0 (something) 2
               (ignore i))
             (let* ((uninterned::upto (something))
                    (uninterned::by 2)
                    (i 0))
               (while (<= i uninterned::upto)
                 (ignore i)
                 (setq i (+ i uninterned::by)))))
  )

;; The only reason for having while-progn is the indentation:

(defmacro while-progn (&rest actions)
  "(while-progn ACTIONS) => (while (progn ACTIONS))."
  `(while (progn ,@actions)))
(put 'while-progn 'lisp-indent-function 0)

;; I'd rather have an indenter smart enough to consider "(while(progn" to be
;; different from "(while (progn", & to indent according to the first sexp.

;;;; ----------------------- SEQUENCES: GENERAL ------------------------ ;;;;

;; Sometimes when doing assignments to variables clarity is improved by
;; having the names of symbols whose values are set left of the values in the
;; expressions; this facilitates a columnar arrangement of multiple such
;; assignments.  'push is useful for prepending values to existing Emacs
;; lists, but the list symbol goes on the right, & in my collection of Emacs
;; variable customizations, I want it on the left, so:

(defmacro hsup (symbol new-value)
  "Like `push' but args are reversed."
  `(push ,new-value ,symbol))

(grok-test (push '(key . x) alist) (setq alist (cons '(key . x) alist)))
(grok-test (hsup alist '(key . x)) (setq alist (cons '(key . x) alist)))

;; Interestingly,
;;   (defsubst hsup (symbol new-value)
;;     (push new-value symbol))
;; seemed to fail in GNU Emacs 19.34.1 + Windows 95 OSR2; *during* the load
;; of dotemacs.el, hsup was a NOP (as it would be if the args were not in
;; fact reversed), whereas after the load was completed, in *scratch*, hsup
;; worked correctly.  I reloaded twice to verify this.  Switching hsup to a
;; macro caused it to work during the load.  This problem occurred while
;; Uncommon Lisp was the header of my dotemacs.el, not after it became a
;; separate package.  The OS may be relevant to Elvis sightings like this;
;; I've had users of {filemenu,vi-dot}.el report that wellformed macros that
;; worked fine in GNU Emacs 19.34.1 + Windows 95 OSR2, GNU Emacs 19.34.6 +
;; Windows NT Server 4.0, GNU Emacs 19.34.6 + Windows NT Workstation 4.0,
;; GNU Emacs 19.34 + SunOS 4.1.4, & 19.34.1 + "Sun Solaris" (no further data
;; given), failed in GNU Emacs 19.34.1 + Redhat Linux 4.2.
;; I think it's Elvis, because what could the OS have to do with expanding
;; *macros*?  Something might be wrong with some Redhat distribution.
;; E-Mail from Steffen Ries <steffen@cyberus.ca> says 'upto failed but
;; doesn't say what OS he was running under.
;; E-Mail from Julien Oster <j.oster@gmx.net> saying jiggle.el "doesn't work
;; under XEmacs 20.4" also didn't.

(defmacro wenhsup (symbol new-value)
  "Like `pushnew' but args are reversed."
  `(pushnew ,new-value ,symbol))

;; (apply 'or (mapcar some-predicate some-list)) fails, but apply* works:

(defun apply* (special-form &rest args)
  "Call SPECIAL-FORM with remaining args, using last arg as list of args.
Then return the value SPECIAL-FORM returns.
Thus, (apply* 'progn 1 2 '(3 4)) returns 4.

SPECIAL-FORM is applied as if it were a function, so although
\(or t (foo)) doesn't evaluate (foo), (apply* 'or t (foo) nil) does.
If the value of SPECIAL-FORM actually is a normal function, `apply*' works
just like `apply', but `apply' is more efficient.

`apply*' can be useful on the result of a mapcar.  If the mapped function is
a primitive, as is `mapcar', then using `apply*' on the result might actually
be the most efficient computational strategy.  However, if the mapped
function is a lambda and you want to apply a boolean operator to the results,
consider using `throw' inside the lambda instead, effectively achieving the
same short-circuiting that the boolean special forms provide."
  (let ((args (nreverse args)))
    (eval (cons special-form
                (lmapcar x (nreverse (nconc (nreverse (car args)) (cdr args)))
                  (list 'quote x))))))

(assert (eq (apply* 'progn 1 2 '(3 4)) 4))
(assert (eq (apply* 'progn '(5 6 7 8)) 8))
(assert (not (apply* 'or (mapcar 'null [t t t t]))))
(assert (apply* 'or (mapcar 'null [t t t nil])))

(defun nreverse* (sequence)
  "Destructively reverse SEQUENCE, which need not be a list.
Return the reversed sequence.  If SEQUENCE isn't one, just return it."
  (if (listp sequence)
      (nreverse sequence)
    (when (sequencep sequence)
        (loop for low from 0
              for high downfrom (1- (length sequence))
              while (< low high)
              do (rotatef (elt sequence low) (elt sequence high))))
    sequence))
(byte-compile 'nreverse*)

(assert (equal (nreverse* "abcde") "edcba"))
(assert (equal (nreverse* [a b c d]) [d c b a]))
(assert (equal (nreverse* "a") "a"))
(assert (equal (nreverse* "") ""))
(assert (equal (nreverse* []) []))
(assert (eq (nreverse* 'nreverse*) 'nreverse*))

(defun mid (sequence from &optional to)
  "Return (subseq SEQ FROM &optional TO) safely.
`mid' is like `subseq', but always adjusts out-of-range args so no
error is returned; (mid \"guggle\" 1 666) => \"uggle\".
`left' & `right' are analogous."
  ;? Still wrong: (subseq "gulk"  -1 0)
  (let ((length (length sequence))
        (reverse 'identity))
    (loop for symbol in '(from to)
          as value = (eval symbol)
          if (and value (> (abs value) length))
          do (set symbol (* (signum value) length)))
    (when (and to (> from to))
      (rotatef from to)
      (setq reverse (symbol-function 'nreverse*)))
    (funcall reverse (subseq sequence from to))))
(byte-compile 'mid)

(assert (equal (mid "guggle" 1 666) "uggle"))
(assert (equal (mid "guggle" 666 1) "elggu"))

(defsubst left (sequence howmany)
  "Return SEQUENCE's leftmost HOWMANY elements."
  (mid sequence 0 howmany))
(byte-compile 'left)

(assert (equal (left "guggle" 3) "gug"))
(assert (equal (left "guggle" 0) ""))
(assert (equal (left "guggle" 666) "guggle"))

(defun right (sequence from)
  "Return the portion of SEQUENCE beginning with the FROMth element."
  (mid sequence from (length sequence)))
(byte-compile 'right)

(assert (equal (right "guggle" 2) "ggle"))
(assert (equal (right "guggle" -2) "le"))

(assert (equal (left "glork" 3) "glo"))
(assert (equal (right "glork" 3) "rk"))
(assert (equal (right "glork" -3) "ork"))

(defmacro tailpush (new-value symbol)
  "Push NEW-VALUE onto (cdr SYMBOL); SYMBOL's value is (head . tail) or nil.
The standard Lisp idiom for list building is to build it back to front
then nreverse it.  Tailpush allows building a singly-linked list from front
to back by keeping track of the tail pointer.  Only one symbol is used; its
value's car points to the head of the list & the cdr points to the tail.
Build the list from nil with a series of (tailpush NEW-VALUE SYMBOL)s, then
access its value with (car SYMBOL) or its elements with (pop (car SYMBOL))."
  `(if ,symbol
       (setcdr ,symbol (cdr (nconc (cdr ,symbol) (list ,new-value))))
     (let ((tailpush (list ,new-value)))
       (setq ,symbol (cons tailpush tailpush)))))

(defmacro pop-car (symbol)
  "Like Common Lisp (pop (car SYMBOL)).
This can be used as a complement to tailpush, but the name shouldn't be
symmetrical, because pop-car doesn't care what's in the cdr, whereas tailpush
treats the whole cons cell as a single object storing head & tail pointers."
  `(prog1 (car (car ,symbol)) (setcar ,symbol (cdr (car ,symbol)))))

(let (x)
  (tailpush 1 x)
  (tailpush 2 x)
  (tailpush 3 x)
  (tailpush 4 x)
  (tailpush 5 x)
  (or (equal (car x) '(1 2 3 4 5))
      (error "Test of tailpush failed: %S" (car x)))
  (or (= (pop-car x) 1) (error "pop-car failed: 1"))
  (or (= (pop-car x) 2) (error "pop-car failed: 2"))
  (or (= (pop-car x) 3) (error "pop-car failed: 3"))
  (or (= (pop-car x) 4) (error "pop-car failed: 4"))
  (or (= (pop-car x) 5) (error "pop-car failed: 5")))

(let (x)
  (upto i 1 5
    (tailpush i x))
  (or (equal (car x) '(1 2 3 4 5))
      (error "Test #1 of upto+tailpush failed: %S" (car x))))

(let (x)
  (upto i 1 (+ 3 2)
    (tailpush i x))
  (or (equal (car x) '(1 2 3 4 5))
      (error "Test #2 of upto+tailpush failed: %S" (car x))))

;; Selecting & catenating multiple substrings of a string is also a way of
;; excluding unwanted parts of it.  This function does that for strings,
;; vectors, & lists:

(defun subseqs (s &rest r)
  "(apply 'subseq S (subseq R {0 2,2 4,etc})) & combine the results."
  (funcall (etypecase s
             (string 'concat)
             ((or cons symbol) 'nconc) ;(eq (type-of ()) 'symbol)
             (vector 'vconcat))
           (apply 'subseq s (subseq r 0 2))
           (if (callf2 nthcdr 2 r) (apply 'subseqs s r))))

(assert (equal (subseqs "0123456789" 0 3 5) "01256789"))

;; This is most useful when the sequence is a string:

(defmacro popseq (symbol i)
  "Return (subseq SYMBOL 0 INDEX) but set SYMBOL to what's left."
  `(prog1 (subseq ,symbol 0 ,i) (callf subseq ,symbol ,i)))

(grok-test (popseq s 5) (prog1 (subseq s 0 5) (setq s (subseq s 5))))

(defun split (separator expr &optional limit omit-separators)
  "On SEPARATOR split EXPR up to LIMIT times, as in Perl.
If SEPARATOR is a string, it's construed as a regexp; as in Perl, if it
contains parenthesized expressions, these become elements of the returned
list, so (split \"\\\\([,-]\\\\)\", \"1-10,20\") => (\"1\", \"-\", \"10\", \",\", \"20\")
whereas (split \"[,-]\", \"1-10,20\") => (\"1\", \"10\", \"20\").
Optional fourth arg OMIT-SEPARATORS suppresses that effect.
Extending Perl, SEPARATOR can also be an integer, in which case EXPR can be
any sequence, not just a string; then EXPR becomes a list of LIMIT
subsequences of length SEPARATOR followed by any elements that weren't
in those subsequences."
  (if (stringp separator)
      (wm-split-string separator expr limit omit-separators)
    (if (or (eq limit 0) ;not zerop because limit may be nil
            (>= separator (length expr)))
        (list expr)
      (if limit (decf limit))
      (cons (subseq expr 0 separator)
            (split separator (subseq expr separator) limit)))))

;; ;? I don't like that spec.  It's faithful to Perl, but to a fault; the
;; Perl spec is tolerable only because Perl regexps have a way of denoting
;; grouping without denoting substring-matching.  Instead of omit-separators,
;; there should be an include-separators arg that can be a wholenum to denote
;; the highest level of match to be included, or t to include all.  The
;; default should be to always omit them so you don't need to worry about
;; them if you complexify your regexp with grouping.  Note that the actual
;; implementation of the spec in the 'split docstring is in 'wm-split-string.

(defun split-region (&optional separator)
  "Return the current region as a list of SEPARATOR-separated strings.
By default SEPARATOR is a newline, causing return of a list of lines."
  (split (or separator "\n")
         (buffer-substring (region-beginning) (region-end))))

;;;; ----------------------- SEQUENCES: STRINGS ------------------------ ;;;;

;; ;? Info says elisp now has a built-in split-string.  Investigate.

(defun wm-split-string (separator string &optional limit omit-separators)
  "On SEPARATOR split STRING up to LIMIT times, as in Perl."
  (if (string-match separator "") ;special case, as in Perl
      (if limit
          (split 1 string limit)
        (mapcar 'char-to-string string))
    (let (result i)
      (while (and (or (null limit)
                      (wholenump (decf limit)))
                  (string-match separator string))
        (push (substring string 0 (match-beginning 0)) result)
        (when (not omit-separators)
          (setq i 1)
          (while (match-end i)
            (push (match-string i string) result)
            (incf i)))
        (callf substring string (match-end 0)))
      (push string result)
      (nreverse result))))

;; The following specification is particularly convenient, has analogies to
;; Perl, & the list unfolding makes it sufficiently different from
;; (mapconcat LIST SEPARATOR) to justify its existence.

(defun join (separator &rest rest)
  "(join \"|\" '(\"a\" \"b\") \"c\" '(\"d\" \"e\")) => \"a|b|c|d|e\".
Only one level of list unfolding is done."
  (let ((car (pop rest)))
    (concat (if (atom car)
                car
              (mapconcat 'identity car separator))
            (when rest
              (concat separator
                      (apply 'join separator rest))))))

;; Common Lisp has (string-{,left-,right-}trim CHARACTER-BAG STRING), but
;; ELisp CL 19.34.1 doesn't.  The character bag is any sequence containing
;; chars, so these are considerably more efficient.

(defun ltrim (string &optional what-to-trim)
  "Return STRING with any whitespace trimmed from the left.
If WHAT-TO-TRIM is non-nil, use the chars in it instead of whitespace."
  (if (string-match (format "\\`[%s]+" (or what-to-trim "\t ")) string)
      (substring string (match-end 0))
    string))

(defun rtrim (string &optional what-to-trim)
  "Return STRING with any whitespace trimmed from the right.
If WHAT-TO-TRIM is non-nil, use the chars in it instead of whitespace."
  (if (string-match (format "\\`[%s]+" (or what-to-trim "\t ")) string)
      (substring string 0 (match-beginning 0))
    string))

(defsubst trim (string &optional what-to-trim)
  "Return STRING with any whitespace trimmed from the left & right.
If WHAT-TO-TRIM is non-nil, use the chars in it instead of whitespace."
  (ltrim (rtrim string what-to-trim) what-to-trim))

;;;; ----------------------------- BUFFERS ----------------------------- ;;;;

(defun join-following-line ()
  (interactive)
  (save-syntax
    (M c ",'" (modify-syntax-entry c "."))
    (forward-line 1)
    (when (not (eobp))
      (let* ((eol (save-excursion (end-of-line) (dot)))
             ;; I suspect sentence-end-p is not always right:
             (sentence-end-p (save-excursion
                               (skip-chars-backward "\r\n\f\t .?!])}'\"")
                               (looking-at sentence-end)))
             (fill-prefix (or fill-prefix (fill-context-prefix (dot) eol))))
        (delete-indentation)
        (when sentence-end-p
          (insert " "))))))

(defun auto-fill-this-line ()
  (interactive)
  (join-following-line)
  (end-of-line)
  (do-auto-fill))

(defun auto-fill-this-line-within-paragraph ()
  (interactive)
  (if (and (not (save-excursion
                  (forward-line 0)
                  (looking-at paragraph-separate)))
           (not (save-excursion
                  (forward-line 1)
                  (looking-at paragraph-start))))
      (auto-fill-this-line)
    (forward-line 1)))

(defun self-insert-char (char)
  "Insert CHAR respecting things like overwrite mode & auto-fill."
  (or (numberp char) (error "self-insert-char: arg %S not a #" char))
  (let ((last-command-char char))
    (self-insert-command 1)))

(defun self-insert-string (string)
  "Insert STRING respecting things like overwrite mode & auto-fill."
  (mapc 'self-insert-char string))

;; self-insert-format expects to be used as a Zipfean alias
;; in the (eval-expression) minibuffer, for doing things like
;; inserting sequences of integers.

(defun self-insert-format (format &rest exprs)
  "Self-insert each character of (format FORMAT &rest EXPRS)."
  (self-insert-string (apply 'format format exprs)))

(defun tabs-default (&rest stops)
  "An arg of 3 sets tab stops every 3 chars; 3 6 8 sets to 3 6 8 10 12 etc.
Changes the default value for all buffers; there may also be a local value."
  (interactive "sTab stops (eg 3 for every 3 chars; 5 7 for 5 7 9 etc): ")
  (setq-default tab-stop-list (tabs-internal stops)))

(defun tabs-local (&rest stops)
  "An arg of 3 sets tab stops every 3 chars; 3 6 8 sets to 3 6 8 10 12 etc.
Makes the tab stops local to the buffer."
  (interactive "sTab stops (eg 3 for every 3 chars; 5 7 for 5 7 9 etc): ")
  (set (make-local-variable 'tab-stop-list) (tabs-internal stops)))

(defun tabs-whatever (&rest stops)
  "An arg of 3 sets tab stops every 3 chars; 3 6 8 sets to 3 6 8 10 12 etc.
Doesn't affect whether tab-stop-list is local to the buffer."
  (interactive "sTab stops (eg 3 for every 3 chars; 5 7 for 5 7 9 etc): ")
  (setq tab-stop-list (tabs-internal stops)))

(defun tabs-internal (stops)
  "Internal function used by (tabs), (tabs-default), etc."

  ;; Those functions are (interactive "sTab stops [...]: "), but are also
  ;; intended to be callable from ELisp here.  If we were invoked
  ;; interactively, stops is a list containing 1 string; if from ELisp, the
  ;; code was something like "(tabs 4 6)" & stops is a list of numbers.  If
  ;; it's of 1 string, we need to convert it to a numeric list.  I don't need
  ;; this to be idiot-proof, so we can just let Lisp do the parsing.

  (or (listp stops) (error "tabs: failure 1"))
  (or (car stops) (error "tabs: arg must not be empty"))
  (if (stringp (car stops)) (setq stops (read (concat "(" (car stops) ")"))))
  (or (= (car stops) 0) (hsup stops 0))
  (or (cdr stops) (error "tabs: failure 2"))

  (let ((crawl stops) interval)
    (while (cdr crawl)
      (setq interval (- (elt crawl 1) (car crawl))
            crawl (cdr crawl)))
    (or (> interval 0) (error "tabs: failure 3"))
    (while (< (car crawl) 128)
      (nconc crawl (list (+ (car crawl) interval)))
      (callf cdr crawl)))
  (cdr stops))

(defalias 'tabs 'tabs-local)

(defmacro save-syntax (&rest body)
  "Save (syntax-table), execute BODY, restore (syntax-table)."
  (let ((table (gensym "UL")))
    `(let ((,table (syntax-table)))
       (unwind-protect
           (progn ,@body)
         (set-syntax-table ,table)))))
(put 'save-syntax 'lisp-indent-function 0)

;;;; ---------------------------- BINDINGS ----------------------------- ;;;;

;; I find standard Emacs Lisp too verbose for my constant key remappings.
;; Here's an example:
;;   (global-set-key "\C-a"
;;                   (lambda (P)
;;                     (interactive "P")
;;                     (if P (beginning-of-buffer) (beginning-of-line))))
;; The global-set-key-to-interactive-lambda macro below, aka 'K, makes that
;;   (K "\C-a" "P" (P) (if P (beginning-of-buffer) (beginning-of-line)))
;; which is worth the obscurity in private code like this.

(defmacro interactive-lambda (argstring &rest list)
  "(I \"p\" (p) (woo-hoo p)) => (^ (p) (interactive \"p\") (woo-hoo p))
       (I \"\" (woo-hoo)) => (^ () (interactive \"\") (woo-hoo))"
  ;; The indentation in the documentation string is so the "=>"s line up
  (if (equal argstring "")
      `(lambda () (interactive) ,@list)
    `(lambda ,(car list) (interactive ,argstring) ,@(cdr list))))

(defmacro global-set-key-to-interactive-lambda (key argstring &rest list)
  `(global-set-key ,key (interactive-lambda ,argstring ,@list)))

(defmacro add-lambda-to-hook (hook &rest lambda)
  "(A some-hook (do-this)) => (add-hook 'some-hook (^ () (do-this)))"
  `(add-hook ',hook (lambda () ,@lambda)))

(defun multiple-actions-for-multiple-taps-on (key-sequence actions)
  (if (stringp key-sequence) (callf read-kbd-macro key-sequence))
  (let (keys)
    (while-progn
      (eval (car actions))
      (callf cdr actions)
      (setq keys (read-key-sequence nil))
      (and (equal keys key-sequence)
           actions))
    (setq unread-command-events (listify-key-sequence keys))))
(put 'multiple-actions-for-multiple-taps-on 'lisp-indent-function 'defun)

;; Most uses of 'push-mark-first-time-then are because I often miss my target
;; when I put my left thumb on <LeftAlt> on a PC keyboard to try to type
;; M-[tcvb]; 'push-mark-first-time-then lets me recover position with C-u SPC.

(defun push-mark-first-time-then (command)
  "Interactively call COMMAND but first (push-mark) unless repeating command.
For example, a series of (push-mark-first-time-then 'backward-page) calls
will leave a mark where (backward-page) was first called.

Example: (K \"\\M-v\" \"\" (push-mark-first-time-then 'scroll-down))"
  ;; ;? This interacted badly with my binding of M-b to
  ;; (I "" (push-mark-first-time-then 'c-backward-into-nomenclature))
  ;; combined with my binding of C-c M-b to
  ;; (mark-whole-word-backward), because the idea of m-w-w-b is that it sets
  ;; the mark (@ a location other than (dot)); but then this binding sets a
  ;; different mark.  m-w-w-b could be changed to eat subsequent input, & the
  ;; resulting key bindings could be more convenient.  Or whole-word marking
  ;; could be a command on its own.  I worked around the problem by
  ;; hardwiring the definition of (mark-whole-word-backward) to know that M-b
  ;; is pseudo-bound to 'c-backward-into-nomenclature; it can't check with
  ;; (key-binding) because that returns the 'push-mark-first-time-then ^.
  (interactive "CCommand: ")
  (or (eq last-command command)
      (push-mark))
  (setq prefix-arg current-prefix-arg
        this-command command)
  (call-interactively command))

;;;; --------------------------- PROGRAMMING --------------------------- ;;;;

(defmacro deny (form &optional show-args string &rest args)
  "Like `assert' but the ASSERTION is required to be false.
Verify that FORM returns nil; signal an error if not.
Second arg SHOW-ARGS means to include arguments of FORM in message.
Other args STRING and ARGS... are arguments to be passed to `error'.
They are not evaluated unless the denial fails.  If STRING is
omitted, a default message listing FORM itself is used."
  ;; The simpler strategy
  ;;   (defmacro deny (assertion &rest rest)
  ;;     "Like `assert' but the ASSERTION is required to be false."
  ;;     `(assert (not ,assertion) ,@rest))
  ;; fails because #'assert uses code similar to the mapcar below to extract
  ;; the constants for the args, & using #'not causes the entire expression
  ;; to be a single arg.
  (and (or (not (cl-compiling-file))
           (< cl-optimize-speed 3)
           (= cl-optimize-safety 3))
       (let ((sargs (and show-args
                         (delq ()
                               (mapcar (lambda (x)
                                         (and (not (cl-const-expr-p x))
                                              x))
                                       (cdr form))))))
         `(and ,form
               ,(if string
                    `(error ,string ,(append sargs args))
                  `(signal 'cl-assertion-failed
                           (list ',form ,@sargs)))))))

(defmacro show (&rest r)
  "(show x y) displays the names & values of x & y in the echo area."
  ;; In re choice of name: real Common Lisp has a #'trace that turns on
  ;; tracing for a function.  The closest it has to this is #'describe, but
  ;; that only takes one arg, & prints much more information about the arg.
  (let (names formats values)
    (while r
      (let ((x (pop r)))
        (if (stringp x)
            (push x names)
          (push (format "%S" x) names)
          (push "%S" formats)
          (push x values))))
    `(message ,(concat (join " " (nreverse names))
                       (when (> (length values) 0) ": ")
                       (join " " formats))
              ,@(nreverse values))))

(defun interact-for (symbols histories defaults)
  "Read each element of SYMBOLS, which are interactive args, from minibuffer.
An ELisp vector is convenient for SYMBOLS since it's self-quoting: [foo bar].
HISTORIES is a format string showing how to make a symbol for the history
corresponding to the symbol for an arg.  DEFAULTS is a format string showing
how to make a symbol for either a function of no arguments returning the
default value for the arg, or a variable the value of which is that default.

Sample code:

    (defun foo (x y z)
      (interactive (interact-for [x y z]
                                 \"foo-history-%s\"
                                 \"foo-default-%s\"))
      (do-something-with x y z))
    (defvar foo-history-x ())
    (defvar foo-history-z ())
    (defun  foo-default-x () (some-interesting-function))
    (defvar foo-default-y \"some string that is of interest\")

Note that in that example, y has no history and z has no default."
  (mapcar
   (lambda (symbol)
     (let* ((name (symbol-name symbol))
            (history (intern-soft (format histories symbol)))
            (default-symbol (read (format defaults symbol)))
            (default-value (if (fboundp default-symbol)
                               (funcall default-symbol)
                             (if (boundp default-symbol)
                                 (symbol-value default-symbol))))
            (default-prompt (if default-value
                                (format " (default %s)" default-value)
                              ""))
            (prompt (concat (capitalize name) default-prompt ": "))
            (value (or* (read-from-minibuffer prompt
                                                  ()  ;no initial contents
                                                  ()  ;no special keymap
                                                  nil ;don't (read) the input
                                                  history)
                            default-value)))
       (when history
         (pushnew value (symbol-value history) :test 'equal))
       value))
   symbols))

;;;;; ********************* PERSONAL SHORTFINGER ********************** ;;;;;

;;;; ------------------------ CONFUSION ALIASES ------------------------ ;;;;

;; These are alternative names for functions that might otherwise fail to be
;; found using apropos because of counterintuitive names.

(defun current-frame ()
  "The canonical ELisp for this is `selected-frame'."
  (selected-frame))

(defun current-window ()
  "The canonical ELisp for this is `selected-window'."
  (selected-window))

(defun file-tail
  "The canonical ELisp for this is `file-name-nondirectory'."
  (file-name-nondirectory))

;;;; ------------------------- ZIPFEAN ALIASES ------------------------- ;;;;

;; Zipf was a linguist who formulated a law that the length of words tends to
;; be approximately inversely proportional to their frequency of use.

(loop
 for (alias full-name) in
 '(

   ;; Intended for use in dotemacs or *scratch* code:

   (!   setq)    ;mnemonic is Scheme `set!'; "!" = "modify"; setf is too slow
   (@   apply)   ;mnemonic is ,@ for splicing
   (^   lambda)  ;mnemonic is Greek capital lambda, like "^" but bigger
   (&   funcall) ;mnemonic is Perl "&" prefix
   (&!  callf)   ;combines funcall and setq
   (&!2 callf2)
   (&!4 callf4)
   (&!n callfn)
   (A   add-lambda-to-hook)
   (D   define-key)
   (G   global-set-key)
   (H   show)
   (I   interactive-lambda)
   (K   global-set-key-to-interactive-lambda)
   (L   local-set-key)
   (M   lmapcar)
   (MM  multiple-value-lmapcar)
   (P   grok-prettyprint)
   (RSB re-search-backward)
   (RSF re-search-forward)
   (SB  search-backward)
   (SD  setq-default)
   (SF  search-forward)

   ;; Intended for use in *scratch* code or the eval-expression minibuffer:

   (a   above)
   (ab  above-by)
   (b   below)
   (bb  below-by)
   (c   delete-char)
   (d   downto)
   (db  downto-by)
   (f   self-insert-format)
   (p   progn)
   (s   self-insert-string)
   (u   upto)
   (ub  upto-by)

   )
 do (fset alias (symbol-function full-name)))

;; (fset '^ 'lambda) behaves a little strangely.  It fails if (quote)d or
;; (function)ed, but works if evaluated, notwithstanding that documentation
;; says (lambda) can't be meaningfully evaluated.  Removing the indirection
;; with (fset '^ (symbol-function 'lambda)) doesn't seem to help.  This
;; probably has something to do with (lambda) being a macro that expands to
;; (function (lambda)).

;; Setq often fails with "Invalid function: #<subr setq>".  This only started
;; happening when I started always loading the byte compiler as part of
;; running dotemacs.  Preventing advice compilation by setting
;; ad-default-compilation-action had no effect.
;;??? Ummm, I was setting it to nil, not 'never.

;? Still needed?:
;?(defmacro ! (&rest args) "Alias for setq" (cons 'setq args))

(M s [^ M Mo MM a ab b bb d db p u ub]
  (put s 'lisp-indent-function 'defun))

;;;;; *************************** AUTOLOADS *************************** ;;;;;

(autoload 'abbrev-sort-mode "abbrev-sort" () t)

(M f [align
      align-regexp]
  (autoload f "align" () t))

(autoload 'all "all" "g/re/p using selective-display" t) ;fails?

(autoload 'artist-mode "artist" "Enter artist-mode" t)

(autoload 'asp-mode "asp"
  "Major mode for editing ASP files, derived from indented-text-mode."
  t)

(autoload 'calc-dispatch          "calc" "Calculator Options" t)
(autoload 'full-calc              "calc" "Full-screen Calculator" t)
(autoload 'full-calc-keypad       "calc" "Full-screen X Calculator" t)
(autoload 'calc-eval              "calc" "Use Calculator from Lisp")
(autoload 'defmath                "calc" nil t t)
(autoload 'calc                   "calc" "Calculator Mode" t)
(autoload 'quick-calc             "calc" "Quick Calculator" t)
(autoload 'calc-keypad            "calc" "X windows Calculator" t)
(autoload 'calc-embedded          "calc" "Use Calc from any buffer" t)
(autoload 'calc-embedded-activate "calc" "Activate =>'s in buffer" t)
(autoload 'calc-grab-region       "calc" "Grab region of Calc data" t)
(autoload 'calc-grab-rectangle    "calc" "Grab rectangle of data" t)

(M f [c-forward-into-nomenclature
      c-backward-into-nomenclature]
   (autoload f "cc-mode" nil t))

(autoload 'counter "counter" nil t)

(autoload 'cperl-mode "cperl-mode"
  "alternate mode for editing Perl programs" t)

(autoload 'email-mode "email" nil t)

(MM [f docstring]
  [[filemenu-mode
    "Major mode for picking a file to edit from a buffer offering a menu."]
   [filemenu
    "Load the file menu named by the variable filemenu-file-name."]]
  (autoload f "filemenu" docstring t))

(loop for f in '(fff-find-emacs-lisp-library
                 fff-insert-emacs-lisp-library
                 fff-locate-emacs-lisp-library
                 fff-find-loaded-emacs-lisp-function
                 fff-find-file-in-envvar-path
                 fff-insert-file-in-envvar-path
                 fff-find-file-in-exec-path
                 fff-insert-file-in-exec-path
                 fff-find-file-in-path
                 fff-insert-file-in-path
                 fff-find-file-in-locate-db
                 fff-insert-file-in-locate-database)
      do (autoload f "fff" nil t))

(mapcarX (autoload X "find-fun" nil t)
         [find-function
          find-function-do-it
          find-function-on-key
          find-function-read-function
          function-at-point
          ])

(loop for (f docstring) in
      '((ggrep-files
         "Search FILE for REGX.")
        (ggrep-matching-files
         "Search all files matching FILEREGX for SEARCHRX.")
        (ggrep-buffer
         "Search the current buffer for REGX from point-min to point-max.")
        (ggrep-region
         "Search the region for REGEXP.")
        (ggrep-list-of-strings
         "Return a list of strings in LIST which matched REGX.")
        (ggrep-info
         "Search for REGEXP in all subdirs of current info file."))
       do (autoload f "ggrep" docstring t))

(M f [grok
      grok-macroexpand
      grok-prettyprint
      grok-read-sexp-at-dot]
   (autoload f "grok" nil t))

(autoload 'hexl-follow-ascii "hexl-xtra.el"
  "Toggle following ASCII in Hexl buffers." t)

(autoload 'locate-function "loc-func"
  "Show the full path name of the loaded Emacs library that defines FUNCTION.

This command checks whether FUNCTION is autoloaded, or it searches the
elements of `load-history' to find the library; then calls `locate-library'
to find the file.  Optional second arg NOSUFFIX non-nil means don't add
suffixes `.elc' or `.el' to the specified name LIBRARY (a la calling `load'
instead of `load-library')."
  t)

(M f [Man-fontify-manpage
      Man-cleanup-manpage]
   (autoload f "man" "Interactively autoloaded from man.el." t))

(M f [picture-forward-column
      picture-move-up
      picture-move-down]
   (autoload f "picture" nil t))

(mapcarX (autoload X "timelog" nil t)
         [timelog-mode
          timelog-new-date
          timelog-new-time
          ])

;;;;; ***************** GENERALLY USEFUL DEFINITIONS ****************** ;;;;;

(defun backify-solidi-in (string)
  "For example, \"f:/oo\" becomes \"f:\\\\oo\" (i.e. `f:\\oo').
A solidus is the same thing as a virgule."
  (mapconcat (lambda (char)
               (char-to-string (if (= char ?/) ?\\ char)))
             string
             ""))

(defun beginning-of-word ()
  (unless (= (char-syntax (following-char)) ?w)
    (skip-syntax-backward "^w"))
  (skip-syntax-forward "w")
  (skip-syntax-backward "w"))

(defun byte-compile-directory (directory)
  (interactive "D")
  (byte-recompile-directory directory 0 t))

(defun count-words (start end)
  "Return number of words between START and END."
  ;; Idea by Sam Steingold <sds@usa.net>.
  ;; 'how-many is defined in replace.el & isn't particularly efficient.
  (or (<= start end) (error "Internal failure 98/02/26/4 21:56:37"))
  (save-excursion
    (goto-char start)
    (save-restriction
      (narrow-to-region start end)
      (string-to-number (how-many "\\<")))))

(defun count-stuff-region (start end)
  "Print number of characters, lines, & words in the region."
  ;; This can be slow enough to justify providing intermediate messages
  (interactive "r")
  (let ((chars (- end start)))
    (message "Region chars %d, ..." chars)
    (let ((lines (count-lines start end)));in simple.el
      (message "Region chars %d, lines %d, ..." chars lines)
      (let ((words (count-words start end)))
        (message "Region chars %d, lines %d, words %d" chars lines words)))))

(defun decdate (&optional days date)
  "Subtract DAYS (default 1) from DATE (default (current-time))."
  (let ((decoded (decode-time (or date (current-time)))))
    (decf (nth 3 decoded) (or days 1))
    ;; Experimentation under 19.34.1 showed this worked for 0 Jan & 33 Jan.
    (apply 'encode-time decoded)))

(defun decminutes (&optional minutes time)
  "Subtract MINUTES (default 1) from TIME (default (current-time))."
  (let ((decoded (decode-time (or time (current-time)))))
    (decf (nth 1 decoded) (or minutes 1))
    ;; Experimentation under 19.34.1 showed this worked for 0 Jan & 33 Jan.
    (apply 'encode-time decoded)))

(defun decmonth (&optional months date)
  "Subtract MONTHS (default 1) from DATE (default (current-time))."
  ;; ;? Fails on 29 Mar, when it produces a date of 29 Feb that is then
  ;; converted to 1 Mar.  I haven't fixed it because I'm not sure what
  ;; functionality is best in that situation.
  ;; ;? (decmonth -1) fails on 31 Aug, returning Oct.
  (let ((decoded (decode-time (or date (current-time)))))
    (decf (nth 4 decoded) (or months 1))
    (apply 'encode-time decoded)))

(defun FindStr-in-*shell* (regexp &optional dir files switches)
  ;;? Make this (interactive) after figuring out how to cope with the
  ;;weirdness of "|" handling by Cmd.exe & FindStr.
  (! dir (backify-solidi-in (expand-file-name (or* dir "."))))
  (&! or* files    FindStr-in-*shell*-default-files)
  (&! or* switches FindStr-in-*shell*-default-switches)
  ;?(show dir)
  (shell)
  (goto-char (dot-max))
  (when (not (equal (backify-solidi-in (expand-file-name default-directory))
                    dir))
    (end-of-buffer)
    (insert (format "PushD %s" dir))
    (comint-send-input)
    (sit-for .1)
    (goto-char (dot-max)))
  (insert (format "FindStr %s %s %s"
                  (trim switches)
                  regexp
                  ;; That is seriously inadequate for things like /c:"", but
                  ;; it'll need to do for now; as it is I'm requiring by-hand
                  ;; quoting.  %S would metaquote undesirably.  Best is to
                  ;; allow unbashed "|"s, except those in char classes, to be
                  ;; construed as needing spacifying.  ... This is actually
                  ;; quite complicated, since quoting rules for Cmd.exe are
                  ;; neither documented nor rational.  And it's unimportant.
                  files))
  (comint-send-input))
(defvar FindStr-in-*shell*-history-regexp ())
(defvar FindStr-in-*shell*-history-dir ())
(defvar FindStr-in-*shell*-history-files ())
(defvar FindStr-in-*shell*-history-switches ())
(defun  FindStr-in-*shell*-default-dir ()
  (if (get-buffer "*shell*")
      (save-excursion
        (set-buffer "*shell*")
        default-directory)
    default-directory))
(defvar FindStr-in-*shell*-default-switches "/N /S /I")
(defvar FindStr-in-*shell*-default-files    "*.h *.c *.cpp")
;; The next one is a bit goofy: it's for an arg that FindStr-in-*shell*
;; doesn't take.  However, it's used by functions that delegate most
;; defaults back to FindStr-in-*shell* & that do have that arg.
(defun  FindStr-in-*shell*-default-word () (thing-at-point 'symbol))

(defun FindStr-word-in-*shell* (word &optional dir files switches)
  (interactive (interact-for [word dir files switches]
                             "FindStr-word-in-*shell*-history-%S"
                             "FindStr-in-*shell*-default-%S" ;sic: delegate
                             ))
  (FindStr-in-*shell* (concat "\"\\<" word "\\>\"") dir files switches))
(defvar FindStr-word-in-*shell*-history-word ())
(defvar FindStr-word-in-*shell*-history-dir ())
(defvar FindStr-word-in-*shell*-history-files ())
(defvar FindStr-word-in-*shell*-history-switches ())

(defun  FindStr-CMap-word-in-*shell* (c-map_word &optional switches)
  (interactive (interact-for [c-map_word switches]
                             "FindStr-CMap-word-in-*shell*-history-%S"
                             "FindStr-CMap-word-in-*shell*-default-%S"))
  (FindStr-in-*shell* (concat "\"\\<" c-map_word "\\>\"")
                      "R:\\Source\\CF95Charts\\"
                      "*.h *.c *.cpp"
                      switches
                      ))
(defvar FindStr-CMap-word-in-*shell*-history-c-map_word ())
(defvar FindStr-CMap-word-in-*shell*-history-switches ())
(defun  FindStr-CMap-word-in-*shell*-default-c-map_word ()
  (thing-at-point 'symbol))
(defvar FindStr-CMap-word-in-*shell*-default-switches "/N /I")

(defun  FindStr-Launcher-word-in-*shell* (Launcher_word &optional switches)
  (interactive (interact-for [Launcher_word switches]
                             "FindStr-Launcher-word-in-*shell*-history-%S"
                             "FindStr-Launcher-word-in-*shell*-default-%S"))
  (FindStr-in-*shell* (concat "\"\\<" Launcher_word "\\>\"")
                      ;? "R:\\Projects\\Launcher\\"
                      "\\MULDER\\ng\\Projects\\Launcher\\"
                      "*.h *.bat *.cpp *.tcl"
                      switches
                      ))
(defvar FindStr-Launcher-word-in-*shell*-history-Launcher_word ())
(defvar FindStr-Launcher-word-in-*shell*-history-switches ())
(defun  FindStr-Launcher-word-in-*shell*-default-Launcher_word ()
  (thing-at-point 'symbol))
(defvar FindStr-Launcher-word-in-*shell*-default-switches "/N /I /S")

(defun  FindStr-Tornado-word-in-*shell* (tornado_word &optional switches)
  (interactive (interact-for [tornado_word switches]
                             "FindStr-Tornado-word-in-*shell*-history-%S"
                             "FindStr-Tornado-word-in-*shell*-default-%S"))
  (FindStr-in-*shell* (concat "\"\\<" tornado_word "\\>\"")
                      (concat (getenv "WIND_BASE") "\\target\\")
                      "*.hpp *.h *.cpp *.c *.s"
                      switches
                      ))
(defvar FindStr-Tornado-word-in-*shell*-history-tornado_word ())
(defvar FindStr-Tornado-word-in-*shell*-history-switches ())
(defun  FindStr-Tornado-word-in-*shell*-default-tornado_word ()
  (thing-at-point 'symbol))
(defvar FindStr-Tornado-word-in-*shell*-default-switches "/N /S /I")

(defun FindStr-follow-hit ()
  "Assume point is on a line of NT `FindStr /N` output, & go there.
FindStr is Mordorsoft's spinoff of egrep.  On Windows it's far superior
to any egrep port I've tried as of Tu 23 Feb 99, since it doesn't expect the
shell to glob (which the default shells don't), doesn't need a pipe from
Unix `find', and allows for shells too stupid to be able to quote `|'.
The /N gets line numbers.  Output is formatted like this:
   bak\timelog.tlg:12114:from a floppy-booted VxWorks to Ethernet the kernel.
That starts with a relative path to the file (it'd've been absolute if the
search hadn't been invoked relative to the current dir), then has the line #.
This macro finds that file, loading a buffer iff necessary, then puts point
at the beginning of the numbered line in the new buffer.  It leaves point
where it was in the previous buffer so you can go back for the next line."
  ;; Somebody coded a findstr.el, but I didn't download it because it didn't
  ;; seem to meet my needs.  It wasn't jiggle-aware, for one thing, &
  ;; jiggle-awareness will probably become unnecessary when I recode
  ;; jiggle.el with a PostMessage()oid strategy instead of SendMessage()oid.
  (interactive)
  (let (file line)
    (save-excursion
      (beginning-of-line)
      (unless (looking-at "\\(\\([A-Za-z]:\\)?[^:]+\\):\\([0-9]+\\)")
        (error "Output of `FindStr /N' not recognized on this line."))
      ;; Must save match strings while in search buffer
      (! file (match-string 1)
         line (string-to-int (match-string 3)))
  ;(message "Goal: %s[%d]" file line)
  (let (jiggle-enabled)
    (find-file file))
  (goto-line line)
  (when jiggle-enabled
    (sit-for .001)
    (jiggle-cursor)))))

(defun hack-charset-netscape-to-oem-obsolete (start end)
  ;;;? This sucks.  It loses the functional strength of just hacking the
  ;;charset, which is elegant, by mushing it in with a rather unpleasant
  ;;query-replace-regexp that can't avoid giving the user a strange display
  ;;(narrowing) in order to limit its scope, then, in the event that no
  ;;matches were found, messages a baffling "Replaced 0 occurrences" even tho
  ;;it's quite possible some charset elements *were* querylessly replaced.
  ;;Not to be querulous, but this function should just do what its name
  ;;says, & there should be a different function for hacking sentence
  ;;endings.  All these obviously need key bindings (oh my aching nose).
  (interactive "r")
  (save-excursion
    (format-replace-strings '(
                              ;; Adding them to this table as I discover
                              ;; them; there's no documentation, of course;
                              ;; the "from" stuff is mostly codes that are
                              ;; undocumented in the official ANSI charset.
                              ("í" . "'")
                              ("†" . " ") ;sentence ending
                              ("Ö" . "...")
                              ("Ö" . "...")
                              ("ì" . "``")
                              ("î" . "''")
                              ("ï" . "˘")
                              ("ñ" . "-")
                              ("ó" . "--")
                              ("¸" . "Å")
                              ("È" . "Ç")
                              ("ß" . "")
                              )
                             nil
                             start
                             end)
    (save-restriction
      (narrow-to-region start end)
      (goto-char start)
      (query-replace-regexp "\\([])}.?!]+\\) \\([^ \t\n]\\)" "\\1  \\2"))))

;; OK, let's try again:

(defun hack-charset-netscape-to-oem (start end)
  (interactive "r")
  (save-excursion
    (format-replace-strings '(
                              ;; Adding them to this table as I discover
                              ;; them; there's no documentation, of course;
                              ;; the "from" stuff is mostly codes that are
                              ;; undocumented in the official ANSI charset.
                              ("í" . "'")
                              ("†" . " ") ;sentence ending
                              ("Ö" . "...")
                              ("Ö" . "...")
                              ("≠" . "-")
                              ("ì" . "``")
                              ("î" . "''")
                              ("ï" . "˘")
                              ("ñ" . "-")
                              ("ó" . "--")
                              ("¸" . "Å")
                              ("È" . "Ç")
                              ("ß" . "")
                              ("Æ" . "(R)")
                              ("∑" . "*")
                              )
                             nil
                             start
                             end)))

(defun hack-sentence-endings (start end)
  (interactive "r")
  (save-excursion
    (save-window-excursion
      (save-restriction
        (narrow-to-region start end);19 query-replace-regexp has no BOUND arg
        (goto-char start)
        (query-replace-regexp


         ;?"\\([])}.?!]+\\) \\([^ \t\n]\\)"
         ;?"\\1  \\2"

         "\\([.?!][]\"')}]*\\) \\([^ \t\n]\\)"
         "\\1  \\2"

         )))))

(defun hack-text-netscape (start end)
  (interactive "r")
  (hack-charset-netscape-to-oem start end)
  (hack-sentence-endings start end))

(defun wm-format-time-string (format &optional time)
  "Like format-time-string except that %a gives a 2-char abbreviation."
  ;; Under GNU 19.34 (format-time-string "%2a") returns "2a".
  (callf or time (current-time))
  (if (string-match "\\(\\`\\|[^%]\\|\\(%%\\)+\\)%a" format)
      (let ((i (match-end 0)))
        (concat (format-time-string (substring format 0 (- i 2)) time)
                (substring (format-time-string "%a" time) 0 2)
                (wm-format-time-string (substring format i) time)))
    (format-time-string format time)))

(defun generate-new-indirect-buffer-name (name)
  "Like the built-in generate-new-buffer-name, but prepending ampersands.
The mnemonic is that the address of a value, i.e. a pointer
\(C++ operator &()), is an indirect way of referencing the value."
  (&!2 concat "&" name)
  (if (get-buffer name) (generate-new-indirect-buffer-name name) name))

(defvar make-indirect-buffer-wrapper-history ()
  "Response history for command `make-indirect-buffer-wrapper'.")

(defun make-indirect-buffer-wrapper (P)
  "Invoke the primitive make-indirect-buffer with reasonable default args.
Switch to the indirect buffer; with prefix arg, do so in another window.
Select new major mode by file extension to avoid M-x long-name-mode."
  (interactive "P")
  (let* ((prompt "
Select new major mode by file name fragment to avoid M-x long-name-mode.
For example, the fragment \".el\" would probably select emacs-lisp-mode.
Prepend \"/\" to the fragment if `hack-local-variables' shouldn't be run
after the major mode is set.  Use \".\" alone to get fundamental-mode.
An interpreter name (e.g. \"tcl\" for a shebanged Unix script) also works.
File name fragment for major mode (default %s): ")
         (default (or (and (string-match "\\(\\.[^.|]+\\)\\(|\\|\\'\\)"
                                         ;that allows uniquify.el
                                         (buffer-name))
                           (match-string 1 (buffer-name)))
                      (buffer-name)))
         (response (grok-read-from-minibuffer
                    (format prompt default)
                    () () nil
                    'make-indirect-buffer-wrapper-history))
         (hack-local-variables t)
         new-major-mode)
    (when (zerop (length response))
      (! response default))
    (when (= (string-to-char response) ?/)
      (! hack-local-variables nil)
      (&! substring response 1))
    (! new-major-mode
       (or (if (equal response ".")
               'fundamental-mode)
           (loop for (regex . mode) in auto-mode-alist
                 if (string-match regex response)
                 return mode)
           (loop for (interpreter . mode) in interpreter-mode-alist
                 if (string= interpreter response)
                 return mode)
           (if (= (string-to-char response) ?\.)
               ;; At least it was an extension
               default-major-mode)
           (error "%S unrecognized as specifying a mode" response)))
    (& (if P 'switch-to-buffer-other-window 'switch-to-buffer)
       (make-indirect-buffer (current-buffer)
                             (generate-new-indirect-buffer-name
                              (buffer-name))))
    (& new-major-mode)
    (when hack-local-variables
      (hack-local-variables))))

(defun name-at-dot ()
  (save-excursion
    (or (not (zerop (skip-syntax-backward "_w")))
        (memq (char-syntax (following-char)) '(?w ?_))
        (forward-sexp -1))
    (skip-chars-forward "'")
    (let ((start (dot)))
      (and (plusp (skip-syntax-forward "_w"))
           (buffer-substring-no-properties start (dot))))))

(defun name-near-dot ()
  (let ((bol (save-excursion (beginning-of-line) (dot)))
        (eol (save-excursion (end-of-line) (dot))))
    (save-restriction
      (narrow-to-region bol eol)
      (or (name-at-dot)
          (save-excursion
            (skip-syntax-forward "^_w" eol)
            (name-at-dot))
          (save-excursion
            (skip-syntax-backward "^_w" bol)
            (name-at-dot))))))

;; What I'd really like there is a *generator*, so I could repeatedly call
;; (names-near-dot) & get names successively further away, until one was
;; satisfactory.  This would require something like an object.  Remember that
;; symbol plists aren't (let)table, but plist-{get,put} exist.

(defmacro* wm-progn-compiled (&body body)
  "Byte-compile (progn BODY), then return its value.

This was posted to Usenet by David Bakhash <cadet@mit.edu> on 18 Apr 1999.
He wrote:
   The fact is that some things in your ~/.emacs might actually
   take some time, and if those things were compiled, then they'd
   make initialization a bit quicker.  It's a neat little macro
   that is just like progn, except that whatever is inside is
   done at the speed that compiled code is done.  If you guys are
   like me, you don't want to byte-compile your .emacs files.
   It's just a pain.  This helps for people who like to use
   things like `loop', and other macros.  Just put the slow stuff
   inside the `progn-compiled' and get get a massive speed-up.
   Cool -- a macro that makes other macros go faster :-)
On a 233MHz Pentium II running Emacs 19.34.6 under Windows NT 4.0 SP3
with an obarray containing 11210 .. 11249 symbols, I (WM) tried it:
  (wm-time
    (message \"# of symbols: %d\" (loop for the symbols count t)))
takes 0.181 s if there's no garbage collection, 0.380ish s if there is;
  (wm-time
    (progn-compiled
      (message \"# of symbols: %d\" (loop for the symbols count t))))
always takes 0.060 s (I've never seen it garbage-collect)."
  (let ((fname (gensym)))
    `(progn
       (setf (symbol-function ',fname)
	     (function* (lambda ()
			  ,@body)))
       (byte-compile ',fname)
       (unwind-protect
	   (funcall ',fname)
	 (fmakunbound ',fname)))))
(put 'wm-progn-compiled 'lisp-indent-function 0)

(defun symbol-near-dot (&optional intern)
  (catch t (funcall (if intern 'intern 'intern-soft)
                    (or (name-near-dot) (throw t nil)))))

(defun object-near-dot (predicate)
  (let ((candidate (symbol-near-dot)))
    (if (funcall predicate candidate) candidate)))

(defun completing-read-object-near-dot (predicate prompt)
  (let* ((default (or (object-near-dot predicate)
                      (and (eq predicate 'fboundp)
                           (or (function-at-point)
                               (function-called-at-point)))))
         (response (completing-read
                    (if default
                        (format "%s (default %s): " prompt default)
                      (format "%s: " prompt))
                    obarray
                    predicate
                    t)))
    (list (if (equal response "")
              default
            (intern response)))))

(defun wm-rot13-string (string)
  "Return STRING rot13d."
  (mapconcat (lambda (c)
               (char-to-string (+ c (cond ((or (<=* ?a c ?m)
                                               (<=* ?A c ?M))
                                           13)
                                          ((or (<=* ?n c ?z)
                                               (<=* ?N c ?Z))
                                           -13)
                                          (t
                                           0)))))
             string
               ""))

(assert (equal (wm-rot13-string "Glirx(E)") "Tyvek(R)"))

(defmacro wm-rot13 (place)
  `(callf wm-rot13-string ,place))

(defun wm-rot13-region (start end)
  (interactive "r")
  (wm-rot13 (buffer-substring start end)))

(defun wm-recursively-synoptically-edit (top-file
                                         bottom-file
                                         &optional
                                         bury-buffer)
  "Recursively edit TOP-FILE and BOTTOM-FILE in separate windows.
After exiting with \\[exit-recursive-edit], return to previous buffer and
window configuration.  If BURY-BUFFER is non-nil, also bury both
visited buffers after exiting."
   (save-excursion
     (save-window-excursion
       (let (top-buffer
             bottom-buffer)
         (let ((enable-local-eval t)
               jiggle-enabled)
           (delete-other-windows)
           (find-file top-file)
           (! top-buffer (current-buffer))
           (find-file-other-window bottom-file)
           (! bottom-buffer (current-buffer)))
         (sit-for 0)
         (jiggle-cursor)
         (recursive-edit)
         (when bury-buffer
           (let (jiggle-enabled)
             (bury-buffer top-buffer)
             (bury-buffer bottom-buffer))))))
   (jiggle-cursor))

(defmacro wm-time (form &optional repeat action)
  "Do for ELisp what the Unix `time' command does for Unix commands.
Return the value of FORM, but display a message saying how long it took.
Evaluate FORM REPEAT times, default 1.  A third optional arg, ACTION, can
replace the display of the message: if non-nil, it's assumed to be a
function to which the elapsed seconds are passed as an arg before the
value of FORM is returned.  If REPEAT > 1, the returned value is that
of the final evaluation of FORM."
  (let ((value (gensym))
        (start-time (gensym)))
    (callf or action (lambda (seconds)
                       (message "Elapsed seconds: %.3f" seconds)))
    `(let* ((,start-time (current-time))
            (,value (loop repeat ,(or repeat 1) do ,form)))
       (funcall ,action (- (wm-time-to-seconds (current-time))
                           (wm-time-to-seconds ,start-time)))
       ,value)))
(put 'wm-time 'lisp-indent-function 0)

(defun wm-time-to-seconds (time)
  "Convert a value like that of (current-time) to a floating-point scalar."
  (let ((high (car time))
        (low (cadr time))
        (us (caddr time)))
    (+ (* high 65536.0)
       low
       (/ us 1000000.0))))

(defun untabify-buffer-weirdly (n)
  "Runs untabify with a user-specified tab-width.
The buffer's normal value of tab-width isn't changed."
  (interactive "nWeird tab width: ")
  (let ((tab-width n))
    (untabify (point-min) (point-max))))

(defun untabify-region-weirdly (n)
  "Runs untabify with a user-specified tab-width.
The buffer's normal value of tab-width isn't changed."
  (interactive "nWeird tab width: ")
  (let ((tab-width n))
    (call-interactively 'untabify)));interactive so affects region

(defun untabify-weirdly (P n)
  "Runs untabify with a user-specified tab-width.
With prefix arg, affects region; without, entire buffer.
The buffer's normal value of tab-width isn't changed."
  (interactive "P\nnWeird tab width: ")
  (let ((tab-width n))
    (if P
        (call-interactively 'untabify)
      (untabify (point-min) (point-max)))))

(defun what-os ()
  "Return symbol identifying the OS."
  ;; Idea by Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>.
  ;; The result here should be one of the following: 'Windows_95,
  ;; 'Windows_NT, 'X10_window, 'X11_window, 'Terminal_Unix, nil.
  (or (and (memq window-system '(win32 w32))
           (intern (or (getenv "OS") "Windows_95")))
      (and (eq window-system 'x)
           (intern (concat "X" window-system-version "_window")))
      (and (null window-system)
           (string-match "unix" (symbol-name system-type))
           'Terminal_Unix)
      ))

(defun w32-maximize-frame ()
  (interactive)
  (w32-send-sys-command 61488))

(defun w32-minimize-frame ()
  (interactive)
  (w32-send-sys-command 61472))

(defun w32-restore-frame ()
  (interactive)
  (w32-send-sys-command 61728))

(defun w32-simulate-Alt-tap ()
  (interactive)
  (w32-send-sys-command 61696))

(defun w32-start-screen-saver ()
  (interactive)
  (w32-send-sys-command 61760))

(defun w32-simulate-pressing-start-button ()
  (interactive)
  (w32-send-sys-command 61744)); SC_TASKLIST

;;;;; ********************* EMACS 20 PREPARATION ********************** ;;;;;

(defmacro swin (&rest args)
  "(swin 32-lose t) sets win32-lose or w32-lose, depending on Emacs version.
Behavior is otherwise exactly like `setq' for more than two args.

RMS, not only was this petty and childish, it WASTED MY TIME.
That Emacs as a whole has had the opposite effect is irrelevant, because
when you do silly shit, people tend to assume you're a silly shithead,
and this severely diminishes your effectiveness as a social advocate."
  (cons 'setq
        (loop for (symbol value-form) on args by 'cddr nconc
              (list (intern (concat (if (< emacs-major-version 20) "win" "w")
                                    (symbol-name symbol)))
                    value-form))))

(defmacro win (arg)
  "(win 32-lose) is win32-lose or w32-lose, depending on Emacs version."
  ;; No defsetf needed because setf is a macro.
  (intern (concat (if (< emacs-major-version 20) "win" "w")
                  (symbol-name arg))))

(when (< emacs-major-version 20)

  (defmacro save-current-buffer (&rest body)
    "As in Emacs 20.

The `save-current-buffer' macro saves the identity of the current
buffer, evaluates the BODY forms, and finally restores that buffer
as current.  The return value is the value of the last form in
BODY.  The current buffer is restored even in case of an abnormal
exit via `throw' or error.

If the buffer that used to be current has been killed by the time
of exit from `save-current-buffer', then it is not made current
again, of course.  Instead, whichever buffer was current just
before exit remains current."
    (let ((current-buffer (gensym)))
      `(let ((,current-buffer (current-buffer)))
         (unwind-protect
             (progn ,@body)
           (when (buffer-live-p ,current-buffer)
             (set-buffer ,current-buffer))))))
  (put 'save-current-buffer 'lisp-indent-function 0)

  (defmacro with-current-buffer (buffer &rest body)
    "As in Emacs 20.

The `with-current-buffer' macro saves the identity of the current
buffer, makes BUFFER current, evaluates the BODY forms, and
finally restores the buffer.  The return value is the value of the
last form in BODY.  The current buffer is restored even in case of
an abnormal exit via `throw' or error."
    `(save-current-buffer
       (set-buffer ,buffer)
       ,@body))
  (put 'with-current-buffer 'lisp-indent-function 1)

  (defmacro with-temp-buffer (&rest body)
    "As in Emacs 20.

The `with-temp-buffer' macro evaluates the BODY forms with a
temporary buffer as the current buffer.  It saves the identity of
the current buffer, creates a temporary buffer and makes it
current, evaluates the BODY forms, and finally restores the
previous current buffer while killing the temporary buffer.

The return value is the value of the last form in BODY.  You can
return the contents of the temporary buffer by using
`(buffer-string)' as the last form."
    (let ((temp (gensym)))
      `(let ((,temp (generate-new-buffer " Temp Buffer")))
         (prog1
             (with-current-buffer
                 ,temp
               ,@body)
           (kill-buffer ,temp)))))
  (put 'with-temp-buffer 'lisp-indent-function 0)

  (wm-progn-compiled
    (message "Hacking symbols for win32 -> w32 idiocy.")
    (wm-time
      ;; This loop went from 6.779 seconds to 0.271 seconds when I
      ;; byte-compiled `left', `mid', & `nreverse*'.
      (loop for symbol being the symbols
            if (and (fboundp symbol)
                    (equal (left (symbol-name symbol) 6) "win32-"))
            do (fset (intern (concat "w32-"
                                     (right (symbol-name symbol) 6)))
                     (symbol-function symbol)))))

  ;? needed? (require 'cc-mode-19) ;for `functionp'

  ;;(forward-point) is from an Erik Naggum post excoriating MULE, which he
  ;;thinks will cause stuff like (goto-char (+ (dot) 1) to fail under 20
  ;;(use (goto-char (forward-point 1)) instead).  Another poster says
  ;;there's a hack to allow the old form as long as
  ;;enable-multibyte-characters is t, which it is by default.

  (defun forward-point (n)
    (let ((point (point)))
      (prog2
          (forward-char n)
          (point)
        (goto-char point))))

  (load "cust-stub")
  (fset 'defgroup 'cust-stub-defgroup)
  (fset 'defcustom 'cust-stub-defcustom)
  (M feature [cust-stub custom] (provide feature))

  (M variable [buffer-file-coding-system
               default-buffer-file-coding-system
               file-name-coding-system]
    (set variable 'raw-text))

  )

;;;;; *************************** VARIABLES *************************** ;;;;;

;;;; -------------------------- MY VARIABLES --------------------------- ;;;;

;; A defvar can't be reexecuted with 'eval-last-sexp (C-x C-e) since it's a
;; NOP if the value isn't void, but 'eval-defun (C-M-x) does reset the value,
;; theoretically; but I find it only works if the (def*) form is flush left.

(let ((h (getenv "HOSTNAME")))
  (defvar DEM (equal h "democritus.org")          "Running on democritus?")
  (defvar ESK (equal h "eskimo")                  "Running on Eskimo?")
  (defvar HER (equal (system-name) "HERACLEITUS") "Running on Heracleitus?")
  (defvar HOM (or DEM HER)                        "Running @ home?")
  (defvar JOE nil                                 "Running @ JoeAverage?")
  (defvar AMT (equal (getenv "USERDOMAIN") "AMT_DOMAIN")
                                                  "Running @ Advanced Marine?")
  (defvar WRK (or JOE AMT)                        "Running @ work?")
  (defvar WNT (eq system-type 'windows-nt)
    "Running on Windows 95 or NT?")
  (defvar WIN (and WNT (memq window-system '(win32 w32)))
    "Running on Windows 95 or NT in a window?")
  ;; Emacs 20 helpfully renames "all the win32 stuff"
  ;; to "w32".  Does this include that symbol?  Unknown as yet.
  (defvar DOS (and WNT (not window-system))    "Running in a 95 DOS box?")
  (defvar ISP (or ESK)                         "Running on some ISP?")
  (defvar DUP ISP                              "Connected by dialup?"))

;;? The value of DUP is wrong several times over.  First of all, ISP
;; connections can be telnet rather than dial-up, & it's conceivable this
;; could matter.  Second, if they're really dial-up, then how they behave
;; depends on the terminal program being run; Tera Term is much more capable
;; than QModem, for example, but out of the box can't handle C--.  I'm not
;; aware of a way to distinguish telnet from dialup without a lot of screwing
;; around (running Unix commands to check terminals & parsing the output).
;; But that's not really what I need to know; what I need is the tweaks
;; necessary to get this Emacs session to run.  I'm just assuming they'll
;; correlate with connection type.
;; Tu 08 Sep 98 tests on out of the box Tera Term show it receives nothing @
;; all for C-- or C-/.

(or DEM ESK HER HOM JOE AMT
    (ding)
    (message "Warning: particular system not identified."))

(defvar canonical-timelog-file-name "~/timelog.tlg"
  "*Path to timelog file used on most machines.")

;;;; ------------------------- EMACS VARIABLES ------------------------- ;;;;

(defun wm-pretty-vi-dot-message (message)
  (if (string-match "lambda" message)
      (save-excursion
        (set-buffer (get-buffer-create " *wm-vi-dot-pretty*"))
        (erase-buffer)
        (insert message)
        (backward-sexp)
        (let* ((dot-start-form (dot))
               (form (read (current-buffer))))
          (delete-region dot-start-form (dot-max))
          (insert (grok-prettyprint form))
          (setq wm-pretty-vi-dot-message (buffer-string))
          (when current-prefix-arg
            (setq vi-dot-num-input-keys-at-prefix (1+ num-input-keys)
                  vi-dot-prefix-arg current-prefix-arg))
          (push (list 'wm-pretty-vi-dot-message) unread-command-events)))
    (message "%s" message)))
;? We 03 Feb 99: No longer needed, right???
;?(K [wm-pretty-vi-dot-message] "P" (P)
;?   (setq this-command last-command)
;?   (grok-display-in-minibuffer wm-pretty-vi-dot-message))

;(setq vi-dot-message-function nil)
;(setq vi-dot-message-function 'wm-pretty-vi-dot-message)

(make-variable-buffer-local 'backup-inhibited);see C-c t b i
      ;Using this is very important during crash recovery.
(make-variable-buffer-local 'case-fold-search);may be so by default
(make-variable-buffer-local 'case-replace);not so by default

;;? Fix greatren stuff: put it in a load hook.

(setq abbrev-file-name "~/emacs.abv")
(SD   abbrev-mode t)
(setq ad-default-compilation-action 'never);'maybe fails on some Zipf stuff
(setq adaptive-fill-regexp "[\t #'/ ;>?]*")
      ;default ...[#;>*]+ +\\)?
(setq appt-display-interval 1)
(setq appt-message-warning-time (if HER 4 3))
      ;minutes before an appointment that the warning begins
(setq apropos-do-all HER)
(setq archive-zip-use-pkzip nil);i.e. use InfoZip instead
(setq artist-rubber-banding (not (or ISP HER)))
  ;; Modes for file extensions:
(hsup auto-mode-alist '("\\.2do\\'"    . indented-text-mode))
(hsup auto-mode-alist '("\\.asp\\'"    . asp-mode))
(hsup auto-mode-alist '("\\.em\\'"     . email-mode))
(hsup auto-mode-alist '("\\.gmk\\'"    . makefile-mode)) ;GNU Make
(hsup auto-mode-alist '("\\.nmk\\'"    . makefile-mode)) ;Microsoft NMake
(hsup auto-mode-alist '("\\.gp[pt]\\'" . filemenu-mode))
(hsup auto-mode-alist '("\\.h\\'"      . c++-mode));default c-mode
(hsup auto-mode-alist '("\\.hpp\\'"    . c++-mode));default c-mode
(hsup auto-mode-alist '("\\.mak\\'"    . makefile-mode))
(hsup auto-mode-alist '("\\.man\\'"    . indented-text-mode));default nroff
(hsup auto-mode-alist '("\\.pl\\'"     . perl-mode))
(hsup auto-mode-alist '("\\.tlg\\'"    . timelog-mode))
(hsup auto-mode-alist '("\\.txt\\'"    . indented-text-mode))
  ;; Modes for file names & other weirdnesses:
(hsup auto-mode-alist '("[:/\\]filemenu\\'"   . filemenu-mode))
(setq auto-save-interval (if HOM 60000 3000))
      ;default 300: chars typed between non-idle autosaves
(setq auto-save-timeout 30);default 30: seconds idle until autosave
(setq backup-by-copying             nil);default nil
(setq backup-by-copying-when-linked   t);default nil
(setq backup-by-copying-when-mismatch t);default nil
(setq baud-rate (if DUP 1200 38400))
      ;default 38400; 1200 improves scroll/search behavior on slow
      ;connections; note telnet may not be slow, but dialups always are
(setq binary-process-input nil);Somebody needed t for NT but nil works for me
(setq binary-process-output nil)
(setq bookmark-save-flag 1);save whenever a bookmark is changed
(setq buffers-menu-max-size nil);default 10 (nil means "all")
(setq byte-compile-warnings '(unresolved callargs redefine));default t
(setq calendar-date-display-form
      '((concat (if dayname (format "%2s " (substring dayname 0 2)) "")
                (format "%2s %3s %2s"
                        day (substring monthname 0 3) (substring year -2)))))
(setq calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (") time-zone (if time-zone ")")))
(setq calendar-latitude        47.6)
(setq calendar-longitude     -122.2)
(setq calendar-location-name "47.6N 122.2W")
(nconc completion-ignored-extensions
       (let (e)
         (downto i 30 0
           (M s '("B" "c" "e") (push (format ".%s%02d" s i) e)))
         e)
       '(".ou" ".out"))
(setq cperl-break-one-line-blocks-when-indent nil);default t
(setq cperl-hairy nil)
(setq cperl-indent-region-fix-else 0);default 1
(setq cperl-info-page (if (or HER ESK) "perl5" "perl"))
(setq cperl-lazy-help-time .3)
(hsup debug-ignored-errors "Cannot return from the debugger in an error")
(setq default-major-mode 'indented-text-mode)
(setq diary-file (if HOM "~/diaryHOM.txt" "~/diary"))
(setq diff-switches "-u")
(setq dired-copy-preserve-time t)
(setq dired-chmod-program "chmod")
(put 'dired-map-over-marks 'lisp-indent-function 1)
(setq display-time-24hr-format t)
(setq eldoc-idle-delay (if (or ISP HOM) .8 .5));default .5
(setq enable-recursive-minibuffers nil);default; consider changing
(setq explicit-cmdproxy-args '("/q"));gets rid of echoed shell commands
(setq explicit-shell-file-name (if HER "command" "cmdproxy"))
      ;Needed for (startfile (concat "~/.emacs_" name)) in 'shell function
(put 'eval-expression 'disabled nil)
(SD   fill-column 77)
(setq font-lock-face-attributes
      (cond (nil ;defaults for 800x600 black on cyan Windows 95:
             '((font-lock-comment-face          "Firebrick")
               (font-lock-function-name-face    "Blue")
               (font-lock-keyword-face          "Purple")
               (font-lock-reference-face        "CadetBlue")
               (font-lock-string-face           "RosyBrown")
               (font-lock-type-face             "DarkOliveGreen")
               (font-lock-variable-name-face    "DarkGoldenrod")))
            (HER
             '((font-lock-comment-face          "LightSlateGray")
               (font-lock-emphasized-face       "Red")
               (font-lock-other-emphasized-face "Salmon")
               (font-lock-function-name-face    "DarkMagenta")
               (font-lock-keyword-face          "Navy" () nil nil t)
               (font-lock-reference-face        "Sienna")
               (font-lock-string-face           "Blue")
               (font-lock-type-face             "MidnightBlue")
               (font-lock-variable-name-face    "ForestGreen")))
            (t
             '((font-lock-comment-face          "LightSlateGray")
               (font-lock-emphasized-face       "Red")
               (font-lock-other-emphasized-face "Salmon")
               (font-lock-function-name-face    "DarkMagenta")
               (font-lock-keyword-face          "Navy" () nil nil t)
               (font-lock-reference-face        "Sienna")
               (font-lock-string-face           "Blue")
               (font-lock-type-face             "MidnightBlue")
               (font-lock-variable-name-face    "ForestGreen")))))
;; To frob fonts, hack that then C-x C-e this: (font-lock-make-faces t)
(setq font-lock-support-mode 'lazy-lock-mode)
(setq frame-title-format (list "%b|" system-name "|" emacs-version))
(setq garbage-collection-messages t);default nil
(setq gc-cons-threshold 1000000);default 400,000; Anders Lindgren uses 1e6
(setq global-mark-ring-max 64);default 16
;; Gnus crashed 95 on Th 22 Jan 98 under 19.34.1, so I decided it's not ready
;; for this environment yet.
(setq gnus-asynchronous t);default nil
(setq gnus-auto-select-first nil);default t
(setq gnus-check-bogus-newsgroups nil)
(setq gnus-check-new-news nil)
(setq gnus-mailing-list-groups ".");regexp saying which groups are mail
(setq gnus-mouse-face 'highlight)
(setq nnheader-file-coding-system 'raw-text-dos);not used in 5.3 + 19.34.6
(setq gnus-nntp-server nil)
(setq gnus-read-active-file nil);default t
(setq gnus-save-killed-list nil);default t
(setq gnus-save-newsrc-file nil);so it will never write that file
(setq gnus-select-method (cond (AMT '(nntp "gateway1")) ;news.nwlink.com
                               (HER '(nntp "eskinews.eskimo.com"))
                               (t ())))
(setq gnus-secondary-select-methods nil)
(setq gnus-secondary-servers '("eskinews.eskimo.com"))
(setq gnus-startup-file "~/gnusrc");default "~/.newsrc"
(setq gnus-use-adaptive-scoring t)
(setq gnus-use-cross-reference nil)
(setq gnus-verbose           9)
(setq gnus-verbose-backends  9)
(setq gnus-visual '(article-menu
                    group-highlight
                    group-menu
                    highlight
                    menu
                    page-marker
                    summary-menu))
(setq gnus-visual nil)
(setq gnuserv-frame (selected-frame));otherwise gnuserv opens new frames
(setq greatren-zipf-enable t)
(setq hippie-expand-verbose t);default t
(setq hippie-expand-try-functions-list ;default
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
(setq hippie-expand-try-functions-list ;mine
      '(
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-list
        try-expand-line
        try-expand-line-all-buffers
        try-expand-dabbrev-visible
        try-expand-dabbrev-from-kill
        try-expand-whole-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-expand-all-abbrevs
        ))
(setq hscroll-step (if DUP 0 1));see also scroll-step
(setq Info-directory-list (cond
                           (AMT (list "d:/Share/Tools/Info"
                                      "d:/19-34-06/info"
                                      "~/Info/"))
                           (ESK (list "/usr/local/lib/info/"
                                      "/usr/local/info/"
                                      "~/info/"))
                           (HER (list "O:/gnuwin32/b18/info"
                                      "O:/Info/"
                                      "S:/Info"
                                      "~/Info/"))
                           ))
(or   Info-directory-list (makunbound 'Info-directory-list))
(setq Info-enable-edit t)
(put 'Info-edit 'disabled t)
(SD   indent-tabs-mode nil)
(setq inhibit-startup-message t);for empty *scratch* on Emacs 20 startup
(setq jiggle-enabled (not ISP))
(setq jiggle-sit-for-how-long (if HER 0.01 0.04))
(setq kill-whole-line t);changes behavior of ^K
(setq lazy-lock-defer-driven       t)       ;default nil
(setq lazy-lock-defer-on-scrolling t)       ;default nil; v20 name for -driven
(setq lazy-lock-defer-time         1)       ;default 0.25
(setq lazy-lock-minimum-size       25600)   ;default 25600
(setq lazy-lock-stealth-lines      250)     ;default 250
(setq lazy-lock-stealth-nice       0.125)   ;default 0.125
(setq lazy-lock-stealth-time       30)      ;default 30
(setq lazy-lock-stealth-verbose    t)       ;default t
(setq line-number-display-limit 2000000)    ;default 1e6
(setq ls-lisp-dired-ignore-case t);default nil
(setq mail-self-blind t)
(setq mail-yank-prefix "> ")
(setq mark-diary-entries-in-calendar t)
(setq mark-holidays-in-calendar t)
(setq mark-ring-max 64);default 16
(setq max-lisp-eval-depth 300);default 200 can't grok timelog-aggregate-stint
(setq message-log-max 500);default 50; max lines in *Messages*
(setq minibuffer-auto-raise nil);default nil; t is worse
(SD   mode-line-buffer-identification '(" %b"));default '("%F:%12b")
(setq modem-name (if HER "com2" nil))
(setq mouse-avoidance-threshold 25);default 5
(setq mouse-avoidance-nudge-dist (* mouse-avoidance-threshold 3))
(setq mouse-wheel-scroll-amount 4);default 4
(setq msb-display-invisible-buffers-p t);only way to cancel msb is to reload!
(setq msb-separator-diff nil);makes the menu more compact
(put 'narrow-to-region 'disabled nil)
(setq next-line-add-newlines nil)
(setq number-of-diary-entries 3);default 1
(setq outline-minor-mode-prefix "\C-c\C-k")
      ;default is "^C@"; "\C-c\C-@" fails mysteriously
(SD   paragraph-separate "[ \t]*$\\|====\\|˘˘˘˘\\|^")
(SD   paragraph-start    "[ \t]*$\\|====\\|˘˘˘˘\\|[ \t]+[+>]\\|^")
(setq parse-sexp-ignore-comments t)
(setq perl-continued-statement-offset 2);default 4
(setq perl-indent-level 2);default 4
(setq post-command-idle-delay 100000)
      ;Default value for an obsolete feature (microseconds before running a
      ;hook that's always nil AFAICT); I thought twiddling this might help
      ;with performance, but it seems to make no difference.
(setq read-quoted-char-radix 10)
      ;so C-q doesn't require octal, according to a Usenet post; but 19.34.1
      ;doesn't seem to have this.
(setq resize-minibuffer-frame t);default nil
(setq resize-minibuffer-frame-exactly t);default t
(setq query-replace-highlight t)
(setq save-abbrevs t)
(setq search-highlight t);default nil
(setq scroll-conservatively t);not in 19.34, but seen on Usenet
(setq scroll-step (if DUP 0 1));see also hscroll-step
(setq search-slow-window-lines 3);default 1: size of isearch window @ 1200
(setq shell-command-regexp "[^|\n]+")
      ;default "[^;&|\n]+")
(setq shell-command-switch "/c")
(setq shell-prompt-pattern "^[^>\n]+>")
      ;default "^[^#$%>\n]*[#$%>] *")
(setq show-paren-delay 0.125);default 0.125
(setq sgml-quick-keys t);must happen before load; not a toggle
(setq sort-fold-case t);default nil
(setq tags-table-list load-path);I wish find-func.el worked on dumped stuff
(setq tcl-default-application "wish80")
(setq tcl-indent-level (if AMT 4 2))
(setq tcl-continued-indent-level (if AMT 2 1))
(setq timelog-put-time-today-in-separate-frame AMT)
(setq track-eol nil);default nil
(setq undo-limit        (if WRK 200000 20000));default 20000
(setq undo-strong-limit (if WRK 300000 30000));default 30000
(setq vc-command-messages t)
(setq vc-make-backup-files t)
(setq vc-path (cond (AMT "H:/Programs/ComponentSoftware/CS-RCS/System")
                    (HER nil)))
(setq view-diary-entries-initially t);default nil; `d' or `s' shows diary
(setq vi-dot-message-function 'wm-pretty-vi-dot-message)
(setq vip-toggle-key [f7])
(fset  'w32-check-shell-configuration 'ignore);see winnt.el
(fset'win32-check-shell-configuration 'ignore);see winnt.el
(swin 32-allow-system-shell t)
(swin 32-downcase-file-names t);default nil; affects completions
(swin 32-enable-palette nil);default t
(swin 32-pass-alt-to-system nil)
(swin 32-quote-process-args nil)
(setq window-min-height 2);default 4; includes mode line
(setq window-min-width  2);default 10

;; There's some weird bug with the Emacs control variables (see end of this
;; file) so that the outline-minor equivalent of C-c C-s on this section also
;; shows the following 2 sections.  Desultory hacking didn't find the problem
;; & it seems unimportant.  Defining an outline-level had no effect, but is a
;; pain in the ass otherwise.  Still true on Fr 06 Mar 98.

;;;;; **************************** SYNTAX ***************************** ;;;;;

;; There are a large # of symbol-constituents in standard-syntax-table, &
;; they tend to mess up dabbrevs.

;; Hacking syntax tables could cause weird effects, so when I do it, I want
;; the option of reverting to before the hack, so I can test each time
;; whether it's my hack causing the weirdness.

(defun hack-syntax--save-original (table)
  "Save original value of syntax table named TABLE in its property list."
  (or (symbolp table) (error "Usage: (hack-syntax--* 'name-of-syntax-table)"))
  (or (syntax-table-p (eval table))
      (error "'%s doesn't name a syntax table" table))
  (or (get table 'hack-syntax--original)
      (put table 'hack-syntax--original (copy-syntax-table (eval table)))))

(defun hack-syntax--revert (table)
  "Restore original value of syntax table named TABLE from its property list."
  (or (symbolp table) (error "Usage: (hack-syntax--* 'name-of-syntax-table)"))
  (or (syntax-table-p (eval table))
      (error "'%s doesn't name a syntax table" table))
  (let ((original-table (get table 'hack-syntax--original)))
    (or original-table
        (error "(hack-syntax--save-original '%s) was never run" table))
    (set table original-table))
  (message "'%s reverted to original value." table))

;; Note asymmetry in above 2 routines: the first prints nothing, the second
;; prints a message reporting success.  This reflects a fundamental asymmetry
;; between backup & restore that most programs used for backing up secondary
;; storage don't recognize: the operations are not carried out in similar
;; contexts.  Backups are done repeatedly & routinely, & should require a
;; minimum of user interaction (preferably none); restores are done rarely,
;; in circumstances involving lossage, & requiring careful intelligent
;; operation by the user.

;; Code for C-x C-e experimentation:
;; t (syntax-table-p text-mode-syntax-table)
;; n (syntax-table-p 'text-mode-syntax-table)
;; t (syntax-table-p (eval 'text-mode-syntax-table))
;; t (syntax-table-p (eval (eval 'text-mode-syntax-table))))
;; t (syntax-table-p (eval (eval (eval 'text-mode-syntax-table))))
;; t (syntax-table-p (eval (eval (eval (eval 'text-mode-syntax-table)))))
;; (setq tmst 'text-mode-syntax-table)
;; n (syntax-table-p tmst)
;; n (syntax-table-p 'tmst)
;; n (syntax-table-p (eval 'tmst))
;; t (syntax-table-p (eval (eval 'tmst)))
;; t (syntax-table-p (eval  tmst))
;; (hack-syntax--save-original 'text-mode-syntax-table)
;; (setq x '(1 2 3))
;; (hack-syntax--save-original 'x)
;; (symbol-plist 'text-mode-syntax-table)
;; (symbol-plist tmst)
;; (put tmst 'test '(1 2 3 4))
;; (put tmst 'test-original (copy-syntax-table
;; (copy-syntax-table (eval 'text-mode-syntax-table))
;; (put tmst 'hack-syntax--original (copy-syntax-table (eval tmst)))
;; (get tmst 'test)
;; (get tmst 'test2)

(defun hack-syntax--get-punctuation (table)
  (or (symbolp table) (error "Usage: (hack-syntax--* 'name-of-syntax-table)"))
  (or (syntax-table-p (eval table))
      (error "'%s doesn't name a syntax table" table))
  (let ((char 0)
        syntax-of-char
        (punctuation ""))
    (while (< char 256)
      (setq syntax-of-char (car (or (aref (eval table) char)
                                    (aref (standard-syntax-table) char))))
      (if (= syntax-of-char 1)
          (setq punctuation (concat punctuation (char-to-string char))))
      (setq char (1+ char)))
    punctuation))

;; Code for C-x C-e experimentation:
;; (hack-syntax--get-punctuation 'text-mode-syntax-table)
;; (hack-syntax--get-punctuation 'x)
;; (hack-syntax--get-punctuation text-mode-syntax-table)
;; Before inheritance that gave "!\"#,.:;>?@\\^`~"
;; After  inheritance that gave "!\"#,.:;>?@\\^`~"
;; (hack-syntax--get-punctuation 'emacs-lisp-mode-syntax-table)
;; That returns "", which is correct.

(defun hack-syntax--set-to-punctuation (table chars)
  "In syntax table named TABLE set each char in CHARS to punctuation."
  (or (stringp chars)
      (error
       "Usage: hack-syntax--set-to-punctuation 'syntax-table-name \",./\""))
  ;; Because table is the *name* of a syntax table, there's no way this can
  ;; be made to default to the current syntax table, which may not even have
  ;; a name.  Run modify-syntax-entry interactively for that.
  (or (symbolp table) (error "Usage: (hack-syntax--* 'name-of-syntax-table)"))
  (or (syntax-table-p (eval table))
      (error "'%s doesn't name a syntax table" table))
  (hack-syntax--save-original table)
  (while (> (length chars) 0)
    (modify-syntax-entry (string-to-char chars) "." (eval table))
    (setq chars (substring chars 1))))

;; This
;;   (let ((c 33) (p ""))
;;     (while (< c 127)
;;       (if (or (< c ?0)
;;               (and (> c ?9) (< c ?A))
;;               (and (> c ?Z) (< c ?a))
;;               (> c ?z))
;;           (setq p (concat p (char-to-string c))))
;;       (setq c (1+ c)))
;;     p)
;; evaluates to "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
;; which is a list of all nonalphanumeric printing 7-bit chars.
;; This
;;   "!\"#$%&'*+,-./:;<=>?@\\^_`|~"
;; has had "()[]{}" removed, since they're standardly defined as paired.
;; Copy & hack that string to produce args to hack-syntax--set-to-punctuation.

(hack-syntax--set-to-punctuation 'text-mode-syntax-table
                                 "!\"#$%&'*+,-./:;<=>?@\\^_`|~")
                                 ;The standard definition of "'" as a word
                                 ;constituent is particularly annoying, since
                                 ;it causes abbrevs to fail.

(hack-syntax--set-to-punctuation 'emacs-lisp-mode-syntax-table
                                 "./:?")
                                 ;Those chars cause problems when dabbrev-
                                 ;expanded in comments.  Note that "," is
                                 ;a kind of quote (in backtick macros), & ";"
                                 ;is a comment character; leave them alone.

;; This code can be used with C-x C-e to revert:
;;   (hack-syntax--revert 'text-mode-syntax-table)
;;   (hack-syntax--revert 'emacs-lisp-mode-syntax-table)
;; However, there seems to be a very obscure & strange bug at work.
;; Executing (hack-syntax--set-to-punctuation 'text-mode-syntax-table)
;; affects all already-loaded text-mode buffers, but they keep their changed
;; syntax after execution of hack-syntax--revert; but newly-loaded text-mode
;; buffers after reversion do get the old syntax.  I can't explain how in one
;; case the buffers are behaving as if they all use the same syntax tables, &
;; in the other they behave as if they all have their own.  Hmmm...perhaps
;; the difference in algorithms matters: hack-syntax--set-to-punctuation goes
;; thru modify-syntax-entry, which might somehow magically affect copied
;; syntax tables.  That doesn't sound too likely, does it?  You'd think
;; buffer-localization would be a plausible explanation, but I executed all
;; that code with C-x C-e in *this* buffer, & am reporting effects in the
;; timelog buffer.  Anyway, I checked (buffer-local-variables) & there's no
;; syntax table in there.  Reversion is still useful, because when buffers
;; are saved, killed, & reloaded, they then get the old syntax table back.

;;;;; **************************** DISPLAY **************************** ;;;;;

;;;; -------------------- MODELINE FACE BAFFLEMENT --------------------- ;;;;

;; ;? I don't know what these are (saw them on a mailing list):
;;      (set-face-foreground 'modeline "white")
;;      (set-face-background 'modeline "firebrick")
;; Under 19.34.1 those functions have no documentation.

;; ;? It's possible to make the modeline more readable by hacking its face,
;; but I don't know how to unhack it, or tell it "revert to default values".
;; The problem is that setting foreground or background color usually also
;; set the modeline appropriately, but once I set any attributes of the
;; modeline's face they remain that way even when other changes are made to
;; other colors.  Therefore, the screen-flavor functions, which produce
;; reasonable modelines if the modeline face is left alone (constantly
;; redefining that face) will stop doing so.  Before I mess with this I
;; really should find out how the modeline knows it's been changed, so I can
;; tell it to pretend it hasn't been.  The magic code doesn't appear to be in
;; (frame-parameters) or (frame-face-alist (selected-frame)); those don't
;; change (version 19.34.1) after hacking the modeline face.

;; Code to experiment with:
;;   (set-face-foreground 'modeline nil)
;;   (set-face-foreground 'modeline t)
;;   (set-face-foreground 'modeline "Cyan")
;;   (set-face-foreground 'modeline "White")
;;   (set-face-foreground 'modeline "Grey")
;;   (set-face-background 'modeline nil)
;;   (set-face-background 'modeline "Black")
;;   (set-face-background 'modeline "White")
;;   (set-face-background 'modeline "Cyan")
;;   (set-face-background 'modeline "Navy")
;;   (assq 'modeline global-face-data)
;;   (assq 'modeline (frame-face-alist (selected-frame)))
;; The last expression gives
;;   (modeline . [face modeline 1 nil "Cyan" "Black" nil nil])
;; under 'usual flavor, & that doesn't change except for the colors
;; themselves after hacking with one of the set functions above.  Nothing in
;; (frame-parameters) is recognizable either as determining the immutability
;; of the mode line.

;; Hmmm...it's possible the secret under 19.34.1 is to call
;;   (frame-update-face-colors (selected-frame))
;; after hacking the modeline.  I discovered this by accident.  Is it
;; documented anywhere?  Where?  [I doubt this is really true.  It seems to
;; work in some cases but not in others.  Probably the new display engine
;; will change everything, & it's not worth worrying about before then.]

;;;; --------------------------- FRAME TITLE --------------------------- ;;;;

;; Enable frame-title-format:

(let ((name (assq 'name default-frame-alist)))
  (when (consp name)
    (setcdr name ())))

(modify-frame-parameters (selected-frame) '((name)))

;;;; ------------------------- MOUSE AVOIDANCE ------------------------- ;;;;

;; (mouse-avoidance-mode 'whatever) has these problems:
;; * The 19.34 version uses post-command-idle-hook, which is documented as
;;   obsolete.
;; * There isn't a 'whatever that does precisely what I want.  'banish
;;   comes close, but it also affects the mouse pointer when it's on the
;;   95 taskbar, which means the pointer can't be left over CD Player to
;;   display its position in the CD as a tooltip.
;; One solution is to define my own idle timer to invoke
;; (mouse-avoidance-banish-mouse) directly (which is what 'banish does), but
;; to do the invocation only when the pointer is already in frame.  Another
;; is to call (mouse-avoidance-banish-mouse) from some other keystroke's
;; command; I'm trying it in C-l now.

;; To get around the banishment from out of frame problem, & to allow
;; invocation from multiple other keystrokes, I want my own banisher:

(defun wm-mouse-banish (&optional just-do-it)
  "Banish mouse pointer, but only if ARG or it's in the Emacs frame."
  (when (and window-system
             (not (eq major-mode 'gomoku-mode)))
    (require 'avoid)
    (when (or just-do-it (nth 1 (mouse-position)))
      (mouse-avoidance-banish-mouse))))

(add-hook 'jiggle-buffer-switch-hook 'wm-mouse-banish)

;; This would be the timer code:

(when nil
  (require 'avoid)
  (defvar wm-mouse-avoidance-timer
    (if window-system
        (run-with-idle-timer
         9 ;take the action after idle for this many seconds
         t ;repeat (i.e. don't just do it the first time Emacs has been idle)
         'wm-mouse-banish)
      nil)
    "Timer object causing mouse-pointer banishment, if window-system.
This can be an arg of some functions (apropos \"timer\")."))

;; Code to cancel timer with C-x C-e:
;;   (cancel-timer wm-mouse-avoidance-timer)
;; Code for experimentation with C-x C-e:
;;   (mouse-avoidance-mode 'banish)
;;   (mouse-avoidance-mode 'proteus) <== This hangs under 95 & NT 4.0.
;;   (mouse-avoidance-mode 'animate)
;;   (mouse-avoidance-mode 'exile)
;;   (mouse-avoidance-mode 'jump)
;;   (mouse-avoidance-mode 'none)
;;   (mouse-position)
;;   (mouse-avoidance-point-position)
;;   (mouse-avoidance-banish-mouse)
;;   window-system
;;   timer-idle-list
;;   timer-list

;;;; ----------------------------- CURSORS ----------------------------- ;;;;

;; I use the cursor to distinguish the minor mode overwrite-mode when
;; I'm on a system that can control cursor appearance.  In those cases the
;; particular appearance used depends on the screen flavor, set later.

(defun insert-cursor ()
  "Set cursor to whatever it should be in insert mode."
  (interactive)
  ;; By default this is a NOP because we may not be on a system that
  ;; can control cursor appearance.
  (ignore))

(defun overwrite-cursor ()
  "Set cursor to whatever it should be in overwrite mode."
  (interactive)
  ;; By default this is a NOP because we may not be on a system that
  ;; can control cursor appearance.
  (ignore))

(defun appropriate-cursor ()
  "Set cursor to whatever it should be depending on insert/overwrite mode."
  (interactive)
  (if overwrite-mode (overwrite-cursor) (insert-cursor)))

(add-hook 'jiggle-buffer-switch-hook 'appropriate-cursor)

(defadvice overwrite-mode (after adjust-cursor act)
  "Run (appropriate-cursor) to visually indicate overwrite-mode if possible."
  (appropriate-cursor))

;;;; ---------------------------- MENU BAR ----------------------------- ;;;;

;; Under Voelker's 19.34.1 menu bars fail in a 95 OSR2 DOS box; the mouse is
;; clearly generating events on them, but those events don't pull down menus.

;; The menu bar significantly slows things down because of far-more-often-
;; than-should-be-necessary refreshes under 19.34.1; this even disables the
;; screensaver.  The bar might be tolerable on a fast machine, or with more
;; recent versions.

;; Under Voelker's 19.34.1 use (eval-expression), M-:, to run
;; (win32-select-font) to get the same font menu that <Shift-Mouse-1> gives,
;; but to return the full font name instead of actually changing the font.
;; I recall this failing under 19.34.6 but was in a hurry & may have
;; mistyped; for one thing, it doesn't work with M-x.

(if (or HER ISP) (menu-bar-mode 0))

(defun set-lose32-pass-alt-to-system-based-on-menu-bar-mode ()
  (when nil
    ;; This seems not to be worth the effort in practice, but
    ;; leaving the code here shows how to do it & allows reactivation.
    (swin 32-pass-alt-to-system menu-bar-mode)))

(defadvice menu-bar-mode (after hack-frame-position act)
  "Hack lose32-pass-alt-to-system."
  (set-lose32-pass-alt-to-system-based-on-menu-bar-mode))

;?(defadvice menu-bar-mode (after hack-frame-position act)
;?  "Hack frame position so = # of lines fit on screen whether menu-bar-mode."
;?  (cond
;?   (WIN
;?    (modify-frame-parameters
;?     (selected-frame)
;?     (case (x-display-pixel-width)
;?      (640 ;640x480
;?       (list 'top '+ (if menu-bar-mode -8 -1)))
;?      (800 ;800x600
;?       (list 'top '+ (if menu-bar-mode -8 -1)))
;?      (1024 ;1024x768
;?       (list 'top '+ (if menu-bar-mode -8 -1)))
;?      (1152 ;1152x864
;?       (list (list 'top '+ (if menu-bar-mode -8 -1))))
;?      (1280 ;1280x1024 (the only one with a 1+1/4 ratio instead of 1+1/3)
;?       (list 'top '+ (if menu-bar-mode -8 -1)))
;?      (1600 ;1600x1200
;?       (list 'top '+ (if menu-bar-mode -8 -1)))
;?      (t
;?       (list 'top '+ (if menu-bar-mode -8 -1))))))
;?   (DOS
;?    ())))

;;;; --------------------- FONTS, GEOMETRY, COLORS --------------------- ;;;;

(defvar current-screen-flavor 'usual
  "What set of frame parameters I'm currently using.")

(defvar current-font-narrow-width nil
  "What \\[narrow-screen] sets the screen width to for the current font.")

(defvar current-font-wide-width   nil
  "What \\[widen-screen] sets the screen width to for the current font.")

(defun narrow-screen ()
  "Set screen width to narrow option for current font."
  (interactive)
  (set-screen-width current-font-narrow-width)
  ;; (narrow-screen) requires (wm-mouse-banish t) because otherwise
  ;; the mouse pointer can be left outside the frame, after which
  ;; Xmouse deselects the frame.
  (wm-mouse-banish t))

(defun widen-screen ()
  "Set screen width to widest (screen-filling) option for current font."
  (interactive)
  (set-screen-width current-font-wide-width)
  (wm-mouse-banish))

(defun multiflavor-defaults ()
  (cond
   (WIN
    (defun insert-cursor ()             (set-cursor-color "Navy"))
    (defun overwrite-cursor ()          (set-cursor-color "Magenta"))
    (setq current-font-narrow-width     (if AMT 81 79))
    (set-cursor-size                    88)
    )
   (DOS
    (defun insert-cursor ()             (set-cursor-size     1))
    (defun overwrite-cursor ()          (set-cursor-size    88))
    (menu-bar-mode                      -1) ;menu bars fail in a 95 DOS box
    )))

;; 19.34.6 bug?
;;   (modify-frame-parameters
;;    (selected-frame)
;;    '((font . "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")))
;; doesn't have the intended effect; it leaves the font with some strange
;; value.  I wasn't able to find a function that returns the true name of the
;; font; every query method I did find returned that font string, which was
;; wrong.  (set-default-font "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
;; actually does set the font.

(defun tweak-screen-based-on-parameters-presumably-just-set ()
  (appropriate-cursor)
  (set-lose32-pass-alt-to-system-based-on-menu-bar-mode))

(defun usual-screen ()
  "Set screen parameters to 'usual flavor."
  (interactive)
  (multiflavor-defaults)
  ;; (menu-bar-mode) in "menu-bar.el" does a lot more than just modify the
  ;; selected frame, & I think what it does is useful.  ... Hmmm.  That was
  ;; written a *long* time ago, before I was handling default-frame-alist.
  (cond
   (WIN
    (case (x-display-pixel-width)
      (640 ;640x480
       (set-default-font "-*-Terminal-normal-r-*-*-8-60-*-*-c-*-*-oem-")
       (set-foreground-color              "Black")
       (set-background-color               "Cyan")
       (scroll-bar-mode                       -1)
       (set-screen-height                     57)
       (menu-bar-mode                         -1)
       (setq current-font-wide-width         105)
       )
      (800 ;800x600
       (set-default-font "-*-Terminal-normal-r-*-*-13-114-*-*-c-*-*-oem-")
       (set-foreground-color             "Black")
       (set-background-color              "Cyan")
       (scroll-bar-mode                       -1)
       (set-screen-height                     46)
       (menu-bar-mode                         -1)
       (setq current-font-wide-width          99)
       )
      (1024 ;1024x768
       (set-default-font "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
       (set-foreground-color              "Navy")
       (set-background-color              "Cyan")
       (scroll-bar-mode                       -1)
       (set-screen-height                     62)
       (menu-bar-mode                         -1)
       (setq current-font-wide-width         103)
       )
      (1152 ;1152x864
       (set-default-font "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
          (foreground-color             . "Navy")
          (background-color             . "LightCyan1")
          (vertical-scroll-bars         .    nil)
          (menu-bar-lines               .      1)
          (top                             + -10)
          (height                       .     70)
          ))
       (setq current-font-wide-width         118)
      )
      (1280 ;1280x1024 (the only one with a 1+1/4 ratio instead of 1+1/3)
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
          (foreground-color             . "Navy")
          (background-color             . "LightCyan1")
          (vertical-scroll-bars         .    nil)
          (menu-bar-lines               .      1)
          (top                             + -10)
          (height                       .     84)
          ))
       (setq current-font-wide-width         135)
      )
      (1600 ;1600x1200
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
          (foreground-color             . "Navy")
          (background-color             . "LightCyan1")
          (vertical-scroll-bars         .    nil)
          (menu-bar-lines               .      1)
          (top                             + -10)
          (height                       .     98)
          ))
       (setq current-font-wide-width         175)
      )
      (1601 ;1600x1200
       (set-default-font "-*-Terminal-normal-r-*-*-16-120-*-*-c-*-*-oem-")
       (set-foreground-color              "Navy")
       (set-background-color              "Cyan")
       (scroll-bar-mode                       -1)
       (set-screen-height                     73)
       (menu-bar-mode                         -1)
       (setq current-font-wide-width         116)
      )
      (t
       (set-default-font "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
       (set-foreground-color              "Navy")
       (set-background-color              "Cyan")
       (set-screen-height                     60)
       (scroll-bar-mode                       -1)
       (setq current-font-wide-width          99)
      )
    )
    (frame-update-face-colors (selected-frame))
    (! default-frame-alist (frame-parameters))
    (set-face-foreground 'modeline "White")
    (H current-font-narrow-width)
    (narrow-screen))
   (DOS
    (set-frame-color                       15  1) ;bright white on blue
    ))
  (! current-screen-flavor 'usual)
  (tweak-screen-based-on-parameters-presumably-just-set))

(defun huge-screen ()
  "Set screen parameters to 'huge flavor."
  (interactive)
  (multiflavor-defaults)
  (cond
   (WIN
    (case (x-display-pixel-width)
      (640
       (set-default-font "-*-Terminal-normal-r-*-*-8-90-*-*-c-*-*-oem-")
       ;; Selects the same font as Terminal 6 pt using 'mouse-set-font
       ;; Terminal 5 pt is unreadable @ this resolution.
       (set-foreground-color              "Black")
       (set-background-color               "Cyan")
       (set-screen-height                     57)
       (scroll-bar-mode                       -1)
       (setq current-font-wide-width         105)
       )
      (800
       (set-default-font "-*-Terminal-normal-r-*-*-8-90-*-*-c-*-*-oem-")
       ;Selects the same font as Terminal 6 pt using 'mouse-set-font
       (set-foreground-color             "Black")
       (set-background-color             "White")
       (set-screen-height                     69)
       (scroll-bar-mode                       -1)
       (setq current-font-wide-width         132)
       )
      (1024
       (set-default-font "-*-Terminal-normal-r-*-*-8-90-*-*-c-*-*-oem-")
       (set-foreground-color              "Navy")
       (set-background-color             "White")
       (set-screen-height                     93)
       (scroll-bar-mode                        1)
       (setq current-font-wide-width         136)
       )
      (1152
       (set-default-font "-*-Terminal-normal-r-*-*-8-90-*-*-c-*-*-oem-")
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Terminal-normal-r-*-*-8-90-*-*-c-*-*-oem-")
          (foreground-color            .  "Navy")
          (background-color            . "White")
          (vertical-scroll-bars        .       t)
          (menu-bar-lines              .       1)
          (top                             +  -2);19.34.6 bug
          (height                      .     105)
          ))
       (setq current-font-wide-width         156)
       )
      (1280
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Terminal-normal-r-*-*-8-90-*-*-c-*-*-oem-")
          (foreground-color            .  "Navy")
          (background-color            . "White")
          (vertical-scroll-bars        .       t)
          (top                             + -10)
          (height                      .     125)
          ))
       (setq current-font-wide-width         178)
      )
      (1600
       (set-default-font "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
       (set-foreground-color              "Navy")
       (set-background-color             "White")
       (set-screen-height                     98)
       (scroll-bar-mode                        1)
       (setq current-font-wide-width         173)
      )
      (t
       (set-default-font "-*-Terminal-normal-r-*-*-8-90-*-*-c-*-*-oem-")
       (set-foreground-color              "Navy")
       (set-background-color             "White")
       (set-screen-height                     98)
       (scroll-bar-mode                        1)
       (setq current-font-wide-width         173)
      )
    )
    (frame-update-face-colors (selected-frame))
    (set-face-foreground 'modeline "White")
    (! default-frame-alist (frame-parameters))
    (narrow-screen))
   (DOS
    (set-frame-color                       15  1) ;bright white on blue
    ))
  (setq current-screen-flavor 'huge)
  (tweak-screen-based-on-parameters-presumably-just-set))

(defun readable-screen ()
  "Set screen parameters to 'readable flavor."
  (interactive)
  (multiflavor-defaults)
  (cond
   (WIN
    (scroll-bar-mode                          -1)
    (case (x-display-pixel-width)
      (640
       (set-foreground-color                 "Black")
       (set-background-color                 "Cyan")
       (set-default-font "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
       (set-screen-height                     38)
       (setq current-font-narrow-width        79)
       (setq current-font-wide-width          79)
       )
      (800
       (set-foreground-color                 "Black")
       (set-background-color                 "Cyan")
       (set-default-font "-*-Terminal-normal-r-*-*-12-90-*-*-c-*-*-oem-")
       (scroll-bar-mode                       -1)
       (set-screen-height                     46)
       (menu-bar-mode                         -1)
       (setq current-font-narrow-width        79)
       (setq current-font-wide-width          99)
       )
      (1024
       (set-foreground-color                 "Navy")
       (set-background-color                 "Cyan")
       (set-default-font "-*-Terminal-normal-r-*-*-16-120-*-*-c-*-*-oem-")
       (set-screen-height                     46)
       (setq current-font-narrow-width        79)
       (setq current-font-wide-width          84)
       )
      ;?(1152
      ;? (set-foreground-color                 "Navy")
      ;? (set-background-color                 "Cyan")
      ;? (set-default-font "-*-Terminal-normal-r-*-*-16-120-*-*-c-*-*-oem-")
      ;? (set-screen-height                     52)
      ;? (setq current-font-narrow-width        79)
      ;? (setq current-font-wide-width          79)
      ;? )
      (1152
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Terminal-normal-r-*-*-16-120-*-*-c-*-*-oem-")
          (foreground-color            .  "Navy")
          (background-color            . "PaleTurquoise1")
          (vertical-scroll-bars        .     nil)
          (menu-bar-lines              .       0)
          (top                             +  -8);19.34.6 bug
          (height                      .      53)
          ))
       )
      (1280
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Terminal-normal-r-*-*-16-120-*-*-c-*-*-oem-")
          (foreground-color            .  "Navy")
          (background-color            . "PaleTurquoise1")
          (vertical-scroll-bars        .     nil)
          (height                      .      62)
          ))
       (setq current-font-wide-width          90)
       )
      (1601 ;1600x1200
       (set-default-font "-*-Terminal-normal-r-*-*-16-120-*-*-c-*-*-oem-")
       (set-foreground-color              "Navy")
       (set-background-color              "Cyan")
       (scroll-bar-mode                       -1)
       (set-screen-height                     73)
       (menu-bar-mode                         -1)
       (setq current-font-wide-width         116)
      )
      (1600
       (set-foreground-color                 "Navy")
       (set-background-color                 "Cyan")
       (set-default-font "-*-Terminal-normal-r-*-*-19-142-*-*-c-*-*-oem-")
       (set-screen-height                     65)
       (setq current-font-wide-width         139)
       )
      )
    (frame-update-face-colors (selected-frame))
    (set-face-foreground 'modeline "White")
    (! default-frame-alist (frame-parameters))
    (narrow-screen))
   (DOS
    (set-frame-color                       16 10);black on bright cyan
    ))
  (setq current-screen-flavor 'readable)
  (tweak-screen-based-on-parameters-presumably-just-set))

(defun reversed-readable-screen ()
  "Set screen parameters to 'reverse-readable flavor."
  (interactive)
  (multiflavor-defaults)
  (readable-screen)
  (cond
   (WIN
    (case (x-display-pixel-width)
      ((640 800)
       (set-foreground-color               "Cyan")
       (set-background-color               "Black")
       (defun insert-cursor ()             (set-cursor-color "Gold"))
       )
      ((1024 1152 1280 1600)
       (set-foreground-color               "Cyan")
       (set-background-color               "Navy")
       (defun insert-cursor ()             (set-cursor-color "Gold"))
       )
      )
    (frame-update-face-colors (selected-frame))
    (! default-frame-alist (frame-parameters))
    (set-face-foreground 'modeline "Black")
    )
   (DOS
    (set-frame-color                        11  0);bright cyan on black
    ))
  (setq current-screen-flavor 'reverse-readable)
  (tweak-screen-based-on-parameters-presumably-just-set))

(defun orthodox-screen ()
  "Set screen parameters to 'orthodox flavor."
  (interactive)
  (multiflavor-defaults)
  (cond
   (WIN
    (case (x-display-pixel-width)
      (640
       (set-default-font "-*-Fixedsys-normal-r-*-*-12-90-*-*-c-*-*-ansi-")
       (set-foreground-color              "Black")
       (set-background-color              "White")
       (scroll-bar-mode                       -1)
       (set-screen-height                     27)
       (setq current-font-wide-width          92)
       )
      (800
       (set-default-font "-*-Fixedsys-normal-r-*-*-12-90-*-*-c-*-*-ansi-")
       (set-foreground-color              "Black")
       (set-background-color              "White")
       (scroll-bar-mode                       -1)
       (set-screen-height                     37)
       (setq current-font-wide-width          92)
       )
      (1152
       (modify-frame-parameters
        (selected-frame)
        '((font . "-*-Fixedsys-normal-r-*-*-12-90-*-*-c-*-*-ansi-")
          (foreground-color            . "Black")
          (background-color            . "White")
          (vertical-scroll-bars        .       t)
          (menu-bar-lines              .       1)
          (top                         .       0);19.34.6 bug
          (height                      .      56)
          ))
       )
      (1280
       (set-default-font "-*-Fixedsys-normal-r-*-*-12-90-*-*-c-*-*-ansi-")
       (set-foreground-color              "Black")
       (set-background-color              "White")
       (scroll-bar-mode                       -1)
       (set-screen-height                     66)
       (setq current-font-wide-width          92)
       )
      (1600
       (set-default-font "-*-Fixedsys-normal-r-*-*-12-90-*-*-c-*-*-ansi-")
       (set-foreground-color              "Black")
       (set-background-color              "White")
       (scroll-bar-mode                       -1)
       (set-screen-height                     78)
       (setq current-font-wide-width         175)
       )
      (t
       (set-default-font "-*-Fixedsys-normal-r-*-*-12-90-*-*-c-*-*-ansi-")
       (set-foreground-color              "Black")
       (set-background-color              "White")
       (scroll-bar-mode                       -1)
       (set-screen-height                     37)
       (setq current-font-wide-width          92)
       )
      )
    (! default-frame-alist (frame-parameters))
    (narrow-screen))
   (DOS
    (set-frame-color                        7  0);light grey on black
    ))
  (setq current-screen-flavor 'orthodox)
  (tweak-screen-based-on-parameters-presumably-just-set))

(defun reversed-orthodox-screen ()
  "Set screen parameters to 'reverse-orthodox flavor."
  (interactive)
  (multiflavor-defaults)
  (orthodox-screen)
  (cond
   (WIN
    (case (x-display-pixel-width)
      ((640 800 1024 1152 1280 1600)
       (set-foreground-color               "White")
       (set-background-color               "Black")
       (defun insert-cursor ()             (set-cursor-color "Gold"))
       )
      )
    (! default-frame-alist (frame-parameters))
    )
   (DOS
    (set-frame-color                         0  7);black on grey
    ;; (set-frame-color  16 14)
    ;;   black on white
    ;; (set-frame-color  15 16) gives text bright white on black but
    ;;   modeline black on black!
    ))
  (setq current-screen-flavor 'reverse-orthodox)
  (tweak-screen-based-on-parameters-presumably-just-set))

(usual-screen)

;;;; ------------------------- CHARACTER SETS -------------------------- ;;;;

;;; Special (non-Ascii) chars:

;; These calls make sense for a Windows OEM font:

(set-display-table-slot standard-display-table 'wrap 25) ;down arrow
(set-display-table-slot standard-display-table 'truncation 26) ;right arrow
(set-display-table-slot standard-display-table 'vertical-border 186) ;2 bars
;; Defaults: 'wrap, "\\"; 'truncation, "$"; 'vertical-border, "|"

;;; Ascii chars:

(defun 8bit-binary ()
  "Display as 8-bit all chars without exception, even newlines."
  (interactive)
  (standard-display-8bit  0 255)
  (redraw-display))

(defun 8bit-euro ()
  "Display as 8-bit all chars in [160 .. 255]."
  (interactive)
  (standard-display-default 0 255)
  (standard-display-european 1)
  (redraw-display))

(defun 8bit-full ()
  "Display as 8-bit all chars but [0 9 10 13 255]."
  (interactive)
  (standard-display-default 0 255)
  (standard-display-8bit    1   8)
  (standard-display-8bit   11  12)
  (standard-display-8bit   14 254)
  (redraw-display))

(defun 8bit-flank ()
  "Display as 8-bit all chars except newlines & those with blank glyphs."
  (interactive)
  (standard-display-8bit  0 255)
  (standard-display-default   0   0)
  (standard-display-default  10  10)
  (standard-display-default 255 255)
  (redraw-display))

(defun 8bit-high ()
  "Display as 8-bit all chars in [128 .. 254] ([255] would be blank)."
  (interactive)
  (standard-display-default 0 255)
  (standard-display-8bit  128 254)
  (redraw-display))

(defun 8bit-none ()
  "Display all chars in default form."
  (interactive)
  (standard-display-default 0 255)
  (redraw-display))

(defun 8bit-tab ()
  "Display as 8-bit all chars but [0 10 13 255]."
  (interactive)
  (standard-display-default 0 255)
  (standard-display-8bit    1   9)
  (standard-display-8bit   11  12)
  (standard-display-8bit   14 254)
  (redraw-display))

(if ISP (8bit-high) (8bit-full))

;; Code for C-x C-e experimenting (use S-mouse-1 to twiddle fonts):
;;   (set-screen-height   51)
;;   (set-screen-width    80)
;;   (set-screen-width    78)
;;   (set-screen-width    79)
;;   (set-screen-width    95)
;;   (set-screen-width   104)
;; These are needed for the default font of FixedSys 9:
;;   (set-screen-height   27)
;;   (set-screen-width    78)
;; If the scrollbar were removed you could reach 79.
;; Terminal 9, a shorter but equally-wide font, allows this:
;;   (set-screen-height   34)

;;;;; *********** GLOBAL KEYMAPPINGS WITH ANY NEEDED DEFUNS *********** ;;;;;

;;;; --------------------------- PREPARATION --------------------------- ;;;;

(require 'orthodox)
(require 'orwell)

;; Jari Aalto's guide to keymappings indicates that 'kbd is syntactically
;; similar to read-kbd-macro, but will evaluate @ compile time.  He implies
;; therein that it's available for 19.34, but 2 19.34.1 versions lack it.

(or (fboundp 'kbd)
    (defmacro kbd (string)
      (read-kbd-macro string)));note no backquote

;; --defuns used in multiple keymappings--

;; Builtin scroll-{up,down} default to full screen, not to 1

(defun wm-scroll-down-line (p)
  "Scroll down ARG lines (default 1)."
  (interactive "p")
  (scroll-down p))
(defun wm-scroll-up-line (p)
  "Scroll up ARG lines (default 1)."
  (interactive "p")
  (scroll-up p))
(defun wm-scroll-other-window-down-line (p)
  "Scroll down ARG lines (default 1)."
  (interactive "p")
  (scroll-other-window-down p))
(defun wm-scroll-other-window-up-line (p)
  "Scroll up ARG lines (default 1)."
  (interactive "p")
  (scroll-other-window p))
(defun wm-scroll-up-half-screen () (interactive)
  (move-to-window-line -1) (next-line 1) (recenter '(0)))
(defun wm-scroll-down-half-screen () (interactive)
  (move-to-window-line 0) (next-line -1) (recenter '(0)))

;; --definitions of keys--

;; This enables <Shift-Enter> to be recognized as different from <Enter>:

(D function-key-map [S-return] [S-return])

;; QModem defaults to these values for f7..f10:

(D function-key-map "\e[A" [f7])
(D function-key-map "\e[B" [f8])
(D function-key-map "\e[C" [f9])
(D function-key-map "\e[D" [f10])

;; QModem's values for f1..f4 can be referred to in Emacs as [kp-f1] etc,
;; & this lets them work with vi also.  (The above fail with vi.)
;; QModem defaults nothing for f5, & I'm using f6 to work around a ksh
;; bug that's interfering with screen.

;;;; ---- NON-ASCII (EVEN WHEN STRIPPED OF QUALIFIERS) INPUT EVENTS ---- ;;;;

;;; --mouse events--

(G [vertical-scroll-bar C-mouse-1] 'mouse-split-window-vertically)
  ;That's already mapped to [vertical-scroll-bar C-mouse-2], but [C-mouse-2]
  ;is always misinterpreted as [C-mouse-1] when I type it on the scroll bar
  ;by simultaneously clicking right & left, even tho that works elsewhere.
  ;(When I switched to a Logitech driver for my Logitech bus mouse under
  ;Windows 95 OSR2, mouse-2 stopped working entirely on the scroll bar, even
  ;though it works correctly elsewhere.)  Also, documentation says the window
  ;will be split where the click occurs, but in fact it's split where the
  ;scroll button is (19.34.1), & the click must not be on that button.  C-x 2
  ;might be simpler in some cases; dragging the mode line does work.

;; I wanted these
;;   (G [C-mouse-2] (key-binding [?\M-o mouse-2]))
;;   (K [mouse-2] "e" (e) (mouse-set-point e) (delete-other-windows))
;; before I advised Buffer-menu-mouse-select.  Now I'd prefer to revert
;; to the orthodox definitions.

(K [C-mouse-3] "" (menu-bar-mode (not menu-bar-mode)) (redraw-display))

;;; --function keys--

(if WIN
    (progn
      (G [f3]     'wm-scroll-up-line)
      (G [f4]     'wm-scroll-down-line)
      (G [f11]    'wm-scroll-up-line)
      (G [f12]    'wm-scroll-down-line))
  (G [kp-f3] 'wm-scroll-up-line)
  (G [kp-f4] 'wm-scroll-down-line))

(K [C-f3] "P" (P) (call-interactively
                   (if P
                       'FindStr-word-in-*shell*
                     'FindStr-Launcher-word-in-*shell*)))

(G [f5]    'w32-start-screen-saver)
(G [f6]    (if HOM 'dial-phone-number-at-point))
(K [C-f6]  "" (if HOM (send-string-to-modem "ATH")))
(G [f7]    'timelog-sum-day-quarters-in-echo-area-then-go-to-next-day)
(G [C-f7]  'timelog-sum-day-minutes-in-echo-area-then-go-to-next-day)
(G [f8]    'call-last-kbd-macro);also orthodox C-x e
(G [f9]    'auto-fill-this-line-within-paragraph)
(G [f10]   'vc-toggle-read-only)
(G [C-f12] 'dial-phone-number-at-point)

;;; --other non-Ascii keys--

(defun BRIEF-home ()
  (interactive)
  (multiple-actions-for-multiple-taps-on [home]
   '((beginning-of-line) (move-to-window-line 0) (beginning-of-buffer))))
(defun BRIEF-end ()
  (interactive)
  (multiple-actions-for-multiple-taps-on [end]
   '((end-of-line) (move-to-window-line -1) (end-of-buffer))))
(G [home] 'BRIEF-home)
(G [end]  'BRIEF-end)

;; These are useful in keyboard macros, providing ersatz virtual space:
(G [C-up   ]    'picture-move-up)
(G [C-down ]    'picture-move-down)
(G [C-right]    'picture-forward-column)
(K [C-left ] "" (move-to-column (max 0 (1- (current-column))) t))
;; They need additional bindings below because X-Desk gets in the way.
(G [M-up   ]    'picture-move-up)
(G [M-down ]    'picture-move-down)
(G [M-right]    'picture-forward-column)
(K [M-left ] "" (move-to-column (max 0 (1- (current-column))) t))

;; On a dial-up to a Unix shell, <Ctrl-Enter> is LFD (aka C-j); but in a
;; windowing system, <Ctrl-Enter> is [C-return], & C-j is a separate
;; character.  There is analogous confusion with <Alt-Enter> as M-LFD (aka
;; C-M-j) or [M-return].  I want to always use <modifier-Enter> for these
;; mappings, saving <modifier-j> for special mappings accessible only under
;; windowing systems.  (Even when stripped of qualifiers, [return] isn't
;; Ascii, altho LFD & CR are.)

(when window-system
  (G [C-return] 'newline-and-indent)
  (G "\C-j" nil)
  (G [M-return] 'indent-new-comment-line)
  (G "\C-\M-j" nil)
  )

(G [lwindow] 'ignore)

;; On Windows 95, 19.34.1 doesn't recognize [rwindow]; on NT, 19.34.6 does.

(G [apps] 'ignore)

;;;; --------------------------- PUNCTUATION --------------------------- ;;;;

;; Order by Ascii value, stripping qualifiers if necessary

;;Under Windows [tab] & [TAB] are recognizable as different
(when WIN
  (K [tab] "" (if overwrite-mode (move-to-tab-stop) (tab-to-tab-stop))))

(G [?\C-c tab] 'untabify-weirdly)

(G "\e\e "    'mark-sexp);Remotely I have no way to type C-M-@ | C-M-SPC
(G "\e\e/"    'dabbrev-completion);also orthodox C-M-/, untypeable under DUP
(G "\e\e\C-v" 'scroll-other-window-down)

(K (read-kbd-macro "M-SPC") ""
   (multiple-actions-for-multiple-taps-on "M-SPC"
     '((fixup-whitespace)
       (just-one-space)
       (delete-horizontal-space))))
       ;Because sometimees j-o-s is needed when using M-/ as dabbrev-expand

(global-set-key "\e#" 'calc-dispatch)

;; From the FAQ:
;;   (defun match-paren (arg)
;;     "Go to the matching parenthesis if on parenthesis otherwise insert %."
;;     (interactive "p")
;;     (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
;;           ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;           (t (self-insert-command (or arg 1)))))
(defun match-delimiter-or-self-insert (p)
  "Go to the matching delimiter if on delimiter, otherwise self-insert."
  ;; ;? What's the magic for allowing typing "!@#$" to be undone with a
  ;; single (undo)?  It doesn't work for "%" when that's remapped to this.
  ;; Th 05 Mar 98 Hmmm: I think it'd be necessary to hack buffer-undo-list by
  ;; hand, checking whether (eq last-command 'self-insert-command) or
  ;; something similar such as 'match-delimiter-or-self-insert.
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s)") (forward-char 1) (backward-list 1))
        (t (self-insert-command p))))
(G "%" 'match-delimiter-or-self-insert);Ascii 37

;; On a DUP (dial-up) connection to a remote Emacs, <Ctrl-Minus> &
;; <Ctrl-Shift-Minus> are received as C-_, but under WIN they're C-- & C-_,
;; recognized as different.  Under DUP there is no C-/.
(unless DUP
  (G [?\C--] 'undo);orthodoxily C-/, C-_
  (G [?\C-_] 'negative-argument);orthodoxily C--, M--
     ;; That's very convenient for combining with 'transpose-chars, & works
     ;; because <Shift> is irrelevant when applied to Ascii chars like "t",
     ;; so it's possible to hold down <Ctrl-Shift> while trilling <Minus><t>.
  )

(G [?\C-.] 'vi-dot);Ascii 46
(G [?\C-\M-/] 'hippie-expand)

;; ?\; is Ascii 59

(G (read-kbd-macro "C-; C-SPC") 'timelog-sum-today)

(defun shorten-nextgen-line-if-lucky ()
  (interactive)
  (execute-kbd-macro
   (read-kbd-macro "C-a C-e C-r , SPC C-f <C-return> C-e")))
(defun toggle-word-capitalization (P)
  ;; To upcase previous word, use <Alt-Minus><Alt-m>.
  (interactive "P")
  (save-excursion
    (beginning-of-word)
    (when P
      (backward-word (prefix-numeric-value P)))
    (vi-tilde)))
;?(defun upcase-previous-word ()
;?  (interactive)
;?  (save-excursion
;?    (beginning-of-word)
;?    (upcase-word 1)))
(G [?\C-; ?\C-,]             'shorten-nextgen-line-if-lucky)
(G [?\C-; ?\C-c]             'toggle-word-capitalization)
(G [?\C-; ?\C-e]             'hippie-expand)
(G [?\C-; ?\C-f ?\C-i ?\C-p] 'fill-individual-paragraphs)
(G [?\C-; ?\C-f ?\C-n ?\C-p] 'fill-nonuniform-paragraphs)
(G [?\C-; ?\C-i ?\C-b]       'make-indirect-buffer-wrapper)
(G [?\C-; ?\C-r ?\C-;]       'wm-string-rectangle)
(G [?\C-; ?\C-r ?\C-d]       'delete-rectangle)
(G [?\C-; ?\C-r ?\C-k]       'kill-rectangle)
(G [?\C-; ?\C-r ?\C-o]       'open-rectangle)
(G [?\C-; ?\C-r ?\C-r]       'wm-string-rectangle-again)
(G [?\C-; ?\C-r ?\C-y]       'yank-rectangle)
(G [?\C-; ?\C-t ?\C-h ?\C-a] 'timelog-help-activities)
(G [?\C-; ?\C-t ?\C-h ?\C-d] 'timelog-help-defect-types)
(G [?\C-; ?\C-t ?\C-h ?\C-m] 'timelog-help-miscellany)
(G [?\C-; ?\C-t ?\C-h ?\C-s] 'timelog-help-stages)
(G [?\C-; ?\C-t ?\C-h ?\C-t] 'timelog-help-tasks)
(G [?\C-; ?\C-t ?\C-r ?\C-d] 'timelog-recalc-duration)
(G [?\C-; ?\C-t ?\C-s ?\C-d] 'timelog-sum-day-temporarily)
(G [?\C-; ?\C-t ?\C-s ?\C-r] 'timelog-sum-region)
(G [?\C-; ?\C-t ?\C-s ?\C-t] 'timelog-sum-today)
(G [?\C-; ?\C-t ?\C-m]       'timelog-sum-day-minutes-on-message-line)
;?(G [?\C-; ?\C-u]             'upcase-previous-word)

(G [?\C-=] 'negative-argument);boss for shoving lines & paragraphs upwards
(K [?\M-=] "r" (s e) (multiple-actions-for-multiple-taps-on "M-="
   '((count-stuff-region s e) (what-page))))

(defun ditto ()
  "Copy current column's character from previous line to current line."
  (interactive)
  (let ((col (current-column))
        (char nil)
        (abbrev-mode nil))
    (save-excursion
      (forward-line -1)
      (move-to-column col)
      (or (looking-at "$")
          (setq char (following-char))))
    (if (not char)
        (error "End of line")
      (self-insert-char char))))
(G "\C-\\" 'ditto);Ascii 92

(K "\C-x[" "" (push-mark-first-time-then 'backward-page))
(K "\C-x]" "" (push-mark-first-time-then 'forward-page))

(defvar most-recent-numerically-specified-char nil
  "Default value for self-insert-numerically-specified-char.")
(defun self-insert-numerically-specified-char (P)
  "Insert char in numeric arg, or, if none, same char as last time.
A similar function is available in orthodox quoted-insert, but this function
allows subsequent reuse of the same char without retyping.  Note that this
uses decimal, whereas by default quoted-insert uses octal."
  (interactive "P")
  (or P
      (setq P most-recent-numerically-specified-char)
      (error "No char specified either by arg or in previous invocation"))
  (self-insert-char (setq most-recent-numerically-specified-char P))
  (message "Inserted \"%c\" (decimal %d = octal %o = hex %x)" P P P P))
(G "\M-`" 'self-insert-numerically-specified-char)

(defun vi-tilde ()
  "Toggle case of following char except at EOL, where do preceding char."
  ;; I like the structure of the (if (or (and))) below because it gets around
  ;; one of the weaknesses of structured programming by embedding actions in
  ;; a condition.  If the action weren't guaranteed to return non-nil anyway
  ;; a prog1 could be used.  This Lisp (19.34.6) disallows (<= 2 3 4).
  (interactive)
  (if (eolp)
      (unless (bolp)
        (save-excursion
          (backward-char)
          (vi-tilde)))
    (let ((c (following-char)))
      (if (or (and (<= ?A c) (<= c ?Z) (&! downcase c))
              (and (<= ?a c) (<= c ?z) (&!   upcase c)))
          (progn
            ;; N.B.: Exchanging the following 2 forms is *not* a NOP: it
            ;; fucks up save-excursion in toggle-word-capitalization, q.v.
            ;; This is worth remembering because it's not obvious.
            (insert c)
            (delete-char 1)
            (undo-boundary))
        (forward-char)))))
(G [?\C-`] 'vi-tilde)

;;;; -------------- ALPHANUMERIC MAPPINGS OTHER THAN C-C --------------- ;;;;

;; Order alphanumerically, stripping qualifiers if necessary

(G [?\C-\M-4] ())
(G [?\C-\M-4 ?\C-\M-a] 'beginning-of-buffer-other-window)
(G [?\C-\M-4 ?\C-\M-e] 'end-of-buffer-other-window)

(G [?\C-4] nil)
(G [?\C-4 ?\C-0] 'delete-window)
(G [?\C-4 ?\C-1] 'delete-other-windows)
(G [?\C-4 ?\C-o] 'other-window)

(G [?\C-5] nil)
(G [?\C-5 ?\C-0] 'delete-frame)
;; 19.34 has no 'delete-other-frames
(G [?\C-5 ?\C-o] 'other-frame)

(G [?\C-8]       'c-forward-into-nomenclature)
(G [?\C-9]       'wm-scroll-up-line)
(G [?\C-0]       'wm-scroll-down-line)
(G [?\C-\M-9]    'wm-scroll-other-window-up-line)
(G [?\C-\M-0]    'wm-scroll-other-window-down-line)

(defun beginning-of-line-or-buffer (P)
  "Without arg, beginning-of-line; with, beginning-of-buffer."
  (interactive "P")
  (if P (beginning-of-buffer) (beginning-of-line))
  (hscroll-point-visible));It might be better to do an explicit (run-hooks)
   ;It's my intention to set the mark; hence not (goto-char (point-min))
(K "\C-a" "P" (P) (multiple-actions-for-multiple-taps-on "C-a"
   '((beginning-of-line-or-buffer P) (beginning-of-buffer))))

(G "\M-A" 'apropos)
  ;That works to denote <Alt-Shift-a>, leaving M-a unaffected; but this
  ;  (G [?\C-\M-A] 'apropos)
  ;  (G [?\C-\M-a] 'beginning-of-defun)
  ;doesn't; Emacs refuses to distinguish those chars.  Until a M-<uppercase x>
  ;has been defined, Emacs interprets M-<uppercase x> as M-<lowercase x>.
  ;Apparently including a C- in a modifier set eliminates S- as relevant
  ;if the char is typeable Ascii.
  ;See also mappings with C-x prefix.

(K "\M-b" "" (push-mark-first-time-then 'c-backward-into-nomenclature))
(K "\M-c" "" (push-mark-first-time-then 'capitalize-word))

(defun calendar-wrapper (P)
  "Pace prefix args, just display a calendar in an unselected window.
With a prefix arg, do whatever (calendar that-arg) would do, unless the
arg is '-, in which case do (calendar ())."
  (interactive "P")
  (if (eq P '-) ;My current bindings get this by <Alt-Minus><Alt-Shift-c>
      (calendar)
    (if P
        (calendar P)
      (let ((view-diary-entries-initially nil)
            (jiggle-enabled nil))
        (calendar)
        (other-window 1)))))
(G "\M-C" 'calendar-wrapper)

(defun end-of-line-or-buffer (P)
  "Without arg, end-of-line; with, end-of-buffer."
  (interactive "P")
  (if P (end-of-buffer) (end-of-line))
  (hscroll-point-visible))
   ;It's my intention to set the mark; hence not (goto-char (point-min))
(K "\C-e" "P" (P) (multiple-actions-for-multiple-taps-on "C-e"
   '((end-of-line-or-buffer P) (end-of-buffer))))

(G "\M-f" 'c-forward-into-nomenclature)

;; H-h mappings (orwell mode):
(defun describe-function-near-dot (function)
  (interactive (completing-read-object-near-dot 'fboundp "Describe function"))
  (describe-function function))
(defun where-is-command-near-dot (command)
  (interactive (completing-read-object-near-dot 'commandp "Where is command"))
  (where-is command))
(D 'help-command "f" 'describe-function-near-dot)
(D 'help-command "w" 'where-is-command-near-dot)

(G "\M-i" 'overwrite-mode)

;; <Ctrl-Enter> "\C-j", aka LFD, is already (newline-and-indent).  Under a
;; window-system, however, I want to use only <Ctrl-Enter> for that, & use
;; C-j for something like the tagscraps I had under GSTRING/BRIEF.
;;   "A man of macros, and acquainted with BRIEF."  --Isaiah 53
;; Use C-x r s to define tagscraps; it's orthodoxily copy-to-register.
(if window-system (G "\C-j" 'insert-register))

;; To do equivalent of C-a C-k under (null kill-whole-line): C-a C-SPC C-e C-w
(K "\C-k" "P" (P) (if (looking-at "$") (join-following-line) (kill-line P)))

;; I need this with major modes that don't respect the Emacs reservation of
;; C-c [A-Za-z] for user mappings:

(defun call-global-binding-of (P k)
  ;; ;? Fails on prefix keys.
  (interactive "P\nkCall global binding of: ")
  (let ((binding (global-key-binding k)))
    (if (commandp binding)
        (progn
          (if P
              (message "Calling %S %S" P binding)
            (message "Calling %S" binding))
          (setq current-prefix-arg P)
          (call-interactively binding))
      (require 'edmacro)
      (error "%s has no global binding" (format-kbd-macro k)))))
(G "\M-g" 'call-global-binding-of)
;; Because of (require 'orthodox) I still have M-o M-g for 'facemenu-keymap.

(D 'help-command [?c] 'grok-key-briefly)

(defun show-attributes ()
  "Display file attributes of file being visited by current buffer."
  (let* ((name (buffer-file-name))
         (attr (if name (file-attributes name) nil)))
    (when attr
      (message "%S  %S  %s  %d bytes  %s  %s"
               (if case-fold-search 'CFS 'cfs)
               (if case-replace 'CR 'cr)
               (substring (nth 8 attr) 0 (if HOM 3))
               (nth 7 attr)
               (wm-format-time-string "%T %a %d %b %y" (nth 5 attr))
               (file-name-directory (file-truename name))))))
(defun recenter-etc (P)
  "Does (recenter ARG) without redraw, banishes mouse pointer, &
displays information about the buffer in the echo area."
  (interactive "P")
  (recenter (if P P '(0)))
  (wm-mouse-banish)
  (show-attributes))
(K "\C-l" "P" (P) (multiple-actions-for-multiple-taps-on "C-l"
   '((recenter-etc (if P P (/ (window-height) -4)))
     (recenter-etc     P)
     (recenter-etc (if P P  0))
     (recenter-etc (if P P -1))
     (recenter))))

(G "\M-L" 'recenter-etc) ;to combine with "\M-Q" series

(K "\C-m" "" (end-of-line) (newline-and-indent))
(G "\M-n" 'timelog-new-time)
(K "\C-o" "P" (P)
   (beginning-of-line)
   (open-line 1)
   (or P
       (bobp)
       (memq major-mode '(makefile-mode text-mode))
       (indent-for-tab-command)))

;; M-p is a good prefix key for bindings of minibuffer commands, since
;; accessing the history is done with M-p too.

(G "\M-p\M-c" 'repeat-complex-command);orthodoxily C-x C-[ C-[
(G "\M-p\M-p" 'eval-expression)

;; For the query-replace commands, remember that any prefix arg causes them
;; to apply only to searches.  With these mappings a low-digit arg might be
;; most ergonomic, as in M-1 M-p M-SPC for "word" query-replace.

;; See also toggles of {case,query}-* below.  I'm *still* not satisfied with
;; these mappings, just because there are too many options to remember.

(G [?\M-p    ?\M- ] 'query-replace)
(G [?\M-p    ?\M-x] 'query-replace-regexp)
(K [?\M-p ?\C-\M- ] "" (let ((query-replace-interactive t))
                         (call-interactively 'query-replace)))
(K [?\M-p ?\C-\M-x] "" (let ((query-replace-interactive t))
                         (call-interactively 'query-replace-regexp)))

(defvar fill-column-for-last-fill-paragraph-wrapper nil)
(defun fill-paragraph-wrapper (P)
  (interactive "P")
  (let ((fill-column
         (if (eq last-command 'fill-paragraph-wrapper)
             (decf fill-column-for-last-fill-paragraph-wrapper)
           (setq fill-column-for-last-fill-paragraph-wrapper fill-column))))
    (message "Fill column: %d" fill-column)
    (fill-paragraph P)))
(G "\M-q" 'fill-paragraph-wrapper) ;also "\M-Q" by implication, important
                                   ;for pairing with "\M-}" & "\M-L".

(K "\M-r" "" (push-mark-first-time-then 'move-to-window-line))

;; For some reason M-s is orthodoxily specific to text-mode, & this was a
;; constant irritation in programming language modes.  So I coded
;;   (G "\M-s" 'center-line)
;; which kept me happy for a long time, but eventually I needed this:

(defun center-line-with-decoration (decoration-char
                                    padding-length
                                    &optional
                                    leader
                                    trailer)
  "Center the line dot is on within the width specified by `fill-column'.
Pad on both sides with DECORATION-CHAR, leaving PADDING-LENGTH spaces around
the text.  If decoration-char is SPC, no trailing spaces are generated.
For example, (center-line-with-decoration ?= 2) on the line
\"Libertocracy!\" would replace the line with
\"==========================  Libertocracy!  ===========================\"
if the fill-column were 70.  LEADER and TRAILER are optional strings that
overwrite the beginning and end of the line after it has been centered;
for example, a LEADER of \"  // \" would convert the above line to
\"  // =====================  Libertocracy!  ===========================\"
\(and note that the centering is not otherwise affected).  TRAILER defaults
to the character-by-character reverse of LEADER, so make it an explicit \"\"
if only LEADER is wanted.  If LEADER begins with a literal ^T, the ^T is not
inserted as such, but construed as a directive to insert as many spaces as
would be inserted by running `indent-for-tab-command' on this line, and it
does not become part of any defaulted reversed value of TRAILER."
  (save-excursion
    (let ((left-margin (current-left-margin))
          (padding (make-string padding-length 32))
          raw-line-length
          padded-line-length
          slack-space-to-be-decorated
          left-decoration-length
          right-decoration-length
          leader-begins-with-indent) ;construe as bool or as # of spaces
      (beginning-of-line)
      (when (plusp (length leader)) ;ignore "" as well as ()
        (when (= (aref leader 0) ?\C-t)
          (! leader-begins-with-indent (progn
                                         (delete-horizontal-space)
                                         (indent-for-tab-command)
                                         (current-column))
             leader (substring leader 1))
          (delete-horizontal-space)
          (when (looking-at (regexp-quote leader))
            (delete-char (length leader))))
        (&! or trailer (mapconcat 'char-to-string
                                   (nreverse (mapcar 'identity leader))
                                   ""))
        (when leader-begins-with-indent
          (&!2 concat (make-string leader-begins-with-indent 32) leader)))
      (while (= (following-char) decoration-char)
        (delete-char 1))
      (delete-horizontal-space) ;padding
      (end-of-line)
      (delete-horizontal-space) ;in case it got there by accident
      (when (plusp (length trailer))
        (backward-char (length trailer))
        (if (looking-at (regexp-quote trailer))
            (delete-char (length trailer))
          (end-of-line)))
      (while (= (preceding-char) decoration-char)
        (delete-char -1))
      (delete-horizontal-space) ;padding
      (! raw-line-length (current-column)
         padded-line-length (+ raw-line-length (* padding-length 2))
         slack-space-to-be-decorated (- fill-column
                                        left-margin padded-line-length))
      (when (plusp slack-space-to-be-decorated)
        (! right-decoration-length
           (+ (! left-decoration-length (/ slack-space-to-be-decorated 2))
              (% slack-space-to-be-decorated 2)))
        (beginning-of-line)
        (insert (make-string left-decoration-length decoration-char))
        (insert padding)
        (when leader
          (beginning-of-line)
          (setf (buffer-substring (dot) (+ (dot) (length leader))) leader))
        (when (or (/= decoration-char 32)
                  (plusp (length trailer)))
          (end-of-line)
          (insert padding)
          (insert (make-string right-decoration-length decoration-char))
          (when (plusp (length trailer))
            (setf (buffer-substring (- (dot) (length trailer)) (dot))
                  trailer)))))))
(make-variable-buffer-local (defvar center-line-decoration-char 32
  "Char to surround centered lines with"))
(make-variable-buffer-local (defvar center-line-padding-length 0
  "# of spaces between centered text and center-line-decoration-char"))
(make-variable-buffer-local (defvar center-line-leader ()
  "String to replace initial chars of centering decoration"))
(make-variable-buffer-local (defvar center-line-trailer ()
  "String to replace final chars of centering decoration"))
(defvar center-line-interactively-history
  (list (format "%c%d"
                center-line-decoration-char
                center-line-padding-length))
  "Prompt history for `center-line-interactively' function.")
(defun center-line-interactively (P)
  "Call center-line-with-decoration using \"global\" variables as args.
\(The variables are actually automatically buffer-local, but YKWIM.)
With prefix arg, first prompt for new values for those variables.
A single prompt gets all values.  The first character in the response
to the prompt becomes the decorative character that will surround centered
text, such as \"*\" if you like paintball.  Any following digits in the
response are a number that becomes the number of spaces separating the
centered text on each side from the decoration.  The rest of the response up
to a literal ^M if present (insert it using \\[quoted-insert]) is the leader;
anything after a literal ^M is the trailer."
  (interactive "P")
  (when P
    (let* ((prompt
            (format "%s (default %S)? "
                    "Decorative char, padding size, leader, trailer"
                    (format "%c%d%s%s%s"
                            center-line-decoration-char
                            center-line-padding-length
                            (or center-line-leader "")
                            (if center-line-trailer "\r" "")
                            (or center-line-trailer ""))))
           (s (read-from-minibuffer prompt
                                    ()  ;no initial contents
                                    ()  ;no special keymap
                                    nil ;do not (read) the input
                                    'center-line-interactively-history)))
      (when (plusp (length s))
        (! center-line-decoration-char (elt s 0)
           center-line-padding-length (string-to-number (substring s 1)))
        (when (> (length s) 1)
          (! s (split "
" (substring s (+ (truncate
                                            (log10
                                             (or*
                                              center-line-padding-length
                                              1)))
                                           2)))
             center-line-leader (or* (car s))
             center-line-trailer (cadr s))))))
  (center-line-with-decoration center-line-decoration-char
                               center-line-padding-length
                               center-line-leader
                               center-line-trailer))
(G "\M-s" 'center-line-interactively)

;; C-u is implicitly hacked below by (require 'typematic).
(K "\M-v" "" (push-mark-first-time-then 'scroll-down))
(G "\M-V" 'scroll-other-window-down)

;; See also ?\C-. for 'vi-dot

(defun call-last-kbd-macro-wrapper (P) ;? needed for vi-dot; not sure why
  (interactive "P")
  (call-last-kbd-macro P)
  (! this-command 'call-last-kbd-macro-wrapper))
(G [?\C-x ?\C-.] 'call-last-kbd-macro-wrapper)
;;? Or how about doing it like this:
(defadvice call-last-kbd-macro (after hack-this-command act)
  (! this-command (! last-command 'call-last-kbd-macro)))
(G [?\C-x ?\C-.] 'call-last-kbd-macro)
;;? That works too.  Think it over & consider putting it in vi-dot.el.  There
;;also seems to be a problem with lambdas; investigate call-interactively.

(defun insert-kbd-macro-into-*scratch* ()
  (interactive)
  (save-excursion
    (set-buffer "*scratch*")
    (goto-char (dot-max))
    (unless (zerop (current-column))
      (insert ?\n))
    (insert-kbd-macro (make-symbol ""))
    (message "Keyboard macro inserted into *scratch*")))
(G [?\C-x ?\C-8] 'insert-kbd-macro-into-*scratch*)
(defun start-or-end-kbd-macro ()
  (interactive)
  ;? This doesn't seem to work; when replayed, it can start recording
  ;? a new macro.
  (if defining-kbd-macro (end-kbd-macro) (start-kbd-macro nil)))
(G [?\C-x ?\C-9] 'start-kbd-macro)
(G [?\C-x ?\C-0] 'end-kbd-macro)

(K "\C-x4-" "" (shrink-window-if-larger-than-buffer (next-window)))
(K [?\C-x ?4 ?\C--] "" (shrink-window-if-larger-than-buffer (next-window)))
(G "\C-x4\C-a" 'beginning-of-buffer-other-window)
(G "\C-x4\C-e" 'end-of-buffer-other-window)

(G [?\C-x ?\C-4] (copy-keymap ctl-x-4-map))

(G "\C-x\M-a" 'apropos-documentation)
(G "\C-x\M-A" 'apropos-value)
(G "\C-x\C-b" 'buffer-menu);orthodoxily list-buffers

;; "\C-x\C-g" is orthodoxily undefined, & should stay that
;; way as a safe way of terminating a key sequence.

;; A form like
;;   (defun indent-rigidly-wrapper (start end how-much)
;;     "Let C-i continue indenting rigidly, C-o outdent."
;;     (interactive "r\np")
;;     [...]
;;     (indent-rigidly start end how-much) [...] )
;; would fail because the size of the region is changed by the indentation,
;; so start & end become invalid.
(defun indent-rigidly-wrapper (p)
  "After C-x C-i, let C-i continue indenting rigidly, C-o outdent."
  ;; My vi-dot.el has probably obsoleted this.
  (interactive "p");amount by which to indent on each keystroke
  (let ((keys "\C-i"))
    (while (member keys '("\C-i" "\C-o"))
      (indent-rigidly (region-beginning)
                      (region-end)
                      (if (equal keys "\C-i") p (- p)))
      (setq keys (read-key-sequence nil)))
    (setq unread-command-events (listify-key-sequence keys))))
(G "\C-x\C-i" 'indent-rigidly-wrapper)

(G "\C-xk" 'kill-this-buffer);orthodoxily kill-buffer
(G "\C-x\C-r" 'view-file);orthodoxily find-file-read-only

(defun wm-string-rectangle (start end *string*)
  "Delete region-rectangle, then self-insert STRING at its left edge.

The concept here is that you may wish to delete a previous rectangle
before replacing it with a new one, & you may prefer either of 2 different
ways of specifying the rectangle to delete, depending on context.

If the easiest way to gauge how much to delete is from the existing text,
then extend the rectangle to cover that text prior to the deletion.
But if the easiest way to gauge how much to delete is from the new text
that will be inserted--that is, the amount of existing text that the new text
should overwrite is whatever is the width of the new text--then give the
rectangle zero width but execute this function in overwrite-mode.

If you wish to insert without deleting, use a zero-width rectangle
without entering overwrite-mode."
  (interactive "r\nsWM string rectangle: ")
  (require 'rect)
  (! end (set-marker (make-marker) end))
  (delete-rectangle start end)
  (let (auto-fill-function) ;disable auto-fill mode [sic: this is how]
    (operate-on-rectangle 'wm-string-rectangle-line start end t))
  (! last-rectangle-string *string* ;global
     end ()))
(defun wm-string-rectangle-line (startpos begextra endextra)
  (goto-char startpos)
  (self-insert-string *string*));dynamically local to wm-string-rectangle
(G "\C-xrt" 'wm-string-rectangle)
(defun wm-string-rectangle-again (start end)
  "Do (wm-string-rectangle) without prompting, just reusing the last value."
  (interactive "r")
  (wm-string-rectangle start end last-rectangle-string))

(defvar expression-rectangle-history nil
  "Minibuffer history list for the expression-rectangle command.")
(defconst expression-rectangle-default-items
  ;; Every element of this list is a format string:
'("
;; Insert or overwrite column of #s.
(format \"%%%dd\" (+ i 0))"
"
;; ltrim rectangle
(progn
  (delete-char (length s));use this one in insert mode
  (ltrim s))"
"
;; rtrim rectangle
(progn
  (delete-char (length s));use this one in insert mode
  (format \"%%%ds\" (trim s)))"
"
;; Replace #s on possibly non-contiguous lines,
;; right-justified in column
;; Use this only in overwrite mode.
(if (string-match \"[0-9]+\" s)
    (concat (substring s 0 (- (match-end 0) %d))
            (format \"%%%dd\" (prog1 (+ j 0) (incf j)))
            (substring s (match-end 0)))
  s)"
"
;; Replace #s on possibly non-contiguous lines,
;; exactly where they occur.  This could be useful
;; for \"8. Woo\\n9. Hoo\\n10. Spoo\".
;; Use this only in insert mode.
(when (string-match \"[0-9]+\" s)
  (delete-char (length s));use this one in insert mode
  (concat (substring s 0 (match-beginning 0))
          (format \"%%d\" (prog1 (+ j 0) (incf j)))
          (substring s (match-end 0))))"
"
;; Sum #s on possibly non-contiguous lines,
;; reporting total in message & inserting in buffer.
;; Insertion is a separate (when), easily deleted.
(progn
  (when (string-match \"[0-9]+\" s)
    (incf k (string-to-int (match-string 0 s))))
  (when this-is-the-final-line
    (message \"Sum: %%d\" k))
  (when this-is-the-final-line
    (end-of-line)
    (mapcar (lambda (x)
              (insert \"\\n\")
              (move-to-column start-column)
              (insert x))
            (list (make-string %d ?-)
                  (format \"%%%dd\" k))))
  \"\")"
))
(defun expression-rectangle-default-item (i format-width)
  (format (nth i expression-rectangle-default-items)
          format-width
          format-width
          format-width
          format-width))
(defun expression-rectangle-history-init (format-width)
  (let ((items (reverse expression-rectangle-default-items)))
    (while items
      (push (format (car items)
                    format-width
                    format-width
                    format-width
                    format-width)
            expression-rectangle-history)
      (callf cdr items))))
(defvar expression-rectangle-last-format-width -1
  ;;If format-width hasn't changed, history needn't be reinitialized.
  "Value of format-width computed in last expression-rectangle invocation.")
(defun expression-rectangle (P start end)
  "Like string-rectangle but the string is evaluated as ELisp.
A counter, i, is automatically initialized to 0 & incremented.
Counters j & k are initialized to 0, but incrementation is left to the
user's expression.  Each time the expression is evaluated, s has been set
to the segment of the current line within the rectangle being processed;
it always has the width of that rectangle, since the line has already been
extended with spaces if necessary by the orthodox rectangle code."
  (interactive "P\nr")
  (setq P (if P (prefix-numeric-value P) 0))
  (let* ((i 0);counter automatically incremented each time thru loop
         (j 0) (k 0);scratch available to loop but not automatically (incf)d
         (start-column (save-excursion (goto-char start) (current-column)))
         (end-column (save-excursion (goto-char end) (current-column)))
         (width (- end-column start-column))
         (format-width (max 1 (min 9 width)))
         (format (expression-rectangle-default-item P format-width))
         (offset (cdr (assq P (list (cons 0 (- (length format) 2))
                                    (cons 1 (- (length format) 58))
                                    (cons 2 (- (length format) 51))
                                    (cons 3 286)))))
         eval)
    (when (/= format-width
              expression-rectangle-last-format-width)
      (expression-rectangle-history-init format-width)
      (setq expression-rectangle-last-format-width format-width))
    (setq eval (read-from-minibuffer "Expression rectangle: "
                                     (cons format offset)
                                     nil
                                     nil
                                     (cons 'expression-rectangle-history
                                           (1+ P))))
    (require 'rect)
    (operate-on-rectangle 'expression-rectangle-line start end t)))
;; ;? It'd make more sense to tell the read-from-minibuffer to do the (read);
;; one of its args does that.
(defun expression-rectangle-line (startpos begextra endextra)
  ;;Variables '(eval i j k) are dynamically local to expression-rectangle
  (let ((s (buffer-substring startpos (dot)))
        (this-is-the-final-line (= (dot) end)))
    (goto-char startpos)
    (self-insert-string (eval (read eval)))
    (incf i)))
(G "\C-xrx" 'expression-rectangle);orthodoxily 'copy-to-register

(G "\C-x\M-t" 'transpose-sentences);orthodoxily undefined & unbound

(defun broken-undo-back-to-last-save ()
  "Undo all modifications since last save to disk.  Flaky."
  (interactive)
  (while (buffer-modified-p) (call-interactively 'undo)))
                             ;mere (undo) endless-loops there
(G "\C-xu" 'broken-undo-back-to-last-save)

;; Duplicating v19 orthodoxy in case that changes:
(G "\C-x\C-z" (if window-system 'iconify-or-deiconify-frame 'suspend-emacs))
;; Hmmm...
(K "\C-x\C-z" "P" (P) (if window-system
                          (if P
                              (iconify-frame)
                            (loop for f frames do (iconify-frame f)))
                        (suspend-emacs)))

;; Duplicating v20 orthodoxy:
(G "\C-xz" 'vi-dot)

(defun wm-yank (P)
  (interactive "P")
  (yank P)
  (when overwrite-mode
    (let ((s (buffer-substring (region-beginning) (region-end))))
      (delete-region (region-beginning) (region-end))
      (self-insert-string s))))
(G "\C-y" 'wm-yank)

(G "\C-z" 'undo)

;; I haven't tested this yet, or chosen a keymapping for it:
(defun get-header-file ()
  "Opens corresponding .h file for a C or C++ file.
Written by Benjamin Krinsky <krinsky@mit.edu>."
  ;; From: "Benjamin Krinsky" <t-benk@microsoft.com>
  ;; Newsgroups: gnu.emacs.help
  ;; Subject: Re: auto swapping from .cpp/.c to .h
  ;; Date: 1 Aug 1997 07:42:01 GMT
  (interactive)
  (let ((c-extension-regexp "\\.cpp$\\|\\.c$\\|\\.cc$\\|\\.c++$")
        (header-extension '(".h" ".h++"))
        (header-path '("." "../include"))
        (filename)
        (end)
        (headers)
        (paths)
        (full-filename))
    (if (eq buffer-file-name nil)
        (error "Must be visiting a file")
      (setq end (string-match (concat "/\\(\\w*\\)" c-extension-regexp)
                              buffer-file-name))
      (if (eq end nil)
          (error "File is not a C or C++ file")
        (setq headers header-extension)
        (while headers
          (setq paths header-path)
          (setq filename (concat (match-string 1 buffer-file-name)
                                 (car headers)))
          (setq headers (cdr headers))
          (while paths
            (setq full-filename (concat (car paths) "/" filename))
            (setq paths (cdr paths))
            (if (file-exists-p (expand-file-name full-filename))
                ;? Why do that without saving the value?
                (progn (find-file full-filename)
                       (setq headers nil)        ;terminate inner while
                       (setq paths nil)))))))))  ;terminate outer while

;;;; -------------------------- C-C MAPPINGS --------------------------- ;;;;

;; Order alphanumerically where possible, else by Ascii value

;; Emacs reserves C-c<letter> for user customization; it reserves
;; C-c<control char>, which is easier to type, for major modes.  I do user
;; customization with a lot of the latter forms here anyway, checking TFM for
;; ones not or rarely used.  Note that C-c C-l has many modal meanings, but
;; mark-line is so important that it needs that form as well as C-c l.

(G "\C-c " (if ISP 'set-mark-command 'jiggle-cursor));QModem VT102 has no C-@
(G (read-kbd-macro "C-c C-SPC") 'jiggle-cursor-laterally)
(K (read-kbd-macro "C-SPC") "P" (P)
   (wm-mouse-banish)
   (if P
       (set-mark-command P)
     (multiple-actions-for-multiple-taps-on "C-SPC"
       '((set-mark-command P);arg is required under 19.34
         (jiggle-cursor)
         (jiggle-cursor-laterally)))))

(G "\C-c#" 'counter)

;; ;? Not currently used:
;;; (K [?\C-c ?\C--] "" (find-file "~/jobs/_leads"))

;; ;? Obsolete:
;;; ;; Prefix with C-u to cause replacements to affect only words:
;;; (G [?\C-c ?\C-5] 'query-replace);see also toggles of {case,query}-* below
;;; (G [?\C-c ?5]    'query-replace-regexp)

(K [?\C-c ?\C-0] "" (set-selective-display 0))
(K [?\C-c ?\C-2] "" (set-selective-display 2))
(G [?\C-c ?\C-5]    'gomoku)

(G "\C-c80" '8bit-none)
(G "\C-c88" '8bit-high)
(G "\C-c89" '8bit-tab)
(G "\C-c8 " '8bit-full)

;; These work better with a M-p prefix for easy minibuffer history access:
;;;(G [?\C-c ?\C-;] 'eval-expression)
;;;(G [?\C-c    ?;] 'repeat-complex-command)

(G "\C-c=" 'list-text-properties-at) ;analogous to C-x =

;; Using (wm-appt-add) is dangerous because the appointment list is clobbered
;; not only when the session is terminated, but whenever the diary is
;; recalculated.  Smartifying the hook for that wouldn't be easy, since it
;; needs to notice whether it's being called because it's midnight, in which
;; case the list *needs* recalculation.  (Hmmm...consider checking whether
;; the appointment list is empty.)  It might be better to always store
;; appointments in the diary, & code a mode normalizing times.  This could
;; still be useful, however, for "warn me in a few minutes" type stuff.
(defun wm-old-appt-add (time)
  (interactive "sTime ([hh ]mm): ")
  (let* ((now (current-time))
         (hours-now (format-time-string "%H" now))
         (minutes-now (format-time-string "%M" now))
         h m)
    (cond ((string-match "\\`[0-9][0-9]?\\'" time)
           (setq h time)
           (setq m "00"))
          ((string-match "\\` \\([0-9][0-9]?\\)\\'" time)
           (setq h hours-now)
           (setq m (match-string 1 time)))
          ((string-match "\\`\\([0-9][0-9]?\\) \\([0-9][0-9]?\\)\\'" time)
           (setq h (match-string 1 time))
           (setq m (match-string 2 time)))
          (t
           (error "Illformed time string: %S" time)))
    (if (string-match "\\`[0-9]\\'" h) (setq h (concat "0" h)))
    (if (string-match "\\`[0-5]\\'" m) (setq m (concat m "0")));sic
    (if (string-match "\\`[6-9]\\'" m) (setq m (concat "0" m)))
    (or (string< m "59") (error "Minutes out of range: %s" m))
    (if (string< (concat h ":" m) (concat hours-now ":" minutes-now))
        (setq h (format "%02d" (1+ (read h)))))
    (if (equal h "24") (setq h "00"))
    (or (string< h "24") (error "Hours out of range: %s" h))
    (setq time (concat h ":" m))
    (setq msg (read-string (concat "Message for " time "? ")))
    ;; The way orthodox 'appt-add does it, with the message as an arg,
    ;; it's impossible to give an error message for an illformed time string
    ;; until the message has also already been typed.  But note that if
    ;; appt-add had been coded like this function, it couldn't be called
    ;; noninteractively; it'd need a separate noninteractive back end.
    (appt-add time msg)))

;; Using (wm-appt-add) is dangerous because the appointment list is clobbered
;; not only when the session is terminated, but whenever the diary is
;; recalculated.  Smartifying the hook for that wouldn't be easy, since it
;; needs to notice whether it's being called because it's midnight, in which
;; case the list *needs* recalculation.  (Hmmm...consider checking whether
;; the appointment list is empty.)  It might be better to always store
;; appointments in the diary, & code a mode normalizing times.  This could
;; still be useful, however, for "warn me in a few minutes" type stuff.
(defun wm-appt-add (time)
  (interactive "sWarn at HH:MM or in MM minutes: ")
  (let* ((now (current-time))
         (decoded (decode-time now))
         (hours-now (nth 2 decoded))
         (minutes-now (nth 1 decoded))
         h m)
    (cond ((string-match "\\`[0-9]+\\'" time)
           (setq h 0)
           (setq m (+ (read (match-string 0 time))
                      (* hours-now 60)
                      minutes-now)))
          ((string-match "\\`\\([0-9][0-9]?\\)[ :]\\([0-9][0-9]?\\)\\'" time)
           (setq h (read (match-string 1 time)))
           (setq m (read (match-string 2 time))))
          (t
           (error "Illformed time string: %S" time)))
    (incf m (* h 60))
    (setq h (% (/ m 60) 24)
          m (% m 60)
          time (format "%d:%02d" h m))
    (message "Normalized time: %s" time)
    (setq msg (read-string (concat "Message for " time "? ")))
    ;; The way orthodox 'appt-add does it, with the message as an arg,
    ;; it's impossible to give an error message for an illformed time string
    ;; until the message has also already been typed.  But note that if
    ;; appt-add had been coded like this function, it couldn't be called
    ;; noninteractively; it'd need a separate noninteractive back end.
    (appt-add time msg)))
(G "\C-caa" 'wm-appt-add)
(G "\C-cad" 'appt-delete)
(G "\C-cae" 'edit-abbrevs)
(G "\C-caf" 'auto-fill-this-line-within-paragraph)

(defvar modem-name "/dev/modem" "The name your OS uses for your modem.")
(defun send-string-to-modem (string)
  (or (stringp modem-name)
      (error "modem-name not a string"))
  (let ((command (concat "Echo " string " >" modem-name)))
    (shell-command command nil)
    (message "Did (shell-command %S nil)" command)))
(defun dial-phone-number-at-point ()
  (interactive)
  ;; I want to allow phone # formats like "206/555-1212" & "(425) 555-1212",
  ;; so it's necessary to tolerate whitespace & punctuation in the #.
  ;; Sometimes the modem is smart enough to ignore these chars & sometimes
  ;; not, so after the full number with decoration is recognized, all
  ;; nondigits will be stripped.
  (let* ((phone-number-chars "0-9 /()\\-")
         (non-phone-number-chars (concat "^" phone-number-chars))
         end-of-number
         decorated-number
         raw-number)
    ;; If there's a digit ahead of us on the line, we'll assume the phone #
    ;; is ahead of us; else we'll assume it's behind us.
    (funcall (if (looking-at ".*[0-9]")
                 'skip-chars-forward
               'skip-chars-backward)
             "^0-9")
    ;; Now, if there was a digit ahead of us, we're sitting on it, but
    ;; remember it might not have been at the beginning of the phone #.
    ;; If there wasn't a digit ahead of us, we're at the end of the #.
    (skip-chars-forward phone-number-chars)
    ;; Now we're at the end of the # for sure, plus whitespace & punctuation.
    (setq end-of-number (dot))
    (skip-chars-backward phone-number-chars);now we're at the start
    (setq decorated-number (buffer-substring (dot) end-of-number))
    ;; Before we actually calculate raw-number, which is just the digits,
    ;; we need to check whether the first nonwhitespace is "8-" or "888-".  I
    ;; often use these forms to denote "1-800-" prefixes etc.  That requires
    ;; first stripping whitespace, then comparing.
    (if (string-match "^[ \t]*" decorated-number)
        (setq decorated-number (substring decorated-number (match-end 0))))
    (if (string-match "^8[-/ ]" decorated-number)
        (setq decorated-number
              (concat "1-800-" (substring decorated-number 2)))
      (if (string-match "^888-" decorated-number)
        (setq decorated-number (concat "1-" decorated-number))))
    (setq raw-number (mapconcat (^ (char) (if (and (<= ?0 char) (<= char ?9))
                                              ;Grrr: why not (<= ?0 char ?9)?
                                              (char-to-string char)
                                            ""))
                                decorated-number
                                ""))
    (or (> (length raw-number) 0) (error "No phone # recognized"))
    ;; Accidental dialing of 911 just because the # happens to be in text
    ;; & a series of random chars gets typed could force police response.
    (if (equal raw-number "911") (error "You need to dial 911 by hand"))
    ;; OK, we've got both decorated-number & raw-number ready for use.
    (message "To dial %s, go off-hook then hit space." decorated-number)
    (read-char-exclusive);v19.34: keyboard-quit can terminate function here
    (send-string-to-modem (concat "ATDT" raw-number))
    ;; The next 2 actions are sometimes unnecessary, sometimes useful.
    ;; They could cause a problem with hanging up during a long
    ;; dialing sequence, except that being off-hook already should
    ;; take care of that.  On We 08 Oct 97 I found I needed to send ATH
    ;; to the modem by hand a lot so putting these back in was a good idea.
    (sleep-for 5)
    (send-string-to-modem "ATH")
    ))
(G "\C-catd" 'dial-phone-number-at-point)
(K "\C-cath" "" (send-string-to-modem "ATH"))

(K "\C-caw" "" (write-abbrev-file abbrev-file-name))

(G "\C-cb" 'bury-buffer)

;; These definitions allow e.g. C-c M-f M-f M-f M-w to mark & copy 3 words:
(defun mark-whole-word-forward (p)
  "Set mark at start of current or following word, point at end."
  (interactive "p")
  (skip-syntax-forward "^w");in case we start outside a word
  (skip-syntax-backward "w");in case we start in the middle of a word
  (set-mark-command nil);not (push-mark (dot)) because I want the message
  (forward-word p))
(defun mark-whole-word-backward (p)
  "Set mark at end of current or following word, point at start."
  (interactive "p")
  ;;Needed by 'push-mark-first-time-then:
  (setq this-command 'c-backward-into-nomenclature)
  (skip-syntax-backward "^w")
  (skip-syntax-forward "w")
  (set-mark-command nil)
  (backward-word p)
  )
(G "\C-c\M-b" 'mark-whole-word-backward)
(G "\C-c\M-f" 'mark-whole-word-forward)

(G "\C-cc#" 'goto-line)
(K "\C-cc%" "nGo to percent: " (n)
   (push-mark (point)) (goto-char (truncate (* n .01 (point-max)))))
(defun wm-flip-slashes (&optional P start end)
  "Flip all / to \\ & \\ to / in last word on this line.
\(That tends to be the most useful place to do it in *shell*.)
With prefix arg, do it within the region instead."
  (interactive "P\nr")
  (save-excursion
    (unless P
      (end-of-line) (! end (dot))
      (RSB " \\|^") (! start (dot)))
    (goto-char start)
    (while (< (dot) end)
      (cond ((= (following-char) ?/)
             (delete-char 1)
             (insert "\\"))
            ((= (following-char) ?\\)
             (delete-char 1)
             (insert "/"))
            (t
             (forward-char))))))
(G "\C-cc/" 'wm-flip-slashes)

;; David Biesack's code for this is better:
;;?(defun change-character-in-region (from to start end)
;;?  (interactive "cChange character: \ncTo character: \nr")
;;?  (if (> start end)
;;?      (change-character-in-region from to end start)
;;?    (save-excursion
;;?      (goto-char start)
;;?      ;; it might be faster to express this in terms of (search-forward)
;;?      ;; and (replace-match) but this seems sufficient...
;;?      (while (< (point) end)
;;?        (cond ((= from (char-after))
;;?               (delete-char 1)
;;?               (insert to))
;;?              (t (forward-char 1)))))))
;; ;? Turns out neither of us knew about (subst-char-in-region).

(defun change-character-in-region (from to start end)
  (interactive "cChange character: \ncTo character: \nr")
  (subst-char-in-region start end from to))

(defun change-character-in-buffer (from to)
  (interactive "cChange character: \ncTo character: \n")
  (change-character-in-region from to (point-min) (point-max)))

(defalias '// 'change-character-in-region)

(defun /\\-buffer ()
  "Change all / to \\ in the buffer."
  (interactive)
  (change-character-in-buffer ?/ ?\\))

(defun /\\-region (start end)
  "Change all / to \\ for the rest of the buffer."
  (interactive "r")
  (change-character-in-region ?/ ?\\ start end))

(defalias '/\\ '/\\-region)

(defun \\/-buffer ()
  "Change all \\ to / in the buffer."
  (interactive)
  (change-character-in-buffer ?\\ ?/))

(defun \\/-region (start end)
  "Change all \\ to / for the region START to END."
  (interactive "r")
  (change-character-in-region ?\\ ?/ start end))

(defalias '\\/ '\\/-region)

(defun ^m-buffer ()
  "Remove all ^M's from the buffer."
  (interactive)
  (^m-region (point-min) (point-max)))

(defalias '^M '^m-buffer)
(defalias '^M '^m-buffer)

(defun ^m-region (min max)
  "Remove all ^M's from the region."
  (interactive "r")
  (save-excursion
    (goto-char max)
    (while (re-search-backward "\C-m$" min t)
      (delete-char 1))))

(defun wm-copy-path ()
  (interactive)
  (message (win32-set-clipboard-data (buffer-file-name))))
(G "\C-ccp" 'wm-copy-path)

(K "\C-c\C-d" "P" (P)
   (self-insert-string
    (wm-format-time-string
     "%a %d "
     (decdate (if (null P) 0 (prefix-numeric-value P))))))

(G "\C-cd" 'timelog-new-date)

(K "\C-cE" "P" (P) (if P (dired "~/elisp") (find-file "~/elisp/dotemacs.el")))

(K "\C-cf" "" (multiple-actions-for-multiple-taps-on "f"
                '((filemenu)
                  (find-file "~/Files.GpT")
                  (find-file "~/o/Files.GpT"))))

(defun find-function-or-tag (function &optional path)
  "Find the definition of the function near point in the current window.
First try to use find-func.el; if that fails, use etags.el.
See <http://www.kurims.kyoto-u.ac.jp/~petersen/emacs-lisp/find-func.el>."
  (interactive (find-function-read-function))
  (condition-case cons-name-message
      (find-function-do-it function path 'switch-to-buffer)
    (error
     (if (equal (nth 1 cons-name-message) "Can't find library")
         (let ((tags-table-list load-path))
           (message "find-function failed so trying find-tag ...")
           (find-tag (concat " " (symbol-name function) " ")))
       (signal 'error (cdr cons-name-message))))))
(G "\C-cF"    (if (or HOM AMT) 'find-function-or-tag 'find-function))

(G "\C-cggb"  'ggrep-buffer)
(G "\C-cggf"  'ggrep-files)
(G "\C-cggmf" 'ggrep-matching-files)
(G "\C-cggr"  'ggrep-region)

(G "\C-chff" 'FindStr-follow-hit)
(K "\C-chlv" "" (hack-local-variables))
(G "\C-chtn"    'hack-text-netscape)

(K "\C-cH" "P" (P) (if P
                       (find-file "~/home.txt")
                     (shell)))

(G "\C-c\C-i" 'imenu)
(G "\C-ci"    'imenu)

;; ;?????? FUCKS UP UNDO INFO!!!!!!!!!
;; If you're reading my dotemacs, don't use this, it's too dangerous.
;; I haven't figured out what's wrong yet.
(defun dabbrev-wrapper (P)
  "Let C-j access next dabbrev expansion, C-k previous, C-s multiword."
  (interactive "P")
  (if P (setq P '-)) ;C-u is more convenient to mean "forward" with C-j
  (let ((true-last-command last-command))
    (let ((echo-keystrokes 0))
      (while
          (case last-input-event
            (?\C-j
              (dabbrev-expand P)
              (setq last-command this-command)
              (undo-boundary)
              t)
            (?\C-k
              (undo)
              (setq last-command 'undo)
              t)
            (?\C-s
              (let ((word-start (dot)))
                (insert " ")
                (setq last-command 'insert)
                (dabbrev-expand P)
                (when (string-match "$" (buffer-substring word-start (dot)))
                  ;; ;? Someday I'd like to eliminate the copied \n &
                  ;; punctuation, but I'll need to hack dabbrev's state
                  ;; variables to get this to work.  Simultaneously replace
                  ;; the (undo) kluge with a stack of expansions, since that
                  ;; involves hacking the same globals.
                  (ignore)))
              (undo-boundary)
              t))
        (setq P ())
        (read-event)))
    (setq unread-command-events (list last-input-event)
          last-command true-last-command)))
(G "\C-c\C-j" 'dabbrev-wrapper)

(K "\C-cJ" "P" (P) (cond ;Use "\C-cP" for Prospect.'
                    (AMT
                     (dired "~/jobs"))
                    (ESK
                     (dired "~/jobs"))
                    (HOM
                     (if P
                         (find-file "~/j0.'")
                       (find-file "~/jobs/seatimes.txt")))
                    (JOE
                     (switch-to-buffer (if P "old-joe" "joe")))))

(defun insert-key-binding (format)
  (self-insert-string
   (format format (key-binding (read-key-sequence "Key: ")))))
(K "\C-ck " "" (insert-key-binding  "%s" ))
(K "\C-ck'" "" (insert-key-binding "'%s" ))
(K "\C-ck`" "" (insert-key-binding "`%s'"))
(K "\C-ck0" "" (insert-key-binding "(%s)"))
(K "\C-ck9" "" (insert-key-binding "(%s "))

(G "\C-ckf" 'find-function-on-key)

(defun mark-line-and-copy ()
  (interactive)
  (beginning-of-line)
  (push-mark)
  (forward-line 1)
  (kill-ring-save (region-beginning) (region-end)))
(G "\C-c\C-l" 'mark-line-and-copy);has many modal remappings
(G "\C-cl"    'mark-line-and-copy)

;;? Fix this.
(K "\C-cL" "P" (P)
   (find-file (if P (cond (HOM canonical-timelog-file-name)
                          (WRK (format-time-string "~/tl-%y-%m.txt")))
                timelog-file-name)))
(K "\C-c\C-m" "P" (P)
   (self-insert-string
    (wm-format-time-string
     "%b %y"
     (decmonth (if (null P) 0 (prefix-numeric-value P))))))

(G "\C-cmib"  'make-indirect-buffer-wrapper)

(K "\C-cM"    "" (switch-to-buffer "*Messages*"))

(K "\C-c\C-n" "P" (P)
   (self-insert-string
    (format-time-string
     "%R"
     (decminutes (if (null P) 0 (prefix-numeric-value P))))))

(G "\C-cn"       'timelog-new-time)

(defun wm-switch-buffer (P)
  ;; One idea from Kurt Partridge <kepart@cs.washington.edu> cyclebuffer.el,
  ;; the other from typematic-other-buffer in my typematic.el, which allows
  ;; toggling/troggling/quaggling etc buffers with a typematic arg, a third
  ;; from msb.el, which allows access to invisible buffers.
  ;; Even after implementing cycling, I still use arggling a lot.  It's
  ;; particularly useful on slow dialups where redraws are expensive, but I
  ;; also use it a lot at home.
  "Allow toggling/troggling/quaggling etc buffers with ARG, but also allow
just cycling forward through buffer list by repeatedly pressing the final key
of the binding of this command, or cycling backward by pressing meta that.

To repeatedly toggle/troggle/quaggle etc buffers, first invoke this command
with the appropriate prefix arg, then use (vi-dot) to repeat it with that
arg; thus, if this command is bound to C-c C-o and (vi-dot) is bound to C-z,
then C-u C-c C-o will do one troggle, and every subsequent C-z will do
another.  Note that the effect of a C-z series is different from that of a
C-o series; a C-o series cycles forward through the complete buffer list
starting from wherever the prefix arg said to start, with any C-M-o in that
series cycling backwards; a C-z series repeats the complete last comand, with
prefix arg, whatever that was, so it does a toggle/troggle/quaggle etc.

I introduced buffer troggling in my typematic.el package.  However, because
of the convenience of (vi-dot), it's possible to usefully troggle buffers
even without typematic.el; C-u 1 C-c C-o will do it, or, if you have a real
meta key, M-1 C-c C-o.

Am I being clear here?  It's really very simple.  Look.  Keep reading.  This
command lets you switch buffers based on one of 2 methods.  The first,
pirated from cyclebuffer.el by Kurt Partridge <kepart@cs.washington.edu> and
basically doing the same thing, just moves through the buffer list until the
display shows the buffer you want to switch to.  Since it's likely you'll
overshoot if that's some distance away, you can press another key to move
back through the buffer list.  This command doesn't have its own key binding
hardwired into it, and doesn't require that that binding be a single
keystroke; instead, it reads the Emacs builtin last-input-char variable, thus
learning what the final keystroke is in the key sequence by which it was
invoked, and uses that as the cycle-forward character.  Meta-that is the
cycle-backward character, or un-meta-that if that character was meta to
begin with.  Then, if there was a prefix arg, this command starts that much
farther down in the buffer list; by default it starts at the second buffer
in the buffer list (because the first buffer is the current buffer), so with
a prefix arg of 1 it starts at the third buffer, etc.  Because switching to
a buffer rotates it to the top of the buffer list, the effect of invoking
this command thrice, each time with a prefix arg of 1, is to cycle through
the top three buffers on the buffer list; i.e., to troggle.  Without a
prefix arg it's a toggle between the top two buffers; with a prefix arg of 2
it's a quaggle; etc.  So if, for example, you have 4 buffers containing
similar but not identical code and you want to keep quaggling them to verify
that you've made similar but not identical changes to all four, you press
M-2 C-c C-o for the first quaggle, and C-z for each subsequent quaggle.
It's really very simple.  Really.

Another cool feature of this implementation (tough it out, this is *Emacs*)
is that rotation of the buffer list doesn't occur until a buffer is actually
implicitly selected by the entry of a keystroke other than the invoking char
or its meta-toggled variant char.  Soooo, for example, if you're hacking two
separate ELisp packages simultaneously and you just did a (describe-function)
in one of them and now want to toggle to the other, and press C-c C-o
expecting that to happen, and end up in *Help* instead, you can press another
C-o to take you to the other package, and now C-z (or another C-c C-o) toggles
back to the first package, not to *Help*, because *Help* was never selected.

Oh, also, if you use a negative argument, the invisible buffers like the
minibuffer are included in the buffer list as you cycle through it, and it's
the magnitude of the argument that selects the starting point in the cycle.

I know a professional software engineer, the CTO of a rapidly-growing
corporation, who does most of his programming in Microsoft Notepad.
He doesn't like me very much, which makes me sad, because I like him,
or thought I did, but it's sort of like H.G. Wells's story of the
One-Eyed Man in the Country of the Blind.  For me life has been like that.
Actually for me life has been like being trapped in a baboon cage,
and I used to get so lonely I would try to make friends with the baboons,
which is dangerous, as well as sad.  I don't get lonely much any more;
now I just hack, and think, and write.

Bear in mind that the sequence C-c C-o isn't reserved for users by Emacs;
canonically, it's reserved for major modes.  C-c o is reserved for users."
  ;; Hmmm, since that's a docstring it should dynamically substitute command
  ;; chars, but doing so requires hacking the verbiage.  Before this goes
  ;; into a package, if it ever does, that should be fixed.  Some substitute
  ;; would then also need to be found for my 'case-eval, of which I am aware
  ;; of no Common Lisp equivalent.  Perhaps Uncommon Lisp will have become
  ;; part of Emacs by then, or at least will have become a separate package.
  ;;
  ;; This design-problem documentation was written before the docstring,
  ;; so some of the introductory verbiage is redundant:
  ;;
  ;; (wm-switch-buffer) doesn't know its own key binding, but instead uses
  ;; last-input-char to intuit what char its binding *ended* with & loops on
  ;; that, implementing 2 separate functions based on toggling the meta bit
  ;; of that char.  I have it bound to C-c C-o; that allows, for example,
  ;; C-c C-o C-o to cycle 2 buffers, but C-c C-o C-c C-o to toggle between 2
  ;; buffers.  A problem arose with the interaction between (vi-dot) and the
  ;; first version of (wm-switch-buffer).  When I wanted to compare text
  ;; without going to the trouble of splitting windows, I found that I would
  ;; use a lot of C-c C-o C-c C-o sequences; & the conceptual meaning of
  ;; (vi-dot) is that (with 'vi-dot bound to C-z) C-c C-o C-z should mean
  ;; C-c C-o C-c C-o.  It did for just that precise sequence (one (vi-dot)
  ;; invocation); but C-c C-o C-z C-z should mean C-c C-o C-c C-o C-c C-o, &
  ;; it didn't, because the first C-z terminated the (wm-switch-buffer),
  ;; after which the second C-z reinvoked it with a different
  ;; last-command-char, which then got locally bound to invoking-char.  What
  ;; I wanted is for C-c C-o followed by any # of C-z to mean 1+ that many
  ;; repetitions of C-c C-o.  To get this I check
  ;; (vi-dot-is-really-this-command) below; if (vi-dot) is being executed,
  ;; this command should behave as if it's being reinvoked by C-c C-o rather
  ;; than as if the tail of its binding is being repeated.  In general, I
  ;; think no higher-level solution of this problem is possible, because
  ;; each command such as wm-switch-buffer needs to make its own decision
  ;; what the user's conceptual model is of the meaning of various
  ;; possibly-infinite key sequences, & implement those appropriately.
  (interactive "P")
  (let ((buffer-list (buffer-list))
        (invoking-char last-input-char)
        (toggled-meta-invoking-char (logxor (expt 2 27) last-input-char))
        (increment 1) ;initially we're moving forward in the buffer list
        (disallow-invisible-buffers (wholenump (prefix-numeric-value P)))
        candidate-buffer
        key-sequence)
    (setq P (if (memq P '(nil -)) 0 (abs (prefix-numeric-value P))))
    (let ((echo-keystrokes 0)) ;echo-keystrokes is an Emacs builtin variable
      (while-progn
        (while-progn
          (setq P (mod (+ P increment) (length buffer-list))
                candidate-buffer (nth P buffer-list))
          (and disallow-invisible-buffers
               (= (string-to-char (buffer-name candidate-buffer)) ?\ )
               (message "Skipping invisible buffer %S" candidate-buffer)))
        ;; Now display buffer without rotating buffer list:
        (switch-to-buffer candidate-buffer t)
        (read-event)
        (and (not (vi-dot-is-really-this-command))
             (setq increment (case-eval last-input-event
                               (invoking-char 1)
                               (toggled-meta-invoking-char -1))))))
    ;; At this point echo-keystrokes is back to its previous value, which is
    ;; necessary so that if the event terminating this function is a prefix
    ;; of a key sequence, after the appropriate delay it'll be echoed.
    (setq unread-command-events (list last-input-event))
    (let (jiggle-enabled)
      ;; Now switch to buffer with rotation of buffer list:
      (switch-to-buffer candidate-buffer))))
(G "\C-c\C-o"      'wm-switch-buffer)

(G "\C-co"         'delete-other-windows)

(defun cleanup (P)
  "Delete trailing whitespace from all lines, & delete trailing empty lines.
Unless there's a prefix arg or font-lock is on, also remove all text
properties from the buffer."
  (interactive "P")
  (or P (void-to-nil font-lock-mode)
      (set-text-properties (dot-min) (dot-max) nil))
  ;; Could also use facemenu-remove-all
  (save-excursion
    ;Delete BRIEF's trailing ^Z, but not the one at the end of DOS Batch code
    (goto-char (dot-max))
    (backward-char 1)
    (if (and (bolp) (looking-at "\032")) (delete-char 1))
    ;Delete trailing empty lines
    (while (progn
             (goto-char (dot-max))
             (= (current-column) 0))
      (delete-backward-char 1))
    ;Hack Outlook headers in timelog
    (when (eq major-mode 'timelog-mode)
      (goto-char (dot-min))
      (query-replace "Subject:\t" "Re:\t"))
    ;Delete trailing whitespace on lines; this is last to keep its message
    (goto-char (dot-min))
    (query-replace-regexp "[ \t]+$" "")))
(G "\C-cup" 'cleanup)

(G "\C-cpioc"      'cperl-info-on-command)
(G "\C-cpm"        'picture-mode)
(G "\C-cpom"       'phases-of-moon)
(K "\C-cP" ""      (find-file "~/jobs/Prospect.'"))
(G "\C-c\C-q"      'fill-region)
(G "\C-c\M-q"      'fill-region)
(K "\C-cQ" "P" (P) (dired (if P "w:/QM/Up" "w:/QM/Dn") "-alt"))
(K "\C-cR" "P" (P) (cond
                    (AMT
                     (find-file (if P
                                    "u:/Books/RoomWithAView.txt"
                                  "u:/Books/Theaetetus.txt")))
                     (HOM
                      (find-file "gotw.txt"))))

(G "\C-cr13" 'wm-rot13-region)
(defun wm-rename-buffer-with-file-and-backup (new-path)
  "Rename the currently-visited file and every associated entity.
This should include its backup file(s) and its buffer(s), but
in real life all I handle so far are non-numeric backups, and I blow off
indirect buffers entirely.  Non-existent directories are coped with.
Another useful extension would be recognizing an empty NEW-PATH as
as a directive to delete everything."
  (interactive (list (read-from-minibuffer "Edit path to new one: "
                                           (buffer-file-name))))
  (if (buffer-base-buffer)
      ;; To make handling this easily integratable with the rest of Emacs,
      ;; there'd need to be a standard function for generating the names
      ;; of indirect buffers.  My own `generate-new-indirect-buffer-name'
      ;; is only used from my `make-indirect-buffer-wrapper', which is
      ;; very hairy (using grok-... stuff that hasn't been published yet)
      ;; & not well polished.
      (error "Do this in the base buffer."))
  (let* ((new-dir (file-name-directory new-path))
         (new-backup-path (wm-calculate-backup-file-name new-path))
         ;; ;? That's also messy; I'd rather use `make-backup-file-name', but
         ;; my version of that has a side effect that's unacceptable here.
         ;; It's possible that I'm misusing that, & should instead be hacking
         ;; `find-backup-file-name' for the side effect.  Both these problems
         ;; need to be solved in order for this function to be conveniently
         ;; usable by others.
         (new-backup-dir (file-name-directory new-backup-path))
         (old-path buffer-file-name)
         (old-backup-path (make-backup-file-name old-path))
         (buffer-modified-p (buffer-modified-p)))
    (when (file-exists-p old-path)
      (when (not (file-directory-p new-dir))
        (if (y-or-n-p (format "Directory %s doesn't exist; create? "
                              new-dir))
            (make-directory new-dir t)
          (error "Aborting rename; nothing has changed.")))
      (rename-file old-path new-path 0))
    (when (file-exists-p old-backup-path)
      (when (not (file-directory-p new-backup-dir))
        (make-directory new-backup-dir t))
      (rename-file old-backup-path new-backup-path t))
    (rename-buffer (file-name-nondirectory new-path) t);hacked by uniquify.el
    ;; It's better to (rename-auto-save-file) before doing
    ;; (set-visited-file-name), since the latter takes pains to avoid
    ;; renaming the auto-save file to allow for a scenario that will not be
    ;; the case when this function is invoked.  It also hacks
    ;; buffer-modified-p, which therefore needs to be reset.
    (rename-auto-save-file)
    (set-visited-file-name new-path t)
    (set-buffer-modified-p buffer-modified-p)))
(G "\C-crb" 'wm-rename-buffer-with-file-and-backup)
(G "\C-crfb" 'uniquify-rationalize-file-buffer-names)

(K "\C-cS" "" ;recreate *scratch* if necessary after it's nuked
   (switch-to-buffer (get-buffer-create "*scratch*"))
   (lisp-interaction-mode)
   (set-fill-column 77777))

(defun wm-save-desktop-with-message ()
  (interactive)
  (desktop-save desktop-dirname)
  (message "Desktop saved at %s, memory-limit %x."
           (wm-format-time-string "%T %a %d %b %y")
           (memory-limit)))
(defun save-file-visited-by (P key-sequence)
  (interactive "P");some of my file-visiting key sequences reference this arg
  (let ((jiggle-enabled nil))
    (call-interactively (key-binding key-sequence))
    (save-buffer)
    ;; (save-excursion) doesn't work wrapped around that call & save.
    (switch-to-buffer (other-buffer))))
(defun save-other-buffer ()
  "Run (save-buffer) in (other-buffer)."
  (interactive)
  (save-excursion
    (set-buffer (other-buffer))
    (save-buffer)))
(defun set-variable-to-nil ()
  (interactive)
  (or (fboundp 'variable-at-point)
      (load-library "help"))
  (let ((v (variable-at-point)))
    (if v
        (eval-expression (read-from-minibuffer
                          "Eval: "
                          (cons (concat "(setq " (symbol-name v) " nil)") 7)
                          read-expression-map
                          t ;run (read-from-string) on result
                          'read-expression-history))
      (error "No variable recognized at (dot)"))))
(defun show-attributes-on-Unix ()
  "Display file attributes of file being visited by current buffer."
  (interactive)
  (let ((name (buffer-file-name))
        (ls (if (file-executable-p "/bin/ls") "/bin/ls" "ls")))
    (when name
      (call-process ls () (window-buffer (minibuffer-window)) () "-l" name))))
(defun simple (P)
  "Edit simple.el in the site lisp library, or with arg (dired) library.
The edit makes the site library's path the default path for any further
uses of (find-file), which is a major convenience when it's a long path.
The (dired) requires an arg instead because it takes a long time."
  (interactive "P")
  (cond (P (dired (concat data-directory "../lisp")))
        (t (find-file (locate-library "simple.el"))
           ;?(call-interactively 'find-alternate-file)
           )))
(defun slide-line-so-current-column-is (goal-column)
  "Insert or delete whitespace at BOL to make (point) GOAL-COLUMN.
GOAL-COLUMN is the numeric prefix arg when this is called interactively."
  (interactive "p")
  (let ((num-chars-to-delete (- (current-column) goal-column)))
    (save-excursion
      (beginning-of-line)
      (if (minusp num-chars-to-delete)
          (insert (make-string (- num-chars-to-delete) 32))
        (untabify (dot) (save-excursion (end-of-line) (dot)))
        (while (plusp num-chars-to-delete)
          (if (= (following-char) 32)
              (delete-char 1)
            (error "Not enough leading whitespace"))
          (decf num-chars-to-delete))))))
(defun syntax--long-words ()
  (interactive)
  (M c "-_$%" (modify-syntax-entry c "_"))
  ;; Do this only if we're not in a programming-language buffer:
  (or (= (char-syntax ?') ?') (modify-syntax-entry ?' "."))
  (message "Completions will recognize long words."))
(defun syntax--paths ()
  (interactive)
  (M c "!#$%*-./:?@\\^_~" (modify-syntax-entry c "_"))
  ;; Do this only if we're not in a programming-language buffer:
  (or (= (char-syntax ?') ?') (modify-syntax-entry ?' "_"))
  (message "Completions will recognize paths."))
(defun syntax--short-words ()
  (interactive)
  (M c "!#$%*-./:?@\\^_~" (modify-syntax-entry c "."))
  ;; Do this only if we're not in a programming-language buffer:
  (if (= (char-syntax ?') ?_) (modify-syntax-entry ?' "."))
  (message "Completions will recognize short words only."))
(G "\C-csau"         'show-attributes-on-Unix)
(G "\C-csd"          'wm-save-desktop-with-message)
(K "\C-csH" ""       (huge-screen) (widen-screen))
(G "\C-csh"          'huge-screen)
(G "\C-csim"         'simple)
(G "\C-cslscci"      'slide-line-so-current-column-is)
(G "\C-csn"          'narrow-screen)
(K "\C-csO"  "P" (P) (if P (reversed-orthodox-screen) (orthodox-screen)))
(G "\C-csob"         'save-other-buffer)
(G "\C-csoc"         'sort-columns)
(G "\C-csof"         'sort-fields)
(G "\C-csol"         'sort-lines)
(G "\C-csonf"        'sort-numeric-fields)
(G "\C-csopag"       'sort-pages)
(G "\C-csopar"       'sort-paragraphs)
(G "\C-csorf"        'sort-regexp-fields)
(G "\C-csorr"        'reverse-region);defined in sort.el
(K "\C-csr"  "P" (P) (if P (reversed-readable-screen) (readable-screen)))
(G "\C-csu"          'usual-screen)
(G "\C-csvn"         'set-variable-to-nil)
(K "\C-csvL" "P" (P) (save-file-visited-by P "\C-cL"))
(G "\C-csw"          'widen-screen)
(G "\C-csyl"         'syntax--long-words)
(G "\C-csyp"         'syntax--paths)
(G "\C-csys"         'syntax--short-words)

(K "\C-cT" "" (find-file "~/elisp/timelog.el"))
(K "\C-ct?" ""
   (set-mark-command nil)
   (let (jiggle-enabled)
     (find-file "~/elisp/dotemacs.el"))
   (goto-char 0)
   (search-forward "defun\ toggle (symbol");bash so we don't come here instead
   (beginning-of-line)
   (set-window-start (selected-window) (dot))
   (when jiggle-mode (jiggle-cursor)))
(defun toggle (symbol what-it-means)
  (message "%s (whether %s): %S"
           symbol
           what-it-means
           (set symbol (not (eval symbol)))))
(G "\C-ctaf"
   'auto-fill-mode)
(K "\C-ctbi" ""
   (toggle 'backup-inhibited "saving the file overwrites its backup file"))
(K "\C-ctcfs" ""
   (toggle 'case-fold-search "searches ignore case"))
(K "\C-ctcr"  ""
   (toggle 'case-replace "(query-replace)ments preserve case"))
(K "\C-ctdoe"  ""
   (toggle 'debug-on-error "to enter debugger if an error is signaled"))
(G "\C-ctfl" 'font-lock-mode)
(K "\C-ctmb" ""
   (menu-bar-mode (not menu-bar-mode)) (redraw-display))
(G "\C-ctmm"
   'transient-mark-mode)
(K "\C-ctp" "r" (b e)
   (set-text-properties b e ()))
(K "\C-ctqri" ""
   (toggle 'query-replace-interactive "query-replace uses isearch target"))
(G "\C-ctr13"
   'toggle-rot13-mode);doesn't behave as a mode: no modeline display (BUG!)
(G "\C-ctro"
   'toggle-read-only);consider using \C-ctv, "toggle viewing", instead
(K "\C-ctsfc" ""
   (toggle 'sort-fold-case "sorting folds case"))
(K "\C-ctstoe" ""
   (toggle 'stack-trace-on-error "error displays *Backtrace*"))
(K "\C-cttm" "" (if (eq major-mode 'indented-text-mode)
                    (progn (text-mode) (auto-fill-mode 0))
                  (indented-text-mode) (auto-fill-mode 1)))
(K "\C-ctv" ""
   (toggle-read-only) (view-mode buffer-read-only));toggle viewing
(G "\C-ctwc"
   'toggle-word-capitalization)

;; Consider troggles: there could be an &optional values arg listing values
;; to troggle thru, to deal with vars that can have non-boolean values like
;; 'yanks-only (some case variable assigns meaning to that).  Probably it
;; should actually omit t & nil from the list to save line space; they all
;; allow that.  So it could be a &rest list that could be nil.  But consider
;; how many keystrokes are typically required for one of these invocations;
;; it could be a pain in the ass to need to cycle thru rarely-used troggles.
;; It might be wiser to use \C-cT for troggles, & have toggle invocations as
;; well for troggleable variables.  (That was written before I had vi-dot
;; working; now cycling would be less of a problem.)

(G "\C-curl" 'browse-url-at-point)

(G "\C-c\C-x\C-t" 'transpose-paragraphs)
(G "\C-c\C-x'"    'unexpand-abbrev) ;Advice for C-u C-x ' => performance hit

(defun duplicate-line ()
  "Copy this line under it; put point on copy in current column."
  (interactive)
  (let ((start-column (current-column)))
    (save-excursion
      (mark-line-and-copy);save-excursion restores mark
      (yank))
    (forward-line 1)
    (move-to-column start-column)))
(defun duplicate-region ()
  "Copy this region after itself."
  (interactive)
  (let ((start (dot-marker)))
    (kill-ring-save (region-beginning) (region-end))
    (yank)
    (goto-char start)))
(G "\C-c\C-y" 'duplicate-line);important in {picture,mail}-mode
(G "\C-cy"    'duplicate-region)
(G "\C-cY"    'duplicate-line)

;;;;; *** DEFUNS INTENDED FOR M-X EXECUTION RATHER THAN KEY BINDING *** ;;;;;

;Some of these may also be used in hooks.

(defun all-error-conditions ()
  (let (conditions
        (progress 0))
    (mapatoms (^ (atom)
                (when (zerop (% (incf progress) 200))
                  (message "Atoms so far: %d" progress))
                (let ((property (get atom 'error-conditions)))
                  (when property
                    (push (cons atom property) conditions)
                    (message "%S" (cons atom property))))))
    (message "Atoms: %d  Conditions: %d" progress (length conditions))
    ;; Now set a global variable, because this is a slow process
    ;; that shouldn't need to be repeated.
    (setq all-error-conditions conditions)))

(defun arg=p (p)
  "For experimenting with (interactive \"p\") args."
  (interactive "p")
  (message "p: %S" p))

(defun arg=P (P)
  "For experimenting with (interactive \"P\") args."
  (interactive "P")
  (message "(symbolp P): %S   P: %S" (symbolp P) P))

(defun add-number-from-end-of-line ();Initialize with C-x C-e: (setq sum 0)
  (interactive)
  (end-of-line)
  (let ((eol (dot)))
    (search-backward-regexp "[^0-9]")
    (setq sum (+ sum (string-to-number (buffer-substring (dot) eol)))))
  (forward-line 1)
  (message "sum: %d" sum));(G [f7] 'add-number-from-end-of-line)

(defun delete-header-cruft (P)
  "Delete lines which appear to be RFC-822 cruft, mail or news.
With prefix arg, start from point; otherwise do whole buffer."
  (interactive "P")
  (or P (goto-char (point-min)))
  (while (re-search-forward
          (concat "^\\("
                  "Xref\\|Path\\|Newsgroups\\|Followup-To\\|"
                  "Lines\\|Message-ID\\|Reply-To\\|NNTP-Posting-Host\\|"
                  "Received\\|X-Mailer\\|MIME-Version\\|References\\|"
                  "Content-Type\\|Content-Transfer-Encoding\\|Status\\|"
                  "In-Reply-To\\|X-Newsreader\\|"
                  "\\): .*\n")
          nil t)
    (replace-match "")))

(defun elib (P)
  "Edit simple.el in the site lisp library, or with arg (dired) library.
The edit makes the site library's path the default path for any further
uses of (find-file), which is a major convenience when it's a long path.
The (dired) requires an arg instead because it takes a long time."
  (interactive "P")
  (cond (P (dired (concat data-directory "../lisp")))
        (t (find-file (locate-library "simple.el")))))

(defun ip-address ()
  "Got this off a mailing list.  It requires net-utils.el.
I don't actually *have* that, but maybe someday I'll find it
\(or somebody reading my dotemacs online will email it to me)."
  (require 'net-utils)
  (save-excursion
    (ipconfig);; autoloaded from net-utils.el
    (unwind-protect
        (progn
          ;; We are now in buffer "*Ipconfig*".
          ;; wait for the ipconfig process to finish.
          (while (let ((p (get-process "Ipconfig")))
                   (and p (process-status p)))
            (sit-for 1))
          (beginning-of-buffer)
          (if (save-match-data ;; Don't mess up my caller's match data.
                (re-search-forward "^[ \t]*IP Address[. ]*:[ \t]*" nil t))
              (buffer-substring (point) (progn (end-of-line) (point)))
              (error "Can't find IP address")))
      (kill-buffer "*Ipconfig*")
      )))

(defun kill-all-registers ()
  "Undefine all registers (which otherwise accumulate on desktop)."
  (interactive)
  (setq register-alist nil));for C-x C-e: (kill-all-registers)

(defalias 'llps 'list-load-path-shadows)

(defun manify ()
  "Create temp buffer viewing fontified copy of current buffer.
Current buffer is expected to be in the format of Unix `man' output."
  (interactive)
  (let* ((source-name (buffer-name))
         (target-name (concat "*" source-name "*"))
         (text (buffer-string)))
    (when (string-match "\\(\\.man\\)\\*\\'" target-name)
      (callf4 replace-match "" t t target-name 1))
    (switch-to-buffer (get-buffer-create target-name))
    (erase-buffer)
    (insert text)
    (Man-fontify-manpage)
    (setq buffer-read-only 1)
    (view-mode 1)
    (set-buffer-modified-p nil)))

(defun paginate ()
  "Run (what-page) after each command in this buffer."
  ;; This should be a minor mode, & should only advise motion commands, altho
  ;; on a fast machine that probably doesn't matter much.  Localizing the
  ;; hook can matter a lot on a slow machine.
  (interactive)
  (make-local-hook 'post-command-hook)
  (add-hook 'post-command-hook 'what-page nil t))

(defun pan ()
  "Make a buffer suitable for long-line panning instead of wrapping."
  ;; There's an auto-show.el that does the same thing, but it seems much
  ;; more complicated with no added value.  Also, it doesn't localize
  ;; the hook.
  (interactive)
  (if (&! not truncate-lines)
      ;becomes buffer-local
      (progn
        (make-local-hook 'post-command-hook)
        (add-hook 'post-command-hook 'hscroll-point-visible nil t)
        (message "Panning is on."))
    (message "Panning is off.")))

(defun see-chars-original () ;Copied from FAQ question 108
  "Display events received, terminated by a 3-second timeout."
  (interactive)
  (let (chars
        (inhibit-quit t))
    (message "Enter characters or other events; end with 3-second timeout.")
    (while (not (sit-for 3))
      (setq chars (nconc chars (list (read-event))) ; <== THIS ERRORS OUT
            quit-flag nil)              ; quit-flag might be set by C-g.
      (if (not (input-pending-p))
          (message "Events received until now: %s..."
                   (key-description chars))))
    (message "Events received: %s" (key-description chars))))

(defun see-chars () ;Hacked from FAQ version, which fails
  "Display events received, terminated by a 3-second timeout."
  (interactive)
  (let (chars
        (inhibit-quit t))
    (message "Enter characters or other events; end with 3-second timeout.")
    (while (not (sit-for 3))
      (setq chars (vconcat chars (list (read-event)))
            quit-flag nil)              ; quit-flag might be set by C-g.
      (if (not (input-pending-p))
          (message "Events received until now: %s..."
                   (key-description chars))))
    (message "Events received: %s" (key-description chars))))

(defun see-chars-as-ints ()
  "Display events received, terminated by a 3-second timeout."
  (interactive)
  (let (chars
        char
        (inhibit-quit t))
    (message "Enter characters or other events; end with 3-second timeout.")
    (while (not (sit-for 3))
      (setq char (read-event)
            quit-flag nil)              ; quit-flag might be set by C-g.
      (setq chars (nconc chars (list char)))
      (if (not (input-pending-p))
          (message "Event received: %d..."
                   char)))
    (message "Events received: %S" chars)))

;;;;; ****** LOADS OF & TWEAKS TO PACKAGES: HOOKS, ACTIONS, ETC ******* ;;;;;

;;;Copied from advice.el:
;; If you experience any strange behavior/errors etc. that you attribute to
;; Advice or to some ill-advised function do one of the following:
;; - M-x ad-deactivate FUNCTION (if you have a definite suspicion what
;;                               function gives you problems)
;; - M-x ad-deactivate-all      (if you don't have a clue what's going wrong)
;; - M-x ad-stop-advice         (if you think the problem is related to the
;;                               advised functions used by Advice itself)
;; - M-x ad-recover-normality   (for real emergencies)
;; The first three measures have restarts, i.e., once you've figured out
;; the problem you can reactivate advised functions with either `ad-activate',
;; `ad-activate-all', or `ad-start-advice'. `ad-recover-normality' unadvises
;; everything so you won't be able to reactivate any advised functions, you'll
;; have to stick with their standard incarnations for the rest of the session.
;; IMPORTANT: With Advice loaded always do `M-x ad-deactivate-all' before
;; you byte-compile a file, because advised special forms and macros can lead
;; to unwanted compilation results. When you are done compiling use
;; `M-x ad-activate-all' to go back to the advised state of all your
;; advised functions.
;;;
;; More useful than ad-deactivate is ad-unadvise; it clears all the old
;; crap so I can try again.  The default arg is intelligent.
;;;
;; ad-disable-advice & ad-enable-advice work on specific advices rather than
;; all the advices of a function.  **LOOK** ====> They have no effect unless
;; followed by ad-activate FUNCTION!  Example:
;;   (ad-disable-advice 'isearch-update 'after 'isearch-update-jiggle)
;;   (ad-activate 'isearch-update)
;;;
;; (assq 'ADVICE (ad-get-enabled-advices 'FUNCTION 'after)) returns non-nil
;; if 'ADVICE is the symbol of an enabled after advice of FUNCTION.
;; (ad-is-advised 'FUNCTION) returns non-nil whether or not advice is active.

;;; abbrev.el

(defadvice write-abbrev-file (after abbrev-remember-write () act);abbrev.el
  "Causes (write-abbrev-file) to remember that a write was done.
This avoids unnecessary prompting by (save-some-buffers) to save abbrevs."
  (! abbrevs-changed nil))

(defun wm-num-abbrevs-in-table (abbrev-table)
  "Return the number of abbrevs in ABBREV-TABLE."
  (loop for the symbols of abbrev-table count t))
(byte-compile 'wm-num-abbrevs-in-table)

(defadvice write-abbrev-file (before wm-sanity act)
  "Refuse to overwrite abbrev list unless data passes sanity checks."
  (unless (> (wm-num-abbrevs-in-table global-abbrev-table)
             (cond ((or AMT HER)
                    100)
                   (t
                    2)))
    (error "Sanity checked failed: # of global abbrevs too small.")))

;?(defun wm-prepare-abbrev-list-buffer ()
;?  "Like built-in `prepare-abbrev-list-buffer' but sorting everything.
;?This is useful when the abbrev table is under version control.
;?For editing convenience I sort global-abbrev-table first; the other
;?tables are alphabetized by name."
;?  ;; Within each table, it'd be preferable for sorting to be by expansion
;?  ;; rather than by abbrev.
;?  (save-excursion
;?    (set-buffer (get-buffer-create "*Abbrevs*"))
;?    (erase-buffer)
;?    ;; In the builtin output, every insertion is followed by \n\n, even when
;?    ;; that's at the end of the buffer.  2 adjacent empty abbrev tables are
;?    ;; separated by \n\n\n.  The use count is formatted as %d, but I'm
;?    ;; assuming I can get away with right-justifying it in its column.
;?    (loop for table in (cons 'global-abbrev-table
;?                             (delete 'global-abbrev-table
;?                                     (sort (append abbrev-table-name-list
;?                                                   ())
;?                                           'string<)))
;?          as separator = "" then "\n"
;?          do
;?          (insert (format "%s(%S)\n" separator table))
;?          (wm-insert-abbrev-table-description table)
;?          )
;?    (goto-char (point-min))
;?    (set-buffer-modified-p nil)
;?    (edit-abbrevs-mode))
;?  (get-buffer-create "*Abbrevs*"))
;?
;?(defun wm-insert-abbrev-table-description (abbrev-table)
;?  "Similar to the builtin but sorting on expansion.
;?Builtin (insert-abbrev-table-description NAME &optional READABLE) inserts
;?in whatever order the args were present in the abbrev.  This function has
;?no READABLE arg; it assumes that to be t, since if you wanted Lisp code,
;?the random order of the builtin would be fine."
;?  (loop for symbol in
;?        (sort (loop for symbol being the symbols of
;?                    (symbol-value abbrev-table)
;?                    collect symbol)
;?              (^ (x y) (string< (upcase (symbol-value x))
;?                                (upcase (symbol-value y)))))
;?        do
;?        ;; Canonical columns are 0, 15, 20, 45.
;?        (insert (format "\n%S" (symbol-name symbol))) ;abbrev
;?        (indent-to 14 1)
;?        (insert (format "%5d" (symbol-plist symbol))) ;use count
;?        (indent-to 20 1)
;?        (insert (format "%S" (symbol-value symbol)))  ;expansion
;?        (let ((lambda (symbol-function symbol)))      ;hook
;?          (when lambda
;?            (indent-to 45 1)
;?            (insert (format "%S" lambda))))
;?    )
;?  (insert "\n\n")
;?  )
;?
;?(when AMT
;?  (fset 'orig-prepare-abbrev-list-buffer
;?        (symbol-function 'prepare-abbrev-list-buffer))
;?  ;; For future hacking, use C-x C-e on this:
;?  ;; (fset 'prepare-abbrev-list-buffer 'orig-prepare-abbrev-list-buffer)
;?  (fset 'prepare-abbrev-list-buffer 'wm-prepare-abbrev-list-buffer)
;?  )

(abbrev-sort-mode 1)

;;; apropos.el

(when (< emacs-major-version 20)
  ;; For v20, this causes apropos to fail because its buffer is read-only.
  ;; Also, I got the impression that apropos makes its buffer read-only
  ;; anyway in v20, but I didn't have time to really hack.  ;? I'll want to
  ;; do something to get my view-mode working in apropos-mode for v20.
  (defadvice apropos-mode (after apropos-mode-use-view () activate)
    "Makes apropos-mode put its buffers also into view-minor-mode.
This would be an inconvenience unless \r were also undefined
in view-mode-map, to stay out of the way of ``apropos-follow''.
There is no apropos-mode-hook."
    (interactive)
    ;;Can't do (toggle-read-only 1) because then 'apropos can't write buffer!
    (view-mode 1);this ensures that view-mode-map exists before next form
    (D view-mode-map "\r" nil)))

(defadvice apropos-print (after apropos-print-select-1-window act)
  "Puts apropos output into a whole-frame window, so selection splits frame.
Without this, selecting something for help overwrites the *Apropos* window
with the *Help* window."
  (when ad-return-value
    (other-window 1)
    (delete-other-windows)
    (toggle-read-only 1)
    ;; Next message gets clobbered by (apropos-command); OK in (apropos)
    (message "%d items" (length ad-return-value))))

(defadvice apropos-command (after apropos-clobber-message act)
  "Clobbers message rendered inappropriate by (defadvice apropos-print)."
  (if ad-return-value (message "")))

;;;

(defadvice archive-find-type (around weird-magic act)
  (widen)
  (goto-char (point-min))
  (if (looking-at "PK00PK")
      (setq ad-return-value 'zip)
    ad-do-it))

(A archive-mode-hook
   (D view-mode-map "\C-m" nil)
   (L "\C-m" 'archive-extract)
   )

(auto-compression-mode 1);edits .gz files on the fly

(A bookmark-bmenu-mode-hook
   (L "\C-m" 'bookmark-bmenu-this-window))

(when (eq (what-os) 'Windows_NT)
  (! browse-url-regexp
     "\\(https?://\\|ftp://\\|www\\.\\)[^]\t\n \"'()<>[^`{}]*[^]\t\n \"'()<>[^`{}.,;]+")
  (! browse-url-browser-function
     (lambda (url)
       (unless (and url
                    (not (zerop (length url))))
         (error "No URL recognized at point."))
       (save-match-data
         (unless (string-match "^\\(ht\\|f\\)tp://" url)
           (&!2 concat "http://" url)))
       (H url)
       (shell-command (format "Cmd /c %S" (format "Start %s" url))))))

(defadvice Buffer-menu-this-window (after Buffer-menu-this-bury () act)
  "Makes RET in a buffer menu also bury the menu buffer.
This makes (switch-to-buffer (other-buffer)) more useful thereafter."
  (bury-buffer (other-buffer)))

(defadvice Buffer-menu-mouse-select (after Buffer-menu-mouse-bury-1 () act)
  "Makes mouse-selecting a buffer bury the menu & delete other windows."
  (bury-buffer (other-buffer))
  (delete-other-windows))

;;;; --------------------------- C/C++ MODE ---------------------------- ;;;;

(defun create-try-catch-block ()
  (interactive)
  (insert "
    try
        {
        }
    catch (MResult mr)
        {
        return mr;
        }
    return mrOK;
")
  )

;; Saw on Usenet that (c-initialize-cc-mode) may be needed
;; (if (>= emacs-major-version 20)).
;; Code of the form (c-get-offset '(defun-block-intro))
;; can be executed in the M-: minibuffer to query values.
;; This is an undocumented function; note that the arg must be a cons.
;; This may be more convenient: (describe-variable 'c-offsets-alist)
(A c-mode-common-hook
   ;; Remember cc-mode has its own top-level Info node.

   (c-toggle-auto-state   -1);default -1
   (c-toggle-hungry-state -1);default -1
     ;+1s there became too much of a nuisance when I'd forgotten what they
     ;did & just wanted to quickly use C-h to fix indentation.  Toggle
     ;whitespace-hungry deletion when it's wanted with C-c C-d.

   (! c-comment-continuation-stars "* ")
   (! c-echo-syntactic-information-p t);messages facilitating grokking
   (! c-electric-pound-behavior nil);don't exdent preprocessor directives
   (! c-hanging-comment-starter-p nil);
   (! c-progress-interval 1);seconds between progress messages
   (! case-replace nil)

   (L "\M-b"      'c-backward-into-nomenclature)
   (L "\C-\M-a"   'c-beginning-of-defun)
   (L "\C-\M-e"   'c-end-of-defun)
   (L "\M-f"      'c-forward-into-nomenclature)
   (L "\C-m" (I "" (end-of-line) (newline-and-indent)))
   (L (read-kbd-macro "C-c C-SPC") 'create-try-catch-block)
   (L "\C-cc\C-o" 'c-set-offset)
   (L "\C-c\C-o"  ());make global binding accessible
   (L "/"         'self-insert-command)
   (cond (HOM
          ;; These definitions let me use either snuggled-else pure-block
          ;; emulation or Mordorsoft orthodox form without toggling styles,
          ;; as long as I don't use electric braces:
          (c-set-offset 'class-open               0);default  0
          (c-set-offset 'defun-open               0);default '+
          (c-set-offset 'substatement-open        0);default '+
          )
         (AMT
          (! tab-width                            4);becomes buffer-local
          (! c-basic-offset                       4)
          (! c-hanging-comment-ender-p          nil)
          ;?(setq adaptive-fill-regexp             "[\t #'/;>?]*") ;???
          (c-set-offset 'access-label            '-)
          (c-set-offset 'func-decl-cont          '*)
          (c-set-offset 'arglist-cont            '*)
          (c-set-offset 'arglist-cont-nonempty   '*)
          (c-set-offset 'arglist-intro           '*)
          (c-set-offset 'brace-list-open         '+)
          (c-set-offset 'brace-list-intro         0);default '+
          (c-set-offset 'brace-list-close         0);default  0
          (c-set-offset 'class-close             '+);default  0
          (c-set-offset 'class-open              '+);default  0
          (c-set-offset 'cpp-macro                0);default -1000 ;? fails
          (c-set-offset 'defun-block-intro        0);default '+
          (c-set-offset 'defun-open              '+)
          (c-set-offset 'inher-intro             '*)
          (c-set-offset 'inher-cont              '+)
          (c-set-offset 'inline-open             '+)
          (c-set-offset 'inclass                  0)
          (c-set-offset 'knr-argdecl-intro       '*)
          (c-set-offset 'member-init-intro       '*)
          (c-set-offset 'member-init-cont        '*)
          (c-set-offset 'statement-block-intro    0)
          (c-set-offset 'statement-cont          '*)
          ;;(c-set-offset 'substatement-open      0);default '+
          (c-set-offset 'topmost-intro-cont      '*)
          )
         )
   (tabs 4)
   (turn-on-auto-fill)
   )

;; At AMT on Fr 31 Jul 98 using a hook containing
;;      (c-set-style                           "java")
;;      (c-set-offset 'access-label            '-)
;;      (c-set-offset 'arglist-cont-nonempty   '*)
;;      (c-set-offset 'inclass                 '+)
;;      (c-set-offset 'statement-cont          '*)
;; (note that 'inclass up there might have changed)
;; I used (cl-prettyprint c-offsets-alist) to list these values:
;;     ((access-label                  . -)
;;      (ansi-funcdecl-cont            . +)
;;      (arglist-close                 . c-lineup-arglist)
;;      (arglist-cont                  . 0)
;;      (arglist-cont-nonempty         . *)
;;      (arglist-intro                 . c-lineup-arglist-intro-after-paren)
;;      (block-close                   . 0)
;;      (block-open                    . 0)
;;      (brace-list-close              . 0)
;;      (brace-list-entry              . 0)
;;      (brace-list-intro              . 0)
;;      (brace-list-open               . +)
;;      (c                             . c-lineup-C-comments)
;;      (case-label                    . 0)
;;      (class-close                   . +)
;;      (class-open                    . +)
;;      (comment-intro                 . c-lineup-comment)
;;      (cpp-macro                     . -1000)
;;      (defun-block-intro             . 0)
;;      (defun-close                   . 0)
;;      (defun-open                    . +)
;;      (do-while-closure              . 0)
;;      (else-clause                   . 0)
;;      (friend                        . 0)
;;      (inclass                       . ++)
;;      (inher-cont                    . c-lineup-multi-inher)
;;      (inher-intro                   . 0)
;;      (inline-close                  . 0)
;;      (inline-open                   . ++)
;;      (knr-argdecl                   . 0)
;;      (knr-argdecl-intro             . 0)
;;      (label                         . 0)
;;      (member-init-cont              . 0)
;;      (member-init-intro             . 0)
;;      (objc-method-args-cont         . c-lineup-ObjC-method-args)
;;      (objc-method-call-cont         . c-lineup-ObjC-method-call)
;;      (objc-method-intro             . -1000)
;;      (statement                     . 0)
;;      (statement-block-intro         . 0)
;;      (statement-case-intro          . +)
;;      (statement-case-open           . +)
;;      (statement-cont                . *)
;;      (stream-op                     . c-lineup-streamop)
;;      (string                        . -1000)
;;      (substatement                  . +)
;;      (substatement-open             . +)
;;      (topmost-intro                 . -)
;;      (topmost-intro-cont            . 0))
;; Formatting is facilitated by (sort-lines) &
;; (setq last-kbd-macro (read-kbd-macro
;;   "C-e C-r . C-SPC C-e C-w C-a 39*<C-right> C-y C-a C-n C-e"))

;; Here are the defaults (cc-mode version 4.282 as included in 19.34.1);
;; this is useful because it contains suggestions for alternatives,
;; & quickly shows how to achieve variations.
;; (defvar c-offsets-alist
;;   '((string                . -1000)
;;     (c                     . c-lineup-C-comments)
;;     (defun-open            . 0)
;;     (defun-close           . 0)
;;     (defun-block-intro     . +)
;;     (class-open            . 0)
;;     (class-close           . 0)
;;     (inline-open           . +)
;;     (inline-close          . 0)
;;     (ansi-funcdecl-cont    . +)
;;     (knr-argdecl-intro     . +)
;;     (knr-argdecl           . 0)
;;     (topmost-intro         . 0)
;;     (topmost-intro-cont    . 0)
;;     (member-init-intro     . +)
;;     (member-init-cont      . 0)
;;     (inher-intro           . +)
;;     (inher-cont            . c-lineup-multi-inher)
;;     (block-open            . 0)
;;     (block-close           . 0)
;;     (brace-list-open       . 0)
;;     (brace-list-close      . 0)
;;     (brace-list-intro      . +)
;;     (brace-list-entry      . 0)
;;     (statement             . 0)
;;     ;; some people might prefer
;;     ;;(statement             . c-lineup-runin-statements)
;;     (statement-cont        . +)
;;     ;; some people might prefer
;;     ;;(statement-cont        . c-lineup-math)
;;     (statement-block-intro . +)
;;     (statement-case-intro  . +)
;;     (statement-case-open   . 0)
;;     (substatement          . +)
;;     (substatement-open     . +)
;;     (case-label            . 0)
;;     (access-label          . -)
;;     (label                 . 2)
;;     (do-while-closure      . 0)
;;     (else-clause           . 0)
;;     (comment-intro         . c-lineup-comment)
;;     (arglist-intro         . +)
;;     (arglist-cont          . 0)
;;     (arglist-cont-nonempty . c-lineup-arglist)
;;     (arglist-close         . +)
;;     (stream-op             . c-lineup-streamop)
;;     (inclass               . +)
;;     (cpp-macro             . -1000)
;;     (friend                . 0)
;;     (objc-method-intro     . -1000)
;;     (objc-method-args-cont . c-lineup-ObjC-method-args)
;;     (objc-method-call-cont . c-lineup-ObjC-method-call)
;;     )

;;;; --------------------- CALENDAR & DIARY HOOKS ---------------------- ;;;;

;; There are several hook variables with nonalphabetical names (see Info)).

(unless DUP
  (display-time);needed for appointments in 19.34.1
  (require 'appt);Not documented as needed, but needed in fact for 'add-appt
  )

(add-hook 'diary-hook 'appt-make-list)

(defun wm-appt-remove-astronomy ()
  "Bug workaround: remove astronomical events from appointment list."
  (M appt appt-time-msg-list
    (when (string-match "(P[SD]T)" (nth 1 appt))
      ;; Only the astronomical functions put the time zones in their entries.
      ;; Unfortunately other words like "Moon" get stripped someplace.
      (callf2 delq appt appt-time-msg-list))))

(add-hook 'diary-hook 'wm-appt-remove-astronomy t)

;;? (add-hook 'calendar-load-hook 'european-calendar)
;;?   ;Hack european-date-diary-pattern if that's not good enough
;;? It wasn't good enough, & neither was the hack.  See below for why
;;? this leaves american-calendar as a better choice.  [Well, no, actually.
;;? This documentation is such a palimpsest of separated-by-distracted-months
;;? contradictions that I can't afford the time to sort it out.]

;;? Both of these fail to allow leading daynames:
;;?   (hsup european-date-diary-pattern
;;?          '(backup "[SMTWF][uoehra] " day " *" monthname "\\W+\\<[^*0-9]"))
;;?   (hsup european-date-diary-pattern
;;?          '("[SMTWF][uoehra] " day " *" monthname "\\W+\\<[^*0-9]"))
;;? Because I assume I can solve this problem eventually, I'm sticking with
;;? European calendars, even tho with this unsolved they're very inconvenient
;;? for the display of weekdays.  Considering I'll typically have a calendar
;;? in front of my face when I'm looking at the diary this may not matter.
;;? Probably the best hack is directly on the ELisp, allowing 2-char
;;? abbreviations of dayname wherever 3-char are allowed now.

;;? These lines
;;?   Thu 17 July dummy entry #1
;;?   Fri 17 July dummy entry #2
;;? display without the dayname.  The first dayname is correct, & there's
;;? no warning about the error on the next line; instead, it displays
;;? only on Fr 18, without warning that something's wrong.  This suggests
;;? that without significant hacking of the original ELisp it'd be a bad
;;? idea to integrate daynames into dates.  However, appending them as
;;? 2-letter abbreviations is nice, because then they display as part of
;;? the fancy diary display, & errors are instantly apparent.

;;? Given that I'll have dayname trailing, american-calendar makes more sense,
;;? since it puts the dayname nearer the date, & also allows lexical sorting.

;;? However, I later found that I could use degenerate cyclic entries for
;;? some of my needs, & american-calendar requires a comma before the year
;;? & doesn't work for lexical sorting anyway if month names are used (as I
;;? prefer), so I'd rather use the European style to which I'm accustomed
;;? & thereby eliminate the comma cruft.

(add-hook 'calendar-load-hook 'european-calendar)
  ;; At least once that didn't work, & I needed M-x european-calendar to get
  ;; new diary entries recognized.
(defvar calendar-load-hook-was-run nil "Whether 'calendar-load-hook was run.")
;;?? I'm not sure these holidays work; test after reload.  ... They fail.
;;?? The hook does run now that I explicitly run it by hand.
;;?? The (holiday-float)s are probably illformed; I don't know what the
;;DAYNAME parameter should be.  A string?  What format?
(A calendar-load-hook
   (setq calendar-load-hook-was-run t)
   ;; These mappings used to be scroll-calendar-{left,right}-three-months:
   (D calendar-mode-map "\C-v" 'scroll-calendar-left)
   (D calendar-mode-map "\M-v" 'scroll-calendar-right)
   (setq other-holidays
         '(
           (holiday-float 04 0 1 "Switch to Daylight Savings Time")
           (holiday-fixed 10 10 "National Metric System Day")
           (holiday-float 10 0 -1 "Switch to Standard Time")
           )))

;; My dotemacs.el contains
;;    (defvar calendar-load-hook-was-run nil
;;       "Whether 'calendar-load-hook was run.")
;;    (add-hook 'calendar-load-hook (^ ()
;;       (setq calendar-load-hook-was-run t)))
;; & calendar.el contains
;;    (run-hooks 'calendar-load-hook)
;;    (provide 'calendar)
;; at the end.  (featurep 'calendar) = t; calendar-load-hook-was-run =
;; nil.  I think this proves something's wrong with running hooks under
;; 19.34.1, which I've been suspecting for a long time.  But note that I
;; solved this problem for view mode with (run-hooks 'view-mode-hook),
;; & solved the same problem for an earlier calendar need with another
;; explicit call to run-hooks.  So what's probably really wrong is run-hooks
;; during autoloads.
;;
;; To solve this problem for calendar for 19.34.1, the run-hooks is explicit
;; where (calendar) is run, after the desktop is loaded.

(add-hook 'diary-display-hook 'fancy-diary-display)
;; That makes accidentally editing a selective display impossible.  For no
;; diary display, set the hook to '(ignore), or
;; (! view-diary-entries-initially nil).

(add-hook 'list-diary-entries-hook 'sort-diary-entries)

(add-hook 'today-visible-calendar-hook 'calendar-star-date)

(M f [insert-cyclic-diary-entry insert-diary-entry]
  (eval `(defadvice ,f (after move-to-top act)
           "Put line inserted in diary at top of diary instead of end."
           (let* ((dot-end (point))
                  (entry (progn (beginning-of-line)
                                (buffer-substring (point) dot-end))))
             (delete-region (point) dot-end)
             (goto-char (point-min))
             (insert entry)))))

(defadvice insert-diary-entry (after include-dayname act)
  "Include dayname in inserted entry."
  (insert (wm-format-time-string "%a ")))

;; I think this code, from appt.el::(appt-check)
;;          ;; At the first check after 12:01am, we should update our
;;          ;; appointments to today's list.
;;
;;          (if (and (>= cur-comp-time 1)
;;                   (<= cur-comp-time appt-display-interval))
;;              (if (and view-diary-entries-initially appt-display-diary)
;;                  (diary)
;;                (let ((diary-display-hook 'appt-make-list))
;;                  (diary))))
;; causes a fuckup with appointments.  It's locally overriding
;; diary-display-hook's value.  After
;;   (let ((diary-display-hook 'appt-make-list)) (diary))
;; is executed in the (eval-expression) minibuffer, the diary is left
;; selectively displayed without ellipses in a not-currently-visible buffer,
;; which gets very confusing when later browsing to that buffer.  Also, a
;; "Preparing diary..." message is printed that has no corresponding
;; "Preparing diary...done" message.  I think this bug has gone undetected
;; for so long because it's controlled by an if that for most people will be
;; t, so they won't execute the goofy code.  I had set
;; view-diary-entries-initially to nil so my (calendar) binding would just
;; put a calendar in a separate window, but that now seems to be more trouble
;; than it's worth; instead, I should leave view-diary-entries-initially t,
;; which gives me a normal display @ midnight (actually preferable), & create
;; my own wrapper for (calendar) that gives the simple display I want.

;; As part of setting that up, I had this
;;
;;   ;; There is no calendar-mode-hook in v19.34, so:
;;
;;   (defadvice calendar-basic-setup (after calendar-other-window act)
;;     (other-window 1))
;;
;; in here, but if the diary is in fact displayed, then it's better to be in
;; the calendar window than the diary window; so (other-window)ing should
;; be done in the wrapper function.

;;;END OF CALENDAR & DIARY HOOKS

(column-number-mode 1);puts column (origin 0) on mode line

;; comint-mode: see shell-mode

(M f [describe-function
      describe-key
      describe-variable
      view-lossage]
  (eval `(defadvice ,f (around shrink-if-larger act)
           (delete-windows-on (get-buffer "*Help*"))
           ad-do-it
           (shrink-window-if-larger-than-buffer (next-window)))))

;; This
;;   (add-hook 'desktop-save-hook '(lambda ()
;;     (desktop-truncate search-ring 3)
;;     (desktop-truncate regexp-search-ring 3)))
;; looked like a good idea, but "Use the Source, Luke": 'desktop-truncate
;; actually operates destructively directly on the named list, so it
;; doesn't just affect what goes in the desktop, but the entire Emacs
;; session.  That lambda belongs in kill-emacs-hook.

;;;; --------------------------- DIRED HACKS --------------------------- ;;;;

(defun dired-mouse-find-file (event)
  "In dired, visit the file or directory name you click on."
  ;; Only dired-mouse-find-file-other-window is orthodoxily defined.  BUG!
  ;; It's poor functional decomposition: dired-mouse-find-file-noselect
  ;; should be the base function, as is done in other Emacs packages.
  (interactive "e")
  (let (file)
    (save-excursion
      (set-buffer (window-buffer (posn-window (event-end event))))
      (save-excursion
        (goto-char (posn-point (event-end event)))
        (setq file (dired-get-filename))))
    (select-window (posn-window (event-end event)))
    (find-file (file-name-sans-versions file t))))

(defun wm-dired-insert-subdir-if-this-line-is-one ()
  ;; To be invoked from `dired-map-over-marks'.
  (let ((f (dired-get-filename)))
    (when (file-directory-p f)
      (dired-insert-subdir f ""))))

(defun wm-dired-insert-marked-dirs ()
  "For all marked lines that are directories, do dired `i' on them."
  (interactive)
  (require 'dired-aux)
  (dired-map-over-marks
      (wm-dired-insert-subdir-if-this-line-is-one)
    nil))

(A dired-load-hook
   (D dired-mode-map [mouse-2] 'dired-mouse-find-file)
   (D dired-mode-map "\M-o" nil);for local orthodox mappings
   (D dired-mode-map "\M-o\M-g" 'dired-goto-file)
       ;my global M-g is `call-global-binding-of'
   (D dired-mode-map "\M-g" nil)
   (D dired-mode-map "\M-o\M-o" 'dired-omit-toggle)
   (D dired-mode-map "\M-oI" 'dired-info)
   (D dired-mode-map "I" 'wm-dired-insert-marked-dirs)

   (defadvice desktop-buffer-dired (before dired+desktop-bugfix act)
     (require 'dired-aux);for dired-insert-subdir
     ;; desktop-buffer-dired only invokes dired-insert-subdir if one of the
     ;; dired buffers saved on the desktop contains multiple dirs.  I'm not
     ;; surprised nobody's hit this before.  I don't much like this fix,
     ;; either; would an autoload suffice?
     ;;? Send a bug report if this is still a bug in 20.
     (ad-disable-advice 'desktop-buffer-dired 'before 'dired+desktop-bugfix)
     (ad-activate 'desktop-buffer-dired))

   (setq dired-font-lock-keywords
         (list
          ;; Directory headers.
          (list dired-subdir-regexp '(1 font-lock-function-name-face))
          ;; We make heavy use of MATCH-ANCHORED, since the regexps don't
          ;; identify the file name itself.  We search for Dired defined
          ;; regexps, and then use the Dired defined function
          ;; `dired-move-to-filename' before searching for the simple regexp
          ;; ".+".  It is that regexp which matches the file name.
          ;;
          ;; Dired marks.
          (list dired-re-mark
                '(0 font-lock-emphasized-face)
                '(".+" (dired-move-to-filename)
                  nil (0 font-lock-emphasized-face)))
          ;; Files that are group or world writable.
          ;;? (This is meaningless under NT with 19.34.6.)
          ;;? (list (concat dired-re-maybe-mark dired-re-inode-size
          ;;?               "\\([-d]\\(....w....\\|.......w.\\)\\)")
          ;;?       '(1 font-lock-variable-name-face)
          ;;?       '(".+" (dired-move-to-filename)
          ;;?         nil (0 font-lock-variable-name-face)))
          ;;
          ;; Subdirectories.
          (list dired-re-dir
                '(".+" (dired-move-to-filename)
                  nil
                  (0 font-lock-string-face)))
          ;;
          ;; Symbolic links.
          (list dired-re-sym
                '(".+" (dired-move-to-filename) nil
                  (0 font-lock-keyword-face)))
          ;;
          ;; Files suffixed with `completion-ignored-extensions'.
          '(eval .
            (let ((extensions (mapcar 'regexp-quote
                                      completion-ignored-extensions)))
              ;; It is quicker to first find just an extension, then go
              ;; back to the start of that file name.  So we do this
              ;; complex MATCH-ANCHORED form.
              (list (concat "\\("
                            (mapconcat 'identity
                                       extensions
                                       "\\|")
                            "\\|#\\)$")
                    '(".+" (dired-move-to-filename)
                      nil (0 font-lock-comment-face)))))))
   )

(A dired-mode-hook
   (if WIN (turn-on-font-lock))
   )

(defun ls-lisp-cons-is-dir (cons)
  "Return whether CONS, which is (FILE . FILE-ATTRIBUTES), is a directory."
  ;; The zeroth attribute returned by `file-attributes' is t for directories.
  (eq (cadr cons) t))

(defadvice ls-lisp-handle-switches (after dirs-first act)
  "Make dired put directories first."
  (! ad-return-value
     (sort ad-return-value (lambda (x y)
                             (and (ls-lisp-cons-is-dir x)
                                  (not (ls-lisp-cons-is-dir y)))))))

;;; End of dired hacks

;;;; ---------------------- emacs-lisp-mode-hook ----------------------- ;;;;

(defun create-elisp-heading (P s)
  "Insert heading of form \";;;;; *** MAJOR HEADING *** ;;;;;\" into buffer.
With prefix arg, insert heading of form \";;;; --- MINOR HEADING --- ;;;;\"."
  (interactive "P\nsHeading text: ")
  (let* ((semi (make-string (if P 4 5) ?\;))
         (line (make-string (/ (- fill-column
                                  (length s)
                                  (* (length semi) 2)
                                  4) ;1 space on each side of each line
                               2)
                            (if P ?- ?*)))
         (target-column (- fill-column (if P 5 6))))
    (forward-line 0)
    (insert semi 32 line 32 (upcase s) 32 line)
    (when (< (current-column) target-column)
      (insert (if P ?- ?*)))
    (insert 32 semi 10)))

(defun insert-failure-abend ()
  "Insert into Emacs Lisp code an (error ...) call uniquified by timestamp."
  ;; Obviously what I really want are __FILE__ and __LINE__ <sigh>.
  (interactive)
  (insert (format-time-string "(error \"Internal failure %y/%m/%d/%w %T\")")))

(defun turn-on-eldoc-mode-if-available ()
  (ignoring (file-error)
    (require 'find-func)) ;default locate-library shows unwanted message
  (when (and (locate-library "eldoc")
             (or (>= emacs-major-version 20)
                 (and (locate-library "cust-stub")
                      (require 'cust-stub))))
    (require 'eldoc)
    (eldoc-mode 1)
    (when (or ISP HER)
      (eldoc-schedule-timer)
      (remove-hook 'post-command-hook 'eldoc-schedule-timer))))

(defun wm-back-to-lisp-fill-prefix ()
  "Like back-to-indentation, but also skips any leading comment chars."
  (interactive)
  (beginning-of-line)
  (skip-syntax-forward "-<"));whitespace, comment-starter

(defun wm-lisp-fill-region (start end)
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (lisp-fill-paragraph)))

(defun wm-emacs-lisp-byte-compile-and-load-safely ()
  "Do emacs-lisp-byte-compile-and-load while advices are deactivated."
  ;; From the documentation in advice.el:
  ;;   IMPORTANT: With Advice loaded always do `M-x ad-deactivate-all'
  ;;   before you byte-compile a file, because advised special forms and
  ;;   macros can lead to unwanted compilation results. When you are done
  ;;   compiling use `M-x ad-activate-all' to go back to the advised state
  ;;   of all your advised functions.
  (interactive)
  (require 'advice)
  (ad-deactivate-all)
  (unwind-protect
      (emacs-lisp-byte-compile-and-load)
    (ad-activate-all)))

(A emacs-lisp-mode-hook ;For C-x C-e: (setq emacs-lisp-mode-hook ())
   (auto-fill-mode 1)
   (setq comment-column 7)
   (setq mode-name "ELisp")
   (set (make-local-variable 'track-eol) t);default nil; useful with C-x C-e
   (setq case-replace nil)
   (turn-on-eldoc-mode-if-available)
   (modify-syntax-entry ?{ "(}")
   (modify-syntax-entry ?} "){")
   (M s [paragraph-start paragraph-separate] (set s "[ \t]*$"))
   (L [?\M-?]    'grok)
   (L "\C-c\C-f" 'insert-failure-abend)
   (L "\C-c\C-h" 'create-elisp-heading)
   (L "\C-cJ"    (I "P" (P)
                    (let ((dotemacs (equal (buffer-name) "dotemacs.el")))
                      (find-file "~/elisp/junk.el")
                      (when dotemacs
                        (goto-char (dot-max))
                        (backward-page)
                        (previous-line 1)))))
   (L "\M-m"     'wm-back-to-lisp-fill-prefix)
   (L [C-f8]     'wm-emacs-lisp-byte-compile-and-load-safely)
   (tabs 3 5)
   )

(A lisp-interaction-mode-hook
   (run-hooks 'emacs-lisp-mode-hook))

;;;; ------------ HACKS RELATED TO DEFINITIONS IN FILES.EL ------------- ;;;;

;; find-file-hooks is hacked in the context of view-mode.
;; Other hacks to it could go here.

(fset 'orthodox-make-backup-file-name
      (symbol-function 'make-backup-file-name))

(defun wm-calculate-backup-file-name (file)
  "Return the backup file to be associated with FILE.
There are no side effects such as creating nonexistent directories,
and the filename is not abbreviated.  See `wm-make-backup-file-name'."
  (let* ((file-dir (abbreviate-file-name (or (file-name-directory file)
                                             default-directory)))
         ;; Using default-directory is necessary there because
         ;; 'file-name-directory returns nil on a relative path.  I assume
         ;; this is why orthodox (find-backup-file-name "gug") fails.
         (backup-dir (concat file-dir "Bak/")))
    (concat backup-dir (file-name-nondirectory file))))

(defun wm-make-backup-file-name (file)
  "Intended for (fset 'make-backup-file-name 'wm-make-backup-file-name).
Returns calculated backup file name & also ensures it's valid by creating
its directory if necessary."
  (let* ((backup-name (wm-calculate-backup-file-name file))
         (backup-dir (file-name-directory backup-name)))
    (or (file-directory-p backup-dir)
        (make-directory   backup-dir)
        ;; Creating parents shouldn't be necessary, so it's better not to
        ;; enable it; if 'make-directory barfs then something's wrong.
        )
    backup-name))

(defun bak-p (file)
  "Intended for (fset 'backup-file-name-p 'bak-p)."
  ;; Dired.el[2040] v19.34.1 doesn't call backup-file-name-p unless the final
  ;; char of the file name looks like it might be appropriate for that; this
  ;; is claimed needed for efficiency.  Therefore, some dired functions
  ;; won't work right with the new format.  Egrep reveals no other grief,
  ;; & I've never used those dired functions.
  (string-match "Bak[/\\]" file))

(when (not ISP)
  ;; On an ISP shell I'll stick with the orthodox "~" appended to the
  ;; extension, since those shells are usually Unices where the "extension"
  ;; has little meaning to the OS, & directories take expensive disk space.
  (fset 'make-backup-file-name 'wm-make-backup-file-name)
  (fset 'backup-file-name-p 'bak-p))

(add-hook 'after-revert-hook 'hack-local-variables)

;;;END OF HACKS RELATED TO DEFINITIONS IN files.el

;; This looked like a good idea
;;   (defadvice find-function-on-key (after ffok-this-window act)
;;     "Cause find-function-on-key to select in this window instead of other."
;;     (if (bufferp ad-return-value) (delete-other-windows)))
;; but it messes up the positioning of point.

(require 'fastfuzz) ;for timelog, which (require)s inside (eval-when-compile)

;; This hack was suggested by a thread in the NT Emacs mailing list.

(A font-lock-mode-hook
   (if AMT
       (custom-set-faces ;? not available on HER; why not?
        '(my-tab-face            ((((class color)) (:background "Khaki"))) t)
        '(my-trailing-space-face ((((class color)) (:background "Cyan"))) t))
     (font-lock-make-face '(my-tab-face nil "Yellow"))
     (font-lock-make-face '(my-trailing-space-face nil "White")))

   (setq font-lock-keywords
         (append font-lock-keywords
              '(("\t+" (0 'my-tab-face t))
                ("[ \t]+$" (0 'my-trailing-space-face t)))))
   )

(defadvice font-lock-mode (after run-the-fucking-hooks-dammit act)
  "For some reason 19.34.06 keeps giving me a problem with this."
  (when font-lock-mode ;if it was turned on rather than off
    (run-hooks 'font-lock-mode-hook)))

(add-hook 'gnus-summary-mode-hook 'gnus-pick-mode)

;;? This doesn't work:
;?(defadvice gnus-article-goto-next-page (around start-next-at-top-duh act)
;?  "Advice replaces original with one that starts next article at top."
;?  (when (gnus-article-next-page)
;?    (beginning-of-buffer)
;?    (gnus-article-read-summary-keys nil (gnus-character-to-event ?n))
;?    (beginning-of-buffer)
;?    ))

(when AMT
  (require 'gnuserv)
  (gnuserv-start)
  (defadvice server-make-window-visible (around lose32 act)
    "Adapt gnuserv to Windows."
    (if (memq window-system '(win32 w32)) ;feh
        (raise-frame)
      ad-do-it)))

(A gomoku-mode-hook
   (set (make-local-variable 'jiggle-enabled) nil)
   (when nil
     (when window-system
       (font-lock-make-face '(gomoku-font-lock-X-face "Blue"))
       (turn-on-font-lock))
     )
   )

;; 19:34 (hack-local-variables) fails in indirect buffers.  The failure is in
;; the form (y-or-n-p (format "Process `eval' or hook local variables in file
;; %s? " (file-name-nondirectory buffer-file-name))).

(defadvice hack-local-variables (around spoof-indirect-file-name act)
  "For indirect buffers, pretend the visited file is the base buffer's."
  (let* ((buffer-file-name (or buffer-file-name
                               (buffer-file-name (buffer-base-buffer)))))
    ad-do-it))

(add-hook 'hexl-mode-hook 'hexl-follow-ascii)

(defadvice Info-directory (after goto-first-reference act)
  "When bringing up the Info directory, put dot on first reference."
  (Info-next-reference))

;; ghali@persephone.dgp (Sherif Ghali) writes:
;;
;; I have this in my .emacs.  I believe it would be a useful standard
;; addition to emacs.
;;
;; Redefine indent-for-comment to kill the comment with negative prefix
(defadvice indent-for-comment (around kill-comment activate)
  "Kill the comment with negative prefix."
  (if (eq current-prefix-arg '-)
      (kill-comment nil)
    ad-do-it))

(A indented-text-mode-hook
   (setq mode-name "IndTxt")
   ;; STOP!  Before you add anything to this hook, thimk about whether it
   ;; shouldn't be in text-mode-hook instead, which is also run in all
   ;; Indented Text buffers.
   )

(add-hook 'Info-mode-hook (^ ()
  (D Info-mode-map [S-tab] 'Info-prev-reference)
    ;On legacy keyboards use <Esc><Tab> to generate M-TAB, the orthodox
    ;mapping.  On Windows <Alt-Tab> has a system meaning, but <Ctrl-Alt-i>
    ;generates M-TAB, which works.  The <Ctrl-i>/<Ctrl-Alt-i> pair is very
    ;convenient for nagivating; so is <Ctrl-i>/<Ctrl-p>.
  (D Info-mode-map [tab] 'Info-next-reference)
    ;Needed because I globally remap [tab].
  (D Info-mode-map [?j] 'wm-scroll-up-half-screen)
  (D Info-mode-map [?k] 'wm-scroll-down-half-screen)
  ))

(defadvice insert-register (after leave-dot-after-register-insertion act)
  "After insert-register, leave point after instead of before insertion."
  (exchange-point-and-mark))

(defun isearch-scroll-other-window ()
  "Allow scrolling up the display produced by isearch-mode-help."
  (interactive);Args aren't supported by canonical 19.34.1 isearch
  (scroll-other-window)
  (isearch-update))

(defun isearch-scroll-other-window-down ()
  "Allow scrolling down the display produced by isearch-mode-help."
  (interactive);Args aren't supported by canonical 19.34.1 isearch
  (scroll-other-window-down nil);19.34.1 requires the nil
  (isearch-update))

(add-hook 'isearch-mode-hook (^ ()
  'nonstandard-indentation
  (D isearch-mode-map "\e\C-v" 'isearch-scroll-other-window)
  (D isearch-mode-map "\e\e\C-v" 'isearch-scroll-other-window-down)
  (D isearch-mode-map "\C-z" 'isearch-edit-string)
  ;;I tried C-x but wanted easy access to "\C-xb".
  (D isearch-mode-map "\M-c" 'isearch-toggle-case-fold)
  ;;I tried C-c but wanted easy access to "\C-c\C-l".
  ;;"\C--" gives "Invalid modifier in string", whereas "\C-_" denotes ?\37.
  ;;That's no problem on terminals that can't distinguish C-_ from C--, but
  ;;under Windows they're different, & C-- isn't Ascii & can't go in the map.
  (D isearch-mode-map "\C-j" 'isearch-exit)
  ;;That prevents the previous function of C-j, which was to be accepted
  ;;as a printing char that matches EOL, from being performed, in return
  ;;for slightly easier typing; I think it's worth it.  You can get a literal
  ;;C-j into the search string by using C-q, which calls isearch-quote-char.
  ;;Note this remapping confuses the help screen, which has LFD hardwired.
  (D isearch-mode-map "\C-^" 'isearch-other-control-char)
  (D isearch-mode-map "\M-r" 'isearch-toggle-regexp)
  ))

(defadvice isearch-mode-help (after isearch-improve-help activate)
  "Append additional information to isearch-mode-help's *Help*."
  (interactive)
  (save-excursion
    (set-buffer "*Help*")
    (goto-char (point-max))
    (insert (substitute-command-keys "

THAT'S THE END OF THE CANONICAL HELP; THE FOLLOWING IS (defadvice)D IN.

There's a bogosity in that help; most of that keymap documentation is
generated using the canonical \\=\\[whatever] form, but the line reading
  Type LFD (C-j) to match end of line.
is hardwired in, so of course that's one I remapped.  In orthodox Emacs,
you type C-m to exit the isearch; I allow either that or C-j.  To get a
literal C-j into the string, type \\[isearch-quote-char] C-j.

There are additional commands omitted from 19.34.1 isearch-mode-help:
\\<isearch-mode-map>
Type \\[isearch-toggle-case-fold] to toggle case folding.
Type \\[isearch-toggle-regexp] to toggle regexps (but note that you can just type C-u \\<global-map>\\[isearch-forward]
 or even \\[isearch-forward-regexp]\\<isearch-mode-map> to start in regexp mode).
Type \\[isearch-edit-string] to edit the search string.  That editing
 has its own keymap, as follows:
\\<minibuffer-local-isearch-map>
   \\[exit-minibuffer] to resume incremental searching with the edited string.
   \\[isearch-nonincremental-exit-minibuffer] to do one nonincremental search.
   \\[isearch-forward-exit-minibuffer] to resume isearching forward.
   \\[isearch-reverse-exit-minibuffer] to resume isearching backward.
   \\[isearch-ring-advance-edit] to replace the search string with the next item in the search ring.
   \\[isearch-ring-retreat-edit] to replace the search string with the previous item in the search ring.
   \\[isearch-complete-edit] to complete the search string using the search ring.
\\<isearch-mode-map>
If the first char entered after \\[isearch-edit-string] is \\[isearch-yank-word], then, after the
\\<minibuffer-local-isearch-map>\\[exit-minibuffer]\\<isearch-mode-map> that terminates the string editing, the search will be for
a complete word matching the string; but it's still an incremental search,
so you can then keep adding to the word.  (I didn't design this.)"))))

(A jiggle-setup-hook
   (nconc jiggle-postponed-during '(find-function-or-tag
                                    my-second-function)))

(require 'jiggle)
;; That's not inside (when (not ISP)) because I need the buffer-switch-hook.
(when (not ISP)
  (jiggle-mode 1)
  (jiggle-searches-too 1))

(A kill-emacs-query-functions
   ;; I hate it when most programs do this, but Emacs is special, & it takes
   ;; 30 s to load on my home machine, & C-x C-v is too dangerous:
   (y-or-n-p "Really kill Emacs? "))

(A kill-emacs-hook
  (desktop-truncate search-ring 3)
  (desktop-truncate regexp-search-ring 3)
  ;;This fails:
  ;;  (let ((to-do-buffer (find-buffer-visiting to-do-file-name)))
  ;;    (if to-do-buffer (kill-buffer to-do-buffer)))
  ;;    ;since it has an eval desktop doesn't know not to prompt me about
  ;;Put (error "Aborting kill.") here & it confirmed that 'kill-buffer works.
  ;;Oh, I get it: this hook is consed to kill-emacs-hook *before* desktop
  ;;is required below, so the desktop hook is consed on to the front, &
  ;;runs before my hook.  Grrr.  Use desktop-*-not-to-save variable instead.
  )

(defadvice imenu--make-index-alist (after imenu-sort act)
  (callf sort ad-return-value
    (lambda (x y)
      (string< (car x)
               (car y)))))

(add-hook 'mail-setup-hook 'mail-abbrevs-setup)
(add-hook 'mail-setup-hook (^ ()
  ;This replaces dangerous "send" keymappings with harder-to-type ones.
  (D mail-mode-map "\C-c\C-c" nil)
  (D mail-mode-map "\C-cC" 'mail-send-and-exit)
  (D mail-mode-map "\C-c\C-s" nil)
  (D mail-mode-map "\C-cS" 'mail-send)
  ))

(A makefile-mode-hook
   (L "\M-n" ())
   (L "\M-p" ())
   )

(mapcarX (eval `(defadvice ,X (after mark-then-swap act)
                  "After mark-[object] put dot at end, mark at beginning."
                  (exchange-dot-and-mark)))
         ;; This enables me to mark the first of a series of objects I want
         ;; to select, then just select the rest with (forward-[object]).
         [mark-c-function
          mark-defun
          mark-page
          mark-paragraph
          mark-sexp
          mark-word
          ])

;;;; ------------------------ MINIBUFFER STUFF ------------------------- ;;;;

(defun propagate-overwrite-mode ()
  "Set overwrite-mode in this buffer to what it was in the previous one."
  (let (o)
    (save-excursion
      (set-buffer (other-buffer nil 'visible-ok))
      (setq o (if overwrite-mode 1 0)))
    (overwrite-mode o))
  (appropriate-cursor))
;; Now I want to use that to propagate overwrite-mode into the minibuffer.
;; Adding it to minibuffer-setup-hook is intuitive, but grokking adding it to
;; minibuffer-exit-hook requires realizing that that hook is run *before* the
;; minibuffer is actually exited.  So it switches to the other buffer, which
;; is where we'll exit to after the hook has run, copies overwrite-mode
;; thence to the minibuffer, & runs appropriate-cursor in the minibuffer,
;; setting the cursor in a manner therefore also appropriate for the other
;; buffer; then it exits to the other buffer, & the cursor is appropriate.
(mapcar (^ (h) (add-hook h 'propagate-overwrite-mode))
        '(minibuffer-setup-hook minibuffer-exit-hook))

(resize-minibuffer-mode 1)
  ;Note that that has no effect on the echo area, which occupies the
  ;same location as the minibuffer, & contains the output of 'message
  ;invocations; the echo area always displays linefeeds using the "\\n"
  ;notation (GNU 19.34), & the only way to see a multiline message *as*
  ;a multiline message is to switch to the *Messages* buffer.

;; Posted to Usenet by Franklin Lee <flee@lehman.com>:
(defadvice next-history-element (after end-nhe act)
  "Forces point to be at the end instead of at the beginning of prompt."
  (goto-char (point-max)))

;;; outline.el & noutline.el

(when (< emacs-major-version 20)
  (require 'noutline)) ;useful with indirect buffers.

(add-hook 'outline-minor-mode-hook (^ ()
  (D outline-mode-prefix-map [H-h] (I ""
    (with-output-to-temp-buffer "*Help*"
      (princ (concat "Here's the documentation for outline-mode, a major mode.
You're in outline-minor-mode now, & the keys documented here
require a prefix of " outline-minor-mode-prefix " instead of just ^C.\n\n"))
      (princ (documentation 'outline-mode)))))
  ;; Under 19.34, selective display can't be used with outline-minor-mode.
  ;; Globally, I use C-c [02] to set selective display to 0 respectively 2
  ;; for files that have only header-type lines flush left;
  ;; in outline minor mode, the following mappings are equivalent.
  (D outline-minor-mode-map [?\C-c ?\C-0] 'show-all)
  (D outline-minor-mode-map [?\C-c ?\C-2] 'hide-body)
  (! line-move-ignore-invisible t)
  ;; I've read the noutline.el code that's supposed to hack
  ;; line-move-ignore-invisible, but under 19.34.6 it seems to NOP.
  ))

(when WIN
  (require 'paren)
  ;; That was enough under Emacs 19, but 20 will require this, I'm told:
  (show-paren-mode 1))

(A perl-mode-hook
   ;; AFAICT the only reason for the silly orthodox syntax is font-lock;
   ;; I'd rather have syntax optimized for {,d}abbrev.
   (tabs 2)
   (M c "$@&" (modify-syntax-entry c "w"))
   (fset 'true-perl-mode (symbol-function 'perl-mode))
   (unwind-protect
       (require 'cperl-mode) ;I use features of it tho not the mode itself
     (fset 'perl-mode (symbol-function 'true-perl-mode)))
   (set (make-local-variable 'fill-paragraph-function) 'cperl-fill-paragraph)
   ;(perl-mode-map ";" 'self-insert-command)
   (L ";" 'self-insert-command)
   (L "\C-c\C-c\C-l" 'cperl-lineup)
   (L "\C-c\C-f" (I "P" (P) (if P (call-interactively 'cperl-info-on-command)
                              (cperl-info-on-current-command))))
   (cperl-lazy-install)
   )

(defadvice picture-mode (before picture-save-tabs act)
  "Save local tab stops before clobbering them."
  ;; Save in a local so picture-mode works concurrently in multiple buffers.
  (interactive)
  (set (make-local-variable 'picture-old-tab-stop-list) tab-stop-list))

(defadvice picture-mode-exit (after picture-restore-tabs act)
  "Restore local tab stops that picture-mode clobbers.
\(picture-mode-exit) runs (kill-local-variable 'tab-stop-list)."
  (interactive)
  (set (make-local-variable 'tab-stop-list) picture-old-tab-stop-list))

;;; rect.el

(defadvice open-rectangle (before open-rectangle-hack-for-goto-start act)
  "Avoid clobbering knowledge of region's extent.
Without this, marking a rectangle by moving (dot) downward then running
\(open-rectangle) leaves (dot) & (mark) in the same place, so after (undo)
\(which can happen if a wrong-sized rectangle was opened), the region needs
to be completely reconstructed by hand.  This happens because the function
definition ends with (goto-char start)."
  (interactive "r")
  (when (= (dot) end)
    (exchange-point-and-mark)))

;;;; --------------------------- SHELL-MODE ---------------------------- ;;;;

;; This was a pathetic previous attempt to fake DOSKey in *shell*:
;;
;;   (defvar shell-abbrev-table nil
;;     "Abbrev table used while in shell mode.")
;;
;;   (define-abbrev-table 'shell-abbrev-table ())
;;
;;   (A shell-mode-hook
;;      (setq local-abbrev-table shell-abbrev-table)
;;      (local-unset-key "\C-c\C-o")
;;      (L "\C-m" (I "" (expand-abbrev) (comint-send-input)))
;;      )

;; This was able to really do it, but only after hitting C-m:

;;   (defadvice comint-send-input (before hack-input act)
;;     (let ((proc (get-buffer-process (current-buffer))))
;;     (when (and proc (eq major-mode 'shell-mode))
;;       (let* ((pmark (process-mark proc))
;;              (intxt (if (>= (point) (marker-position pmark))
;;                         (progn (if comint-eol-on-send (end-of-line))
;;                                (buffer-substring pmark (point)))
;;                       (let ((copy (funcall comint-get-old-input)))
;;                         (goto-char pmark)
;;                         (insert copy)
;;                         copy))))
;;         (setf (buffer-substring pmark (point))
;;               (& wm-hack-shell-input intxt))))))

;; This is just right, because the replacement happens immediately:

(defun wm-sufficiently-advanced-technology-space ()
  "Replacement for comint-magic-space."
  (interactive)
  (wm-hack-first-word-of-*shell*-input-if-it-was-just-typed)
  (self-insert-char ? ))

(defun wm-sufficiently-advanced-technology-return ()
  "Allow remapping RET analogously to SPC, q.v., in *shell*."
  (interactive)
  (wm-hack-first-word-of-*shell*-input-if-it-was-just-typed)
  (comint-send-input))

(defun wm-flip-slashes-&-sufficiently-advanced-technology-return ()
  "Sort of a comint-magic-return for Mordorsoft OSs."
  (interactive)
  (wm-flip-slashes)
  (wm-sufficiently-advanced-technology-return))

(defun wm-hack-first-word-of-*shell*-input-if-it-was-just-typed ()
  "Maybe run wm-hack-shell-input, a variable that may contain a function."
  (assert (eq major-mode 'shell-mode))
  (let (process mark value)
    (if (not (! process (get-buffer-process (current-buffer))))
        (error "Current buffer has no process")
      (when (>= (dot) (marker-position (! mark (process-mark process))))
        (! value (buffer-substring mark (dot)))
        (when (not (string-match "\\s-" value))
          ;; This is the first word in the input, so expand it.
          ;; Unfortunately, (setf (buffer-substring mark (point))
          ;;                      (& wm-hack-shell-input value)))
          ;; puts (dot) at the beginning.
          (delete-region mark (dot))
          (insert (& wm-hack-shell-input value)))))))

(defvar wm-hack-shell-input 'identity ;default value to illustrate concept
  "Function to hack input in *shell*.")

(defun wm-fake-doskey (input)
  "Convert INPUT to something like what DOSKey would've converted it to.
Don't actually use the real DOSKey macros since *shell* has different
requirements from Cmd; it's better to list the special hacks here."
  (string-match "\\w*" input)
  (let* ((command (match-string 0 input))
         (args (substring input (match-end 0))))
    (loop for (macro expansion) in
          '(
            ("ascii"      "Start \"Ascii\" Li W:\\-\\Ascii.Asc /4")
            ("bmli"       "Build Monolith")
            ("bpli"       "Build Polylith")
            ("bui"        "Build")
            ("cdfls"      "CD R:\\Source\\Containers")
            ("cdh"        "CD %HOME%")
            ("cdhe"       "CD %HOME%\\ELisp")
            ("cdinf"      "CD D:\\Share\\Tools\\Info")
            ("cdla"       "CD R:\\Projects\\Launcher")
            ("cdoz"       "CD R:\\Projects\\Oz")
            ("cds"        "CD R:\\Source")
            ("cds9"       "CD R:\\Source\\CF95Charts")
            ("cdsc"       "CD R:\\Source\\Control")
            ("cdsd"       "CD R:\\Source\\Data")
            ("cdsu"       "CD R:\\Source\\Util")
            ("cdto"       "CD T:\\Tornado")
            ("cdtog"      "CD R:\\Tornado-GCC\\STL")
            ("cdtohb"     "CD T:\\Tornado\\host\\x86-win32\\bin")
            ("cdtot"      "CD T:\\Tornado\\target")
            ("cdup"       "CD ..")
            ("cdupp"      "CD ..\\..")
            ("cduppp"     "CD ..\\..\\..")
            ("cdupppp"    "CD ..\\..\\..\\..")
            ("cduppppp"   "CD ..\\..\\..\\..\\..")
            ("cdupppppp"  "CD ..\\..\\..\\..\\..\\..")
            ("cduppppppp" "CD ..\\..\\..\\..\\..\\..\\..")
            ("cdv"        "CD R:\\VxWorks")
            ("cdz"        "CD Z:\\ZAF")
            ("cdzi"       "CD Z:\\ZAF\\Include")
            ("cdzs"       "CD Z:\\ZAF\\Source")
            ("cdzu"       "CD Z:\\ZAF\\UGL")
            ("cygtime"    "S:\\Cygnus\\bin\\time.exe")
            ("duffel"     "Perl -wS Duffel.pl")
            ("el"         "Echo ErrorLevel=%ErrorLevel%")
            ("fs"         "FindStr /I /N /S")
            ("gunzip"     "gzip -d")
            ("l"          "Dir/A/Oneg")
            ("mc"         "Explorer /n,/select,.")
            ("mem"        "Mem /c")
            ("po"         "PopD")
            ("poo"        "PopD & PopD");works as "PopD&PopD" too
            ("pooo"       "PopD & PopD & PopD")
            ("poooo"      "PopD & PopD & PopD & PopD")
            ("pooooo"     "PopD & PopD & PopD & PopD & PopD")
            ("poooooo"    "PopD & PopD & PopD & PopD & PopD & PopD")
            ("pooooooo"   "PopD & PopD & PopD & PopD & PopD & PopD & PopD")
            ("pq"         "PushQ")
            ("pu"         "PushD")
            ("pufls"      "PushD R:\\Source\\Containers")
            ("pug9"       "PushD \\GRAVY\tmp\Oz95")
            ("puh"        "PushD %HOME%")
            ("puhe"       "PushD %HOME%\\ELisp")
            ("puinf"      "PushD D:\\Share\\Tools\\Info")
            ("pui"        "PushD R:\\Include")
            ("puii"       "PushD R:\\Include\\Interfaces")
            ("pula"       "PushD R:\\Projects\\Launcher")
            ("puoz"       "PushD R:\\Projects\\Oz")
            ("pus"        "PushD R:\\Source")
            ("pus9"       "PushD R:\\Source\\CF95Charts")
            ("pusc"       "PushD R:\\Source\\Control")
            ("pusd"       "PushD R:\\Source\\Data")
            ("pusu"       "PushD R:\\Source\\Util")
            ("puto"       "PushD T:\\Tornado")
            ("putog"      "PushD R:\\Tornado-GCC\\STL")
            ("putohb"     "PushD T:\\Tornado\\host\\x86-win32\\bin")
            ("putot"      "PushD T:\\Tornado\\target")
            ("puxd"       "PushD X:\\Debug")
            ("puup"       "PushD ..")
            ("puupp"      "PushD ..\\..")
            ("puuppp"     "PushD ..\\..\\..")
            ("puupppp"    "PushD ..\\..\\..\\..")
            ("puuppppp"   "PushD ..\\..\\..\\..\\..")
            ("puupppppp"  "PushD ..\\..\\..\\..\\..\\..")
            ("puuppppppp" "PushD ..\\..\\..\\..\\..\\..\\..")
            ("puv"        "PushD R:\\VxWorks")
            ("puwv"       "PushD D:\\WIP\\VxWorks")
            ("puz"        "PushD Z:\\ZAF")
            ("puzi"       "PushD Z:\\ZAF\\Include")
            ("puzs"       "PushD Z:\\ZAF\\Source")
            ("puzu"       "PushD Z:\\ZAF\\UGL")
            ("we"         "Explorer /e,/select,.")
            ("x"          "Exit")
            ("z"          "PKZip25")
            )
          if (equal command macro)
          return (! command expansion))
    (concat command args)))
(! wm-hack-shell-input 'wm-fake-doskey)

(defun wm-comint-previous-prompt (n)
  "Move to end of Nth previous prompt in the buffer.
See `comint-prompt-regexp'."
  (interactive "p")
  (loop repeat n do
        (end-of-line 0)
        (RSB comint-prompt-regexp)
        (comint-skip-prompt)))

(A shell-mode-hook
   (abbrev-mode 0)
   (local-unset-key "\C-c\C-o")
   ;?(local-unset-key [C-down])
   ;?(local-unset-key [C-up])
   (L [C-f3]     'FindStr-follow-hit)
   (L " "        'wm-sufficiently-advanced-technology-space)
   (L "\C-m"     'wm-sufficiently-advanced-technology-return)
   (L [C-return] 'wm-flip-slashes-&-sufficiently-advanced-technology-return)
   (L "\C-c\C-p" 'wm-comint-previous-prompt)
   (when WNT
     ;; Sample: ++\\WILL\H$ T:\Tornado\host\x86-win32\bin>
     (! comint-prompt-regexp "[+]*\\(\\\\[^ ]+ \\)?[A-Z]:\\\\[^>\n]*>"))
   )

(if WNT (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m))

;; --------------------------- END SHELL-MODE ---------------------------- ;;

;; sgml-mode-hook is only necessary because sgml-mode assigns keys that Emacs
;; canonically reserves to the user.
(A sgml-mode-hook
   (L "\C-cl"       'mark-line-and-copy)
   (L "\C-cn"       'timelog-new-time)
   (L "\C-co"       'delete-other-windows)
   )

(defadvice sort-columns (around sort-columns-spoof-system act)
  "Pretend we're running on VMS so the Unix system sort isn't used."
  (let ((system-type 'vax-vms))
    ad-do-it))

(defadvice switch-to-buffer (before existing-buffers-only act)
  "When called interactively switch to existing buffers only, unless
when called with a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: " (other-buffer)
                      (null current-prefix-arg)))))

(A tcl-mode-hook
   (modify-syntax-entry ?$ ".")
   (set (make-local-variable 'case-replace) nil)
   )

;; ;? (add-hook 'temp-buffer-show-hook 'shrink-window-if-larger-than-buffer)
;; doesn't work, dunno why not.  Use the defadvice functional for
;; describe-function etc way above.

(defun next-blank-line (p)
  "Move to ARGth (optional) next line."
  (interactive "p")
  (or (eobp)
      (progn
        (forward-char 1)
        (re-search-forward "^[ \t]*$" nil nil p))))
(defun previous-blank-line (p)
  "Move to ARGth (optional) previous line."
  (interactive "p")
  (or (bobp)
      (progn
        (backward-char 1)
        (re-search-backward "^[ \t]*$" nil nil p))))
(A text-mode-hook
   (turn-on-auto-fill)
   (tabs 3)
   (modify-syntax-entry ?& "w")
   ;;?? (modify-syntax-entry ?{ "(}")
   ;;?? (modify-syntax-entry ?} "){")
   ;; The mode already localizes paragraph-start & paragraph-separate
   (setq paragraph-start
         (concat "$\\|====\\|˘˘˘˘\\|[ \t]+[+>]\\|" page-delimiter))
   (setq paragraph-separate
         (concat "$\\|====\\|˘˘˘˘\\|"              page-delimiter))
   (L "\C-\M-a" 'previous-blank-line)
   (L "\C-\M-e" 'next-blank-line)
   (L "\C-\M-i" 'lisp-complete-symbol)
   (L "\M-s"     'center-line-interactively)
   )

(A timelog-mode-hook
   ;;?? (modify-syntax-entry ?{ "(}")
   ;;?? (modify-syntax-entry ?} "){")
   (L [?\M-?] 'timelog-recalc-duration)
   (turn-on-auto-fill)
   (tabs 7 10))

(require 'typematic)

(unless HER ;too slow on HERACLEITUS
  (require 'uniquify))

;? (load "vc-hooks")

(defadvice vc-toggle-read-only (after vc-toggle-view-mode-too act)
  (view-mode (if buffer-read-only 1 0)))

(require 'vi-dot) ;so the (defadvice)s will happen

(defadvice view-emacs-FAQ (after view-FAQ-selective-display act)
  (set-selective-display 2)
  (view-mode 1)
  (beginning-of-buffer)
  (search-forward "M-2 C-x")
  (search-forward "Notation")
  (beginning-of-line)
  (recenter 0))

;; When I try to autoload view-mode as below instead of (requiring) it, the
;; desktop doesn't correctly preserve view-mode-ness of already-loaded
;; buffers, although autoloading does happen on M-x view-mode.  When I switch
;; to the (require), leaving everything else as is, desktop restores
;; view-mode.  This happens even though view-mode is placed in
;; desktop-locals-to-save.  This may be related to the fact that the
;; (autoload) is commented out in loaddefs.el, but doesn't explain the
;; problem, since my own (autoload) below also doesn't work.

;;? (autoload 'view-mode "view.el" "" t nil)
(require 'view)

;; The following only works for files loaded during a session, not for
;; files loaded by the desktop...

(add-hook 'find-file-hooks
  (^ () (if buffer-read-only (view-mode)) t))

;; ...so it's necessary below (progn (SF "- DESKTOP -") (SF "pushnew"))
;;to cons 'view-mode onto the default value of desktop-locals-to-save.

;; As far as I can tell view-mode-hook is never run by view.el, so I
;; must run it explicitly here.  There's code in view.el to run
;; view-mode-hook, but in real life it doesn't happen.

(A view-mode-hook
  ;; Assign all digit keys to (set-selective-display <digit>)
  (let ((i 0))
    (while (< i 10)
      (D view-mode-map (int-to-string i)
        ;(^ () (interactive) (set-selective-display i)))
        (list 'lambda () '(interactive) (list 'set-selective-display i)))
      (setq i (1+ i))))
  ;; Right hand (preferred)
  (D view-mode-map " " 'wm-scroll-up-half-screen)
  (D view-mode-map ";" 'wm-scroll-down-half-screen)
  (D view-mode-map "j" 'next-line)
  (D view-mode-map "k" 'previous-line)
  (D view-mode-map "l" 'recenter-etc)
  (D view-mode-map "n" (I "" (message "Use `o' for down.")))
  (D view-mode-map "o" 'wm-scroll-up-line)
  (D view-mode-map "p" 'wm-scroll-down-line)
  ;; Left hand (almost symmetrical)
  (D view-mode-map " " 'wm-scroll-up-half-screen)
  (D view-mode-map "a" 'wm-scroll-down-half-screen)
  (D view-mode-map "f" 'next-line)
  (D view-mode-map "d" 'previous-line)
  (D view-mode-map "s" 'recenter-etc)
  (D view-mode-map "w" 'wm-scroll-up-line)
  (D view-mode-map "e" 'wm-scroll-down-line) ;"q" is too much a stretch
  )
(require 'view)
(run-hooks 'view-mode-hook)

;; Even after the desktop was carefully positioned in this file so
;; all necessary initialization preceded (desktop-read), the desktop
;; still didn't seem to run view-mode-hook.  There's code to run it in
;; view.el in most functions but not in (view-mode); I think that's a bug.

;;;;; ************** STUFF THAT NEEDS TO BE NEAR THE END ************** ;;;;;

;;;; ------------------------- PERSONAL STUFF -------------------------- ;;;;

;; This allows me to override some stuff there's no reason to put on the web:

(load "~/private.el" t nil t) ;no error on not found

;; It's important for that to load before the desktop, since it may hack
;; hooks that run in response to modes loaded by file on the desktop.

;;;; ----------------------------- DESKTOP ----------------------------- ;;;;

;; The first time on a new system you must do M-x desktop-save by hand.

(require 'desktop)

;; That automatically does (add-hook 'kill-emacs-hook 'desktop-kill).
;; However, saving will be automatic only if desktop-dirname was set:

(desktop-load-default)
(setq desktop-dirname "~/");Without this, desktop not saved automatically

;; On DOS or Windows that puts the desktop here: (find-file "~/emacs.dsk")

;; To C-x C-c without saving desktop, C-x C-e this: (setq desktop-dirname ())

;; Documentation at the head of desktop.el asserts that the following
;; twiddles should be done here.  There's a desktop-save-hook but no
;; desktop-load-hook.

(pushnew 'view-mode (default-value 'desktop-locals-to-save))

;; See private.el for `desktop-files-not-to-save'.

;; Finally we're ready to read the starting desktop.

(desktop-read)

;; I'd like the desktop to be automatically saved whenever Emacs has been
;; idle for some time:

(defvar wm-desktop-save-timer
  (run-with-idle-timer
   60 ;take the action after idle for this many seconds
   t  ;repeat (i.e. don't just do it the first time Emacs has been idle)
   (^ ()
     (garbage-collect)
       ;bundle with desktop timer for performance reasons
     (wm-save-desktop-with-message)))
  "Timer object causing desktop saving after idle time.
This can be an arg of some functions (apropos \"timer\").")

;;;; ------------------------ DIMINISHED MODES ------------------------- ;;;;

(require 'diminish)
(diminish 'abbrev-mode "Abv")
(diminish 'abbrev-sort-mode)
(diminish 'auto-fill-function "Fi")
(diminish 'jiggle-mode)

;;;; ----------------------------- ABBREVS ----------------------------- ;;;;

;; This fails if there is no abbrev file, as on a new system, so it should be
;; near the end so most of dotemacs will've been loaded.

(read-abbrev-file "")

;;;; --------------------- APPOINTMENTS & CALENDAR --------------------- ;;;;

;; The only way to effectively invoke appt-make-list is to run 'diary;
;; the most convenient way to do that is implicitly from 'calendar,
;; because a single ?q restores the desktop to what it was before.
;; That temporarily changes the desktop, & anyway needs to end this file.

;; Under Voelcker's NT port of 19.34.1 I need to do (require) & (run-hooks)
;; by hand first.  Since the same thing happens with view-mode, I hypothesize
;; that something's wrong with run-hooks in an autoload context.

(when (not ISP)
  (require 'calendar);only needed for the run-hooks
  (run-hooks 'calendar-load-hook)
  (calendar))

;;;; -------------------------- LOAD MESSAGE --------------------------- ;;;;

;; I find it convenient to have this near the top of *Messages*:

(message "Emacs loaded at %s." (wm-format-time-string "%T %a %d %b %y"))

;;;; ------------------------- DEBUG-ON-ERROR -------------------------- ;;;;

(setq debug-on-error nil);was set t at top of buffer

;;;;; ************************* EMACS CONTROL ************************* ;;;;;

;; Local Variables:
;; mode: outline-minor
;; center-line-decoration-char: ?-
;; center-line-padding-length: 1
;; center-line-leader: ";;;; "
;; fill-column: 77
;; line-move-ignore-invisible: t
;; outline-regexp: ";;;;+"
;; page-delimiter: "^;;;;"
;; End:

;; I've read the noutline.el code that's supposed to hack
;; line-move-ignore-invisible, but under 19.34.6 it seems to NOP.

;; To C-x C-c without saving desktop, C-x C-e this: (setq desktop-dirname ())

;;; Will Mengarini's dotemacs.el ends here