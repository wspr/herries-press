
PKG = $(shell basename `pwd`)
FILES = README $(PKG).ins $(PKG).tex
RESULTS = $(PKG).pdf $(PKG).sty chngpage.sty

$(PKG).tar.gz: $(FILES) $(RESULTS) Makefile
	ctanify --noauto \
	  README \
	  $(PKG).ins \
	  changepage.tex=source/latex/changepage \
	  $(RESULTS) \
	  --tdsonly=changepage.sty \
	  --tdsonly=chngpage.sty

$(PKG).pdf: $(PKG).tex
	pdflatex $<;
	makeindex -s gind.ist $(PKG);
	pdflatex $<;
	pdflatex $<;

$(PKG).sty: $(FILES)
	latex $(PKG).ins

README: README.markdown
	cp README.markdown README

clean:
	git clean -dfx
