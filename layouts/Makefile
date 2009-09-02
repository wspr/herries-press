
PKG = $(shell basename `pwd`)
DOC = layman
FILES = README $(PKG).ins $(PKG).dtx ${DOC}.tex
RESULTS = $(PKG).pdf $(PKG).sty  ${DOC}.pdf

$(PKG).tar.gz: $(FILES) $(RESULTS)
	ctanify ${DOC}.tex=source/latex/$(PKG) ${DOC}.pdf $(PKG).ins $(PKG).pdf README

$(PKG).pdf: $(PKG).dtx
	pdflatex $<;
	makeindex -s gind.ist $(PKG);
	pdflatex $<;
	pdflatex $<;

$(DOC).pdf: $(DOC).tex
	pdflatex $<;
	makeindex -s gind.ist $(DOC);
	pdflatex $<;
	pdflatex $<;

$(PKG).sty: $(FILES)
	tex $(PKG).ins

clean:
	git clean -dfx
