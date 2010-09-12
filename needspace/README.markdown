
The NEEDSPACE package
=====================

Provides the \needspace and \Needspace macros for
requesting a certain amount of space on the current
page for the following material.


INSTALLATION
------------

Run `pdflatex` on needspace.tex to produce the files
  needspace.ins and needspace.sty,
as well as to compile the PDF documentation.

Execute `tex needspace.ins` to produce the files above
except needspace.ins itself (and the PDF file, obviously).


CHANGE HISTORY
--------------

* v1.3c (2010/09/12):  
  Patch to improve behaviour with commands like `\section` that use
  `\addvspace`. See [this thread][ctt] on comp.text.tex.

[ctt]: http://groups.google.com/group/comp.text.tex/browse_frm/thread/8d849a1e0be2120e

* v1.3b (2009/09/03):  
  New maintainer (Will Robertson)

* v1.3a (2003/02/18):  
  At the suggestion of Donald Arseneau (private emails) changed guts of
  \needspace from
  
        ... \vskip\z@\@plus\dimen@\pagebreak[3]\vskip\z@\@plus-\dimen@\endgroup}

* v1.3 (2003/02/07):  
  Added \Needspace (an extended version of postings by Donald Arseneau 
  to comp.text.tex e.g., in November 1993, August 1995, September 1997, ...)

* v1.2 (2002/09/11):  
  At the suggestion of Robin Fairbairns, added use of \dimen@ to capture 
  the argument so that calc package commands can be used in the argument.


COPYRIGHT AND LICENSING
-----------------------

Authors: Donald Arseneau and Peter Wilson (Herries Press)  
Maintainer: Will Robertson (will dot robertson at latex-project dot org)  
Copyright 1996-2003 Peter Wilson  
Copyright 2010 Will Robertson  

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either
version 1.3c of this license or (at your option) any
later version: <http://www.latex-project.org/lppl.txt>

This work has the LPPL maintenance status "maintained".
The Current Maintainer of this work is Will Robertson.

This work consists of the files needspace.tex and the
derived files needspace.sty and needspace.ins.


MAINTENANCE
-----------

Please report bugs or request features:  
  <http://github.com/wspr/herries-press/issues>

Developmental and historical versions:  
  <http://github.com/wspr/herries-press>

Current release version:   
  <http://ctan.tug.org/pkg/needspace>  

