
PKG = $(shell basename `pwd`)
FILES = README $(PKG).ins $(PKG).dtx
RESULTS = $(PKG).pdf $(PKG).sty
TEXFOT = texfot

$(PKG).tar.gz: $(FILES) $(RESULTS)
	ctanify $(PKG).ins $(PKG).pdf README

$(PKG).pdf: $(PKG).dtx
	$(TEXFOT) pdflatex $<
	makeindex -s gind.ist $(PKG)
	$(TEXFOT) pdflatex $<
	$(TEXFOT) pdflatex $<

$(PKG).sty: $(FILES)
	tex $(PKG).ins

clean:
	git clean -dfx
