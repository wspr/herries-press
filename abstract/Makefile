
PKG = $(shell basename `pwd`)
FILES = README $(PKG).ins $(PKG.dtx)
RESULTS = $(PKG).pdf $(PKG).sty

$(PKG).tar.gz: $(FILES) $(RESULTS)
	ctanify $(PKG).ins $(PKG).pdf README

$(PKG).pdf: $(PKG).dtx
	latexmk -pdf $<;

$(PKG).sty: $(FILES)
	tex $(PKG).ins
