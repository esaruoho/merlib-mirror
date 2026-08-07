---
title: "Question 7.1"
source_domain: amasci.com
source_path: ~scs/C-faq/q7.1.html
order: 7924
reachable_from_entry: false
images: 0
internal_links: 6
extracted: 2026-08-07T17:15:34Z
extractor: site_to_paper.py (pandoc)
---

# Question 7.1

*Source page: `~scs/C-faq/q7.1.html`*

### Question 7.1

Why doesn't this fragment work?

       char *answer;
        printf("Type something:\n");
        gets(answer);
        printf("You typed \"%s\"\n", answer);

------------------------------------------------------------------------

The pointer variable `answer`, which is handed to `gets()` as the location into which the response should be stored, has not been set to point to any valid storage. That is, we cannot say where the pointer `answer` points. (Since local variables are not initialized, and typically contain garbage, it is not even guaranteed that `answer` starts out as a null pointer. See questions [1.30](q1.30.html) and [5.1](q5.1.html).)

The simplest way to correct the question-asking program is to use a local array, instead of a pointer, and let the compiler worry about allocation:

    #include <stdio.h>
    #include <string.h>

    char answer[100], *p;
    printf("Type something:\n");
    fgets(answer, sizeof answer, stdin);
    if((p = strchr(answer, '\n')) != NULL)
        *p = '\0';
    printf("You typed \"%s\"\n", answer);

This example also uses `fgets()` instead of `gets()`, so that the end of the array cannot be overwritten. (See question [12.23](q12.23.html). Unfortunately for this example, `fgets()` does not automatically delete the trailing `\n`, `gets()` would.) It would also be possible to use `malloc()` to allocate the `answer` buffer.

------------------------------------------------------------------------

Read sequentially: <a href="q6.21.html" rev="precedes">prev</a> <a href="q7.2.html" rel="precedes">next</a> <a href="s7.html" rev="subdocument">up</a> [top](faq.html)

------------------------------------------------------------------------

This page by [Steve Summit](http://www.eskimo.com/~scs) // [Copyright](copyright.html) 1995 // [mail feedback](mailto:scs@eskimo.com)
