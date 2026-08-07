;        BRIEF v2.10 dabbrev.m -- Will Mengarini <seldon@eskimo.com>

;                     "I made this, I have forgotten
;                      And remember."
;                               --T.S. Eliot

;This is an approximate equivalent to Emacs's (dabbrev-expand).

;Dynamic abbreviation expansion is the replacement of a few letters by the
;word for which they stand, distinguished from static abbreviation expansion
;in that it is not necessary to define the abbreviation first; (dabbrev)
;searches text already in the buffer for words of which the letters preceding
;the cursor in the current word are a prefix.  For example, putting the
;cursor after this "cu" & invoking (dabbrev) causes it to expand the word to
;"cursor", because that is the nearest previous word in the buffer that
;begins with "cu".  Putting it after this "forw" expands to "forward", since
;if a backward search to the beginning of the buffer fails to find a match,
;the search then resumes forward from the letters that are to be matched.

;Documentation of (dabbrev)'s features here will assume (dabbrev) is invoked
;with <Ctrl-c><Ctrl-j>, because that is also a convenient custom keymapping
;for its equivalent in Emacs, where the built-in keymapping, <Alt-Frontslash>,
;isn't even typeable using the standard DOS keyboard driver, & for which the
;substitute, <Ctrl-[><Frontslash>, is awkward to type.  Of course you can
;change this by changing the (assign_to_key) in your initials macro, but
;you'll also need to change parameters near the top of the code & recompile.

;The invocation characters matter because (dabbrev) implements additional
;features to allow for the possibility that the expansion you want for your
;abbrev is not the first one the search will find, or consists of more than
;a single word.  After you've typed ^C^J to get an expansion, typing
;an additional ^J character replaces that expansion with the next one the
;search would have found.  For example, typing ^C^J after this "e" expands to
;"example"; typing a second ^J replaces "example" with "expansion".  This
;can continue until every possible expansion in the buffer has been offered
;to you, after which you will get a "no match" error & the abbrev will be
;left unexpanded.

;If you type a series of ^Js in sequence to get a particular expansion, but
;then type an extra one unintentionally, you'll have overshot your match, &
;the buffer will contain a match different from the one you wanted.  You can
;backtrack to a previous match with ^K.  ^J & ^K can be freely interleaved
;while reviewing alternatives.  Emacs users will recognize that this pair of
;characters provides similar functionality to (dabbrev-completion), an Emacs
;alternative to (dabbrev-expand) used for coping with multiple possibilities.
;(IMHO this arrangement is much more convenient than (dabbrev-completion).)

;If you want a multi-word expansion, get your abbrev to expand to the first
;word of the series, then press <Space><Ctrl-c><Ctrl-j> to get the second.
;This is the same as in Emacs, but as a convenience here subsequent words can
;also be appended by pressing just another <Ctrl-j>.  Punctuation between
;words is preserved in the expansion.  For example, after "single" here,
;typing <Ctrl-c><Ctrl-j><Space><Ctrl-c><Ctrl-j><Ctrl-j> expands to "single
;word.  After".  This can be useful in copying long expressions in
;programming languages.  Once you've begun multi-word expansion, backtracking
;with ^K is no longer available.

;In Emacs, typing <Ctrl-u><Ctrl-c><Ctrl-j> searches forward first for an
;expansion, then backward.  It saves RAM here to make that option search
;forward only, since if you go to the trouble of typing the extra keystroke,
;you probably have a particular expansion in view & know where it is.
;To get this option to work with a prefix <Ctrl-u>, put the line
;  (assign_to_key "<Ctrl-u><Ctrl-c><Ctrl-j>" "dabbrev 1")
;in your initials file.  You'll also need
;  (assign_to_key "<Ctrl-c><Ctrl-j>"         "dabbrev")
;for ordinary (dabbrev), with backward-then-forward searching.
;You can change that initial <Ctrl-u> to any other prefix without harm;
;the macro code doesn't know about it.  If you change <Ctrl-c><Ctrl-j> then
;you also need to make changes to the code, explained below.

;This macro was developed for a programming environment that is severely
;short of RAM.  This is BRIEF by UnderWare Inc., before Borland bought it, in
;16-bit real-mode code from before there was any such thing as a DOS
;extender; I was using this version of BRIEF with DOS 3 & Turbo Pascal 3,
;back when we needed third-party software to allow us to build programs > 64K
;in size.  BRIEF seemed to work well enough (for historically-appropriate
;values of "well enough") out of the box, but I built > 400 of my own macros
;to enhance the editing environment, taking enough RAM to allow me to realize
;that BRIEF had serious memory leaks (one referent of the phrase "dirty
;UnderWare").  It's commercial proprietary software, so the leaks couldn't be
;hacked.  In a typical flank-speed coding session where I was using many
;macros, BRIEF would abend every 20 minutes or so, risking lossage &
;requiring a reload.  These tight RAM constraints coerce programming
;practices that in the modern programming world would be suboptimal.  For
;example, this macro has > 400 lines of code, yet it shouldn't be decomposed
;into subroutines, because they take extra RAM at execution time.  Similarly,
;scratch variables i & s are reused because this takes less space in the
;symbol table, which is part of the runtime environment.  Strict attention to
;self-documentation & structure attempt to compensate for this.

;The most significant effect of the restrictive programming environment is
;that things which should properly be parameterized are hardwired into the
;code: specifically, (dabbrev) assumes it is invoked with a 2-character
;invocation sequence, because a convenient custom keymapping for its
;equivalent in Emacs is <Ctrl-c><Ctrl-j>.  Parameterizing the # of chars in
;the invocation sequence would make sense algorithmically, but would take
;extra RAM.

;Where possible a preprocessor #define is used to parameterize the particular
;keystrokes in the invocation sequence.  However, dirty UnderWare interferes
;here, since it uses most C++ meanings of backslashes in string literals with
;the exception of "\n", which in BRIEF denotes ^M, rather than ^J.  (The
;correct denotation is "\r" for ^M & "\n" for ^J.)  In BRIEF v2.10, there is
;*no way* to denote a literal ^J in a string.  In fact, the compiler abends
;if a literal ^J is even included in a comment, so I assume this is just a
;programming error, not a design decision; but BRIEF was commercial
;proprietary software, so it couldn't be fixed by hackers.  To get around
;this, names that should be preprocessor #defines but would contain "\n"
;are instead defined & generated at runtime in the code.  So interleaved
;with #defines parameterizing keystrokes are ";#below" comments indicating
;that the actual definition is calculated below in code.

;It's necessary to parameterize each keystroke as the *integer* returned by
;(read_char), which is 16 bits, the lower containing the Ascii code if there
;is one or 0 if this is a non-Ascii keystroke, the upper containing the scan
;code with various bits flagging keys like <Alt>.  The best way to generate
;these integers is to use (read_char) in a test macro to read what you type
;from the keyboard & then print it.  It's also necessary to parameterize some
;of the same keystrokes in strings.  The naming convention will be that "key"
;prefixes the name of a keystroke integer, but "str" prefixes the name of a
;string containing one or more keystrokes.

;Here are the #defines for the keystrokes.  There are 3 literal ^C
;characters in those strings; BRIEF has no numeric escapes like "\003".

#define keyCall1       11779   ;keystroke <Ctrl-c>
#define strCall1         ""   ;string    <Ctrl-c>
#define keyCall2        9226   ;keystroke <Ctrl-j>
;#below strCall2        "\n"   ;string    <Ctrl-j>
#define keyBack         9483   ;keystroke <Ctrl-k>
#define strSpaceCall1  " "    ;string    <Space><Ctrl-c>
;#below strSpaceCall   " \n"  ;string    <Space><Ctrl-c><Ctrl-j>

;Another thing that was reasonable to parameterize was this:

#define wordChars       "[0-9A-Za-z_\\-]"
#define wordSeparators "[~0-9A-Za-z_\\-]"
;The charset negator for BRIEF regexps is "~"; for ksh globexps it's "!".

;You can twiddle those regexps to redefine what constitutes a word, as long
;as the resulting definition doesn't put any of the BRIEF regexp
;metacharacters "@$%^*|+[]{}<>?" in the definition of a word.  Note that
;the regexps above include "-" & "_" in words; it's OK to remove those.
;Ensure that wordChars & wordSeparators remain complementary charsets.

;The logic here is sufficiently hairy that I found it worthwhile to design
;it in pseudocode before translating it into BRIEF macro language (which is
;basically Lisp without lists, an amazing concept; I understand they later
;produced a syntactic variant which is basically C without pointers).  If
;you are using neither BRIEF nor Emacs, but want to code your own (dabbrev),
;this pseudocode may give you a head start.

;macro:
;
;  if cursor follows a char defined as a word constituent:
;     Extract abbrev.
;  else:
;     Report error.
;;    return
;  fi
;
;  direction = called-with-^U ? forward : backward
;  loop:
;     try:
;        try:
;           Move cursor properly for next search.
;        catch "cursor can't move past beginning|end of buffer":
;           throw "not found"
;        yrt
;        Search direction for candidate expansion (may also throw "not found").
;     catch "not found":
;        if direction == backward:
;           direction = forward
;           cursor = where abbrev was found
;  ;        next
;        else
;           Report error.
;;          Return from macro leaving cursor & buffer unchanged.
;        fi
;     yrt
;     Insert expansion into buffer.
;     Redisplay & accept a character of keyboard input.
;     switch input:
;     ^J:
;        Remove expansion.
;  ;     next
;     ^K:
;        Hack search state so loop will revert to preceding expansion.
;  ;     next
;     <Space>
;        saved = <Space>
;        Insert <Space> into buffer since this may not be multi-word expansion.
;        loop:
;           Redisplay & accept another character of keyboard input.
;           saved += new input char
;           switch saved
;           <Space>:
;              ;Note it's impossible to get here on the first iteration
;              Insert <Space>.
;        ;     next
;           <Space>^C:
;        ;     next
;           <Space>^C^J|^J:
;              ;Can't support <Space>^J in this alternative because it's
;              ;common I follow an expansion with <Space> (tagscrap) (that's
;              ;another macro of mine that I invoke with a <Ctrl-j> prefix).
;              if saved begins with <Space>:
;                 Remove the inserted space from the buffer.
;              fi
;              Insert separators & next word of expansion into buffer.
;              saved = ""
;        ;     next
;           other:
;              Delete zero or one leading <Space>s from saved.
;              Push rest of saved back into keystrokes buffer (FIFO).
;;             return
;           hctiws
;        pool
;     other:
;        Push input back into keystrokes buffer.
;;       return
;     hctiws
;  pool
;
;orcam

;Buglet: if invoked in an unmodified buffer in which it finds expansions
;for the abbrev, but the user rejects all of them, it leaves the buffer
;unmodified in a logical sense, but its "modified" flag is set because of
;the insertion & deletion of alternative expansions.  This does no real
;harm, & isn't nonoutrageously fixable because there's no BRIEF equivalent
;to Emacs's (not-modified) & (undo) doesn't work from inside macros.

;Because I did so much BRIEF programming, I defined a bunch of single-char
;synonyms for the built-in BRIEF symbols I used most often.  I had that in
;a separate #included file, of course, but for convenience on a web page,
;I've copied the file into here.  This BRIEF macro should therefore be able
;to compile & run on any BRIEF that's backward-compatible with v2.10, without
;needing any additional files.  (But don't forget to put the invocation
;keystrokes in your initials macro.)  AFAIK #defines don't take RAM.
;Using single-char synonyms like this makes sense in terms of Zipf's Law,
;which states that words in natural languages tend to vary in length in
;inverse proportion to their frequency of use.  In a heavily-used
;programming environment, such as BRIEF was for me, learning a few synonyms
;like this is a one-time effort that pays off repeatedly by allowing more
;code to fit on a single screen without cramping.

#define B search_back
#define E error
#define F search_fwd
#define G set_msg_level
#define I index
#define K assign_to_key
#define L strlen
#define M message
#define N NULL
#define P get_parm
#define R sprintf
#define S search_string
#define U substr
#define V inq_environment
#define W inq_position
#define X execute_macro

;I prettyprint in a different style from the UnderWare macros.  My style is
;what Steve McConnell in /Code Complete/ calls "pure-block emulation"; in
;contrast, UnderWare uses what I'd call "lexical discrimination", where
;every lexeme is treated as a holy thing
;worthy of its own indentation level.
;Pure-block emulation reproduces
;the structure of things like
;Ada's
;  if condition then                                       (if (condition) (
;     action                                         ___      (action)
;  else                                                /|  )(
;     action                                          / |     (action)
;  endif                                             /     ))
;which translates into my BRIEF                     /
;macro prettyprint as this-------------------------/.
;The other forms are analogous.  Pure-block emulation tends to work poorly in
;real Lisp because sexps are too heavily parenthesized, but it's fine here.

;I treat builtin calls that need to be paired, such as (save_position) &
;(restore_position), as pseudo control structures.  Indenting the code inside
;the pair makes it clear that cleanup remains to be done.

;Some error-checking & debugging code has been left available.  It's
;commented out with ";;;" to make it easy to recognize.  Trace messages used
;in debugging look like this:
;  ;E"length of abbrev: %d")i)
;They're turned on or off by my (Trc_m) macro.

(macro dabbrev (

   ;It takes less RAM to declare all vars here, rather than where
   ;they're used (grrr).

   (string
      abbrev
         ;the abbreviation the user wants expanded
      target
         ;regexp for searching for candidate expansions
      expansion
         ;the current candidate expansion
      oldExpansions
         ;pseudoarray of previous candidate expansions that have been rejected
      history
         ;pseudoarray of ints used in implementing candidate backtracking
      saved
         ;chars the user typed that we don't yet know the meaning of
      strCall2 strSpaceCall
         ;string constants that'd be #defines except for dirty UnderWare
      s  ;scratch to be used in tight local contexts
   )

   (int
      colInvoked        lineInvoked
         ;the column & line of the cursor when (dabbrev) was invoked
      colAbbrev
         ;the column where the abbrev started (note lineAbbrev == lineInvoked)
      colSearchNext     lineSearchNext
         ;where we are up to while searching for expansions
      colSearchThis     lineSearchThis
         ;the values we were using when we found the current expansion
      colEndOfExpansion lineEndOfExpansion
      colNextWordEnd    lineNextWord
         ;where we are up to while getting multi-word expansions
      maxStringLength-2
         ;for trimming container strings like oldExpansions
      keyJustRead
         ;keystroke read from keyboard
      searchForward     found
         ;search booleans
      messageWritten
         ;whether (dabbrev) has written a message it needs to clear
      i  ;scratch to be used in tight local contexts
   )

   ;GET ARGS, SET UP ENVIRONMENT & STARTING STATE

   (P 0 searchForward);i.e. default to backward search

   (W lineInvoked colInvoked)

   (move_rel 0 999) (W N maxStringLength-2) (-= maxStringLength-2 2)
   ;BRIEF strings & buffer lines have the same configurable length limit

   ;What follows is necessary only because dirty UnderWare uses "\n" to
   ;denote "\r" & gives no meaning to "\r", & is incapable of tolerating a
   ;literal ^J even in a *comment*.

   (R strCall2     "%c"     10      ) ;string <Ctrl-j>
   (R strSpaceCall "%c%c%c" 32 3 10 ) ;string <Space><Ctrl-c><Ctrl-j>

   ;RECOGNIZE ABBREV

   ;First we need to check that we weren't in virtual space when invoked.
   ;(Remember BRIEF generally uses the quarter-plane model of editing, unlike
   ;Emacs, which only uses it in picture-mode.) If we were in virtual space,
   ;then the motion commands, which are quarter-plane based, when interacting
   ;with (read), which is char based, will produce garbage results.

   (end_of_line) (W N i);i = column of EOL
   (if (> colInvoked i) (
      (E "(dabbrev) invoked beyond end of line.")
      (move_abs 0 colInvoked)
(     return)
   ))

   ;Now we want to search backwards on the current line for the beginning of
   ;the word that is the abbrev for which to search.  Because BRIEF regexps
   ;have no equivalent to Emacs's "\<" (BRIEF's "<" in a regexp denotes the
   ;beginning of the line), we need to construct a regexp to match a word
   ;separator.  A BRIEF negated charset alone would match newlines, but
   ;"<|[~chars]" is necessary to also match the beginning of the buffer.

   (= s (+(+ "{<|" wordSeparators) "}\\c"))
   ;E"s (abbrev search target): \"%s\"")s)

   (move_abs 0 colInvoked)
   (drop_anchor 4)
      (beginning_of_line)
      (B s 1 1 1);regexp, case sensitive, search block only
      ;Note that search goes from end of block to beginning regardless
      ;of locations of cursor & anchor (point & mark in Emacs-talk)
   (raise_anchor)

   ;Cursor is now at location of first char of abbrev.

   (W N colAbbrev)

   (= i (- colInvoked colAbbrev));length of abbrev
   ;E"length of abbrev: %d")i)
   (if (> i 0) (
      (move_abs 0 colAbbrev)
      (= abbrev (read i))
      ;E"abbrev: %s")abbrev)
   )(
      (E "Not at end of word.")
      (move_abs lineInvoked colInvoked)
(     return)
   ))

   ;SEARCH FOR AN EXPANSION

   ;We'll do a loop that can find multiple expansions until the user accepts
   ;one.  Since the same expansion is likely to occur multiple times in the
   ;buffer, we'll keep a record of the ones found in the only container type
   ;BRIEF has, a string.  It's initialized with a search sentinel.

   (= oldExpansions "|")

   ;A valid expansion must be a word that *begins* with the abbrev, not just
   ;contains it; so we must search for a word boundary preceding the abbrev.
   ;Therefore, the abbrev itself is not a sufficient search target; we must
   ;construct a regexp in a string variable.

   ;Remember that in BRIEF regexps, angle brackets denote *line*, not *word*,
   ;boundaries, & there is no equivalent of Emacs's "\<".  So to ensure that
   ;the match we find is a word prefix, we again need to search for the
   ;abbrev preceded by a separator.

   (= target (+(+(+(+ "{<|" wordSeparators) "}\\c{") abbrev) "}"))
   ;E"target: \"%s\"")target)

   ;Now we have to work out the strategy for deciding where to start each
   ;search in the following search loop, which needs to be able to search
   ;forward or backward.

   ;Consider the most common case of the first search this loop ever makes:
   ;it's searching backward, & wants to find any match that precedes the
   ;abbrev itself, which began somewhere in the middle of the line (the usual
   ;case).  Therefore, it seems we'd want to start the search from the column
   ;preceding the abbrev.  However, we're not searching for abbrev but for
   ;target, which is a regexp that'll match wordSeparators followed by
   ;abbrev; & (F) or (B) will accept any match the first char of which is at
   ;or before the location of the cursor when it is invoked; so starting the
   ;search one column left of the abbrev, which contains a char matching
   ;wordSeparators, will immediately match the abbrev itself, clearly not
   ;what we want.  We can avoid this by moving an additional column left from
   ;the start of the abbrev, for a total of 2.

   ;But that's only possible if colAbbrev >= 3.  Otherwise there is no column
   ;2 columns to the left.  This is thinking in terms of the quarter-plane
   ;model of editing, which BRIEF generally uses.  Instead, we need to think
   ;in terms of character motion, so if colAbbrev is 1 or 2, we'll wrap
   ;around to the preceding line.  Quarter-plane motion is done by
   ;(move_{rel,abs}); ({prev,next}_char) do char motion.

   ;Even char motion fails if we're already on line 1, however; but in that
   ;case, the (B) will fail because there's noplace left to search, so as
   ;soon as we try to position for the next (B) & realize we can't go back
   ;any more chars, we've got a "not found" for backward searching.

   ;Because of the position of \c in target, each subsequent (B) will be
   ;like the first: we need to move 1 char back to hit the word separator
   ;that started this hit, then another to be sure we find the next hit.

   ;Forward searching is similar, but because the word separator is before
   ;the abbrev, we don't need to move over it in forward searching, so it's
   ;sufficient to move 1 char forward for each new search.  Reaching the end
   ;of the buffer is another "not found".

   ;We'll use the (int) vars colSearch* & lineSearch* to keep track
   ;of where in the buffer we are up to while searching.

   (= lineSearchNext lineInvoked);lineAbbrev == lineInvoked
   (=  colSearchNext colAbbrev)

   ;The following loop uses (continue)s.  I vaguely remember that there was
   ;a problem with these & dirty UnderWare, so it's probably wiser not to
   ;declare new variables inside the loop.

   (while 1 (

      (= lineSearchThis lineSearchNext)
      (=  colSearchThis  colSearchNext)

      (move_abs lineSearchThis colSearchThis)
      ;E"Searching from %d %d")lineSearchThis colSearchThis)

      ;The try/catch structure in the pseudocode is implemented with a
      ;boolean (int found).  It's reinitialized on every loop iteration by
      ;the following conditional.

      ;({prev,next}_char) return whether the position changed; it won't at
      ;the boundaries of the buffer.
      (if searchForward (
         (= found (next_char))
      )(
         (prev_char)
         (= found (prev_char))
      ))

      (if found (
         (if searchForward (
            (= found (> (F target) 0))
            ;E"F: found = %d")found)
         )(
            (= found (> (B target) 0))
            ;E"B: found = %d")found)
         ))
      ))

      (if (! found) (
         (if searchForward (
            (E "No match.")
            (move_abs lineInvoked colInvoked)
(           return)
         )(
            (= searchForward 1)
            (= lineSearchNext lineInvoked);lineAbbrev == lineInvoked
            (=  colSearchNext  colAbbrev)
   (        continue)
         ))
      ))

      ;We found a candidate expansion.

      ;We don't yet know this is an expansion the user will see (the code can
      ;reject it farther down), but we must immediately update lineSearchNext
      ;& colSearchNext, so the code that might reject this expansion can
      ;(continue) the loop without endless-looping.

      (W lineSearchNext colSearchNext)

      ;Extract the expansion, checking criteria for suitability: not the
      ;whole abbrev, & not already offered to the user.  If this expansion is
      ;unacceptable, we'll need to (continue).

      (drop_anchor 4)
         ;;;(if (<= (F (+ wordSeparators "|>")) 0) (
         ;;;   (E "(dabbrev) internal failure 1 finding word end.")
         ;;;   (return)
         ;;;))
         (F (+ wordSeparators "|>"))
         ;That had to work because of "|>"; every line has an end
         (W lineEndOfExpansion colEndOfExpansion)
      (  swap_anchor)
         ;We're now at the beginning of the word that matched, but that's
         ;not good enough; we need to move past the abbrev itself, which
         ;the user has already typed, & read only the remainder of the word.
         (move_rel 0 (L abbrev))
         (= i (inq_mark_size))
      (raise_anchor)
      (if (> i 0) (
         (= expansion (read i))
      )(
         ;The whole word we matched was the abbrev, as when the user tries
         ;to expand "up" to "upcoming" but there's an occurrence of "up" as
         ;a word in the text.
   (     continue)
      ))
      (if (I oldExpansions (+(+ "|" expansion) "|")) (
         ;This expansion was already offered to & rejected by the user
   (     continue)
      ))

      ;We now have a candidate expansion in the string variable of that name,
      ;& we have verified that we should display it to the user.

      ;First we remember where we started the search from when we found this
      ;expansion, so if we want we can backtrack to it.  We must also
      ;remember the search direction we used to find this position.

      ;BRIEF macro language has no arrays, so we must implement them by hand
      ;in limited-length strings.  Because those strings aren't 8-bit-clean,
      ;the #s must be stored as digit strings.  We'll use " " as a terminator
      ;for each digit string.

      ;Because BRIEF strings have limited length, we must first ensure we'll
      ;have room for the new data.  We're storing these ints:
      ;  lineSearchThis (5 digits)  colSearchThis (3)  searchForward (1)
      ;Each int is terminated by a space, so we need 12 chars.

      ;Clearing space when out of room is a FIFO process, & reverting to
      ;previous search positions is LIFO.  It's better that when reverting
      ;we be taking values from the front, so (atoi) will Just Work;
      ;so they get unshifted onto the front, & popped off the back when FIFO.

      (while (> (+ (L history) 10) maxStringLength-2) (
         ;An (if) would work too since this loops 0 or 1 times, but (while)
         ;is safer & uses no extra RAM in bytecode.  CPU time is irrelevant.
         (= i 3) (while(
            (= history (U history 1 (- (rindex history " ") 1)))
            ;We know all 3 rindexes will succeed because of the length
            ;of history tested in the (while) condition.
         (-- i)))
      ))

      ;Saving space by using hex sounds tempting, but although conversion to
      ;hex digits from an int is a BRIEF builtin ((sprintf), aka (R)),
      ;conversion to int using (atoi) supports only decimal.

      (R history "%d %d %d %s"
         lineSearchThis colSearchThis searchForward history
      )

      ;Insert the expansion in the buffer & display it to the user.

      (move_abs lineInvoked colInvoked)
      (insert expansion)
      (refresh)

      ;Now the user has the option of pressing keys for selecting among
      ;alternative expansions (^J for next, ^K for previous).  There's also
      ;support for the special processing that Emacs gives to sequences of
      ;<Space><Alt-Frontslash>.  Any other char ends the macro.

      (while (!(inq_kbd_char))) (= keyJustRead (read_char))
      ;E"keyJustRead: %d")keyJustRead)

      ;The code below may have written an error message pertaining to a
      ;particular keystroke, & if so, that pause just now for more input
      ;will have allowed time for the user to read it, & it won't apply
      ;to the next keystroke.  So if it exists it should be cleared; but
      ;the message line should not be cleared unless we've written it.

      (if messageWritten (
         (M "")
         (= messageWritten 0)
      ))

      (switch keyJustRead keyCall2 N keyBack (;<Ctrl-j>|<Ctrl-k>

         ;This expansion is being rejected, so we remove it & continue.
         ;(delete_char) takes no arg, so we have to mark a block.
         ;The cursor is already at the end of the inserted expansion.

         (drop_anchor 4)
            (move_abs lineInvoked colInvoked)
         (delete_block);which also raises the anchor

         (if (== keyJustRead keyCall2) (

            ;We'll loop back to search for a different expansion.  This
            ;requires remembering the ones we've found already so we don't
            ;offer them repeatedly.

            ;Trim oldExpansions if it has become too long:
            (while (> (+ (L expansion) (L oldExpansions)) maxStringLength-2) (
               (= oldExpansions (U oldExpansions 2));remove leading "|"
               (= oldExpansions (U oldExpansions (I oldExpansions "|")))
               ;Note that keeps the leading "|" before next word
            ))

            ;Append expansion to end of oldExpansions:
            (+= oldExpansions (+ expansion "|"))
            ;Note each expansion has a "|" on each side

         )(;else this was a keyBack

            ;The reason for the rejection isn't that the user wants the
            ;next expansion, but a previous one already seen.
            ;The top of the loop found this expansion based on the variables
            ;lineSearch*, colSearch*, & searchForward.  Those variables have
            ;already been modified to prepare for the next search, & the
            ;values that produced this search are now at the beginning of
            ;the history string.  So first we need to shift off those 3
            ;unwanted values, then we need to extract the 3 behind them.

            (= i 3) (while(
               (= history (U history (+ (I history " ") 1)))
            (-- i)))

            (if (L history) (
               (= lineSearchNext    (atoi history))
               (= history (U history (+ (I history " ") 1)))
               (= colSearchNext     (atoi history))
               (= history (U history (+ (I history " ") 1)))
               (= searchForward (atoi history))
               (= history (U history (+ (I history " ") 1)))
               ;E"lineSearchNext: %d")lineSearchNext)
               ;E"colSearchNext:  %d")colSearchNext)
               ;Since we're reverting to a previously displayed value,
               ;we must pop it off the end of oldExpansions, otherwise the
               ;attempt at redisplay would fail.
               ;Remove trailing "|":
               (= oldExpansions (U oldExpansions 1 (- (L oldExpansions) 1)))
               ;Remove actual expansion:
               (= oldExpansions (U oldExpansions 1 (rindex oldExpansions "|")))
            )(
               (E "No more saved matches.")
               ;Now cause the next iteration to stay on the same match
               (= lineSearchNext lineSearchThis)
               (=  colSearchNext  colSearchThis)
               (= messageWritten 1)
            ))

         ))

   (     continue)

      ) 14624 (;<Space>

         ;The user typed <Space>, so may now be requesting multi-word
         ;expansion, or may just be continuing to type ordinary text
         ;that needs to be passed on to BRIEF for normal processing.
         ;We won't know which until we see a subsequent character.

         (insert (= saved " "))
         ;E"saved: \"%s\"")saved)

         (while 2 (

            (refresh)

            (while (!(inq_kbd_char))) (= keyJustRead (read_char))
            ;That value of keyJustRead is used again far down in the code

            (R saved "%s%c" saved keyJustRead)
            ;E"saved: \"%s\"")saved)

            (switch saved " " (
               (insert " ")
         (     continue)

            ) strSpaceCall1 (;<Space><Ctrl-c> if the keymapping is to ^C^J
         (     continue)

            ) strSpaceCall N strCall2 (;<Space><Ctrl-c><Ctrl-j> or <Ctrl-j>

               (if (== (I saved " ") 1) (backspace))
               (= saved "")
               (save_position)
                  (move_abs lineEndOfExpansion colEndOfExpansion)
                  ;Cursor is now after the last char already inserted
                  (drop_anchor 4)
                     (if (<= (F wordChars) 0) (
                        (E "No more words after expansion.")
                  (     raise_anchor)
               (        restore_position)
(                       return)
                     ))
                     ;Cursor is now on first char of next word of expansion
                     ;;;(if (<= (F (+ wordSeparators "|>")) 0) (
                     ;;;   (E "(dabbrev) internal failure 2 finding word end.")
                     ;;;  (return)
                     ;;;))
                     (F (+ wordSeparators "|>"))
                     ;It's now after last char of next word of expansion
                     (W lineNextWord colNextWordEnd)
                     ;We'd hope the cursor is now positioned so we can just
                     ;copy the block, but it's not that easy: the next word
                     ;may be on some subsequent line following punctuation we
                     ;must include & indentation we must omit.  It'd be
                     ;possible to code a loop that went thru all lines
                     ;between that of this word & the next, accumulating all
                     ;punctuation on them & gluing it together; but it's not
                     ;worth it in a RAMcrammed environment.  However, needed
                     ;punctuation ending one line & beginning the next is
                     ;realistic; we'll just ignore any lines in between.
                     (if (== lineNextWord lineEndOfExpansion) (;all on 1 line
                        (W lineEndOfExpansion colEndOfExpansion)
                        ;E"same line"))
                  (     swap_anchor)
                        ;(read 0) gives an error in BRIEF, so think: we know
                        ;we were on a word separator when (F wordChars)
                        ;succeeded above, therefore the cursor moved, &
                        ;the later (F ...wordSeparators...) couldn't've moved
                        ;it backwards, so (inq_mark_size) must be > 0.
                        (= expansion (read (inq_mark_size)))
                     )(;we wrapped around to some subsequent line
                        ;E"different line"))
                        ;GET POSSIBLY-EMPTY PUNCTUATION AT END OF FIRST LINE
                        (move_abs lineEndOfExpansion) (end_of_line)
                  (     swap_anchor)
                        (= i (inq_mark_size))
                        (= expansion (if i (read i) ""))
                        ;SUBSTITUTE " " FOR NEWLINE + INDENTATION
                        (+= expansion " ")
                        ;MARK POSSIBLY-EMPTY PUNCTUATION AFTER INDENT BUT
                        ;BEFORE FIRST WORD ON FINAL LINE
                        (move_abs lineNextWord 1) (F "[~ \t]");sure to work
                        ;This nonwhitespace may be the start of the next word
                        ;or may be punctuation that precedes it.
                  (     raise_anchor) (drop_anchor 4);ie move the anchor
                        ;GET PUNCTUATION & WORD INTO BLOCK
                        (move_abs N colNextWordEnd)
                        ;SAVE STATE & READ THE BLOCK
                        (W lineEndOfExpansion colEndOfExpansion)
                  (     swap_anchor)
                        (+= expansion (read (inq_mark_size)))
                        ;sure to be nonzero, as above
                     ))
                  (raise_anchor)
               (restore_position)
               (insert expansion)

         (     continue)

            ) N (;any other chars in inner switch

               ;We have a problem here just (push_back)ing saved char-by-char
               ;with (push_back (atoi saved 0)), since that works for Ascii
               ;chars, but not general keystrokes, which are needed to get
               ;the correct BRIEF mappings to commands.  However, the final
               ;keystroke has been saved in keyJustRead, so for the last char
               ;of saved, we can just push that back; & the only other
               ;keystrokes that can make it into saved are " " & strCall1.
               ;Any other char must have been the final char, so it's in
               ;keyJustRead.  Furthermore, although it is possible for a
               ;<Space> to be noninitial in saved when the user types 2
               ;spaces after running (dabbrev), such a space must be final in
               ;saved, & therefore falls into the "other" category; & we skip
               ;an initial space; so we don't need to allow for spaces.  The
               ;only char that needs special handling is strCall1.

               (if (== (I saved " ") 1) (= saved (U saved 2)))
               (while (L saved) (
                  (if (== (U saved 1 1) strCall1) (
                     (push_back keyCall1)
                  )(
                     (push_back keyJustRead)
                     ;;;(if (!= (L saved) 1) (
                     ;;;   (E "(dabbrev) abend in (push_back) loop")
                     ;;;   (return)
                     ;;;))

                  ))
                  (= saved (U saved 2))
               ))

(              return)

            ));switch saved

         ));while 2

      ) N (;any other chars in outer switch

         (push_back keyJustRead)
(        return)

      ));switch keyJustRead

   ));while 1
))
