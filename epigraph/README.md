# The EPIGRAPH package

The epigraph package is designed for typesetting epigraphs --- the
pithy quotations often found at the start (or end) of a chapter. Both
single epigraphs and lists of epigraphs are catered for. Various aspects
are easily configurable.

## Change History

Version 1.5e (2020/01/02)
- Try to prevent breaks after epigraphs
- Add \epigraphnoindent to automatically suppress indentation
  after all \epigraph commands

Version 1.5d (2011/08/07)
- Load the nextpage package for \cleartoevenpage
  (this avoids loading order conflicts)

Version 1.5c (2009/09/02)
- New maintainer (Will Robertson)

Changes in Version 1.5a (2002/10/22)
- Replaced flushleftright environment by flushepinormal environment
  to avoid clash with the ccaption package's \flushleftright

Changes in Version 1.5 (2000/02/20)
- Generalised \cleartoevenpage command

Changes in Version 1.4 (2000/01/16)
- Added flushleftright environment

Changes in Version 1.3 (1999/12/01)
- Added \dropchapter and \undodrop commands

Changes in Version 1.2 (1999/09/12)
- Added \cleartoevenpage command
- Improved documentation

Changes in Version 1.1: (1998/11/29)
- Added support for epigraphs above chapter titles.

## Copyright

    Author: Peter Wilson, Herries Press
    Maintainer: Will Robertson
                will dot robertson at latex-project dot org
    Copyright 1998--2004 Peter R. Wilson
              2009--2020 Will Robertson

    This work may be distributed and/or modified under the
    conditions of the LaTeX Project Public License, either
    version 1.3c of this license or (at your option) any
    later version: <http://www.latex-project.org/lppl.txt>

    This work has the LPPL maintenance status "maintained".
    The Current Maintainer of this work is Will Robertson.

## Manifest

This work consists of the files:
* README (this file)
* epigraph.dtx
* epigraph.ins
* epigraph.pdf (user manual)
and the derived files:
* epigraph.sty

The distribution consists of the files:
* README (this file)
* epigraph.dtx
* epigraph.ins
* epigraph.pdf (user manual)

## Installation

To install the package:
- run: latex epigraph.ins (which will generate epigraph.sty)
- Move epigraph.sty to a location where LaTeX will find it
  (typically in a local texmf tree at tex/latex/***) and refresh the
  file database if necessary. See the FAQ at https://texfaq.org/
  for more information on this.
- (or `l3build install`)

To process the user manual:
- run: latex epigraph.dtx
- run: makeindex -s gind.ist epigraph
- run: latex epigraph.dtx
- (or `l3build doc`)

