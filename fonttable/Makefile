
MAINTAINER = Will Robertson
EMAIL1 = will.robertson
EMAIL2 = latex-project.org
PKG = $(shell basename `pwd`)
VERSION = $(shell egrep '\[[0-9]{4}/[0-9]{2}/[0-9]{2}' $(PKG).dtx  | cut -d ' ' -f 4)
FILES = README $(PKG).ins $(PKG).dtx
RESULTS = $(PKG).pdf $(PKG).sty

$(PKG).tar.gz: $(FILES) $(RESULTS)
	ctanify $(PKG).ins $(PKG).pdf README

$(PKG).pdf: $(PKG).dtx
	pdflatex -draftmode $<;
	makeindex -s gind.ist $(PKG);
	pdflatex -draftmode $<;
	pdflatex $<;

$(PKG).sty: $(FILES)
	tex $(PKG).ins

clean:
	git clean -dfx

upload:
	ctanupload --contribution=$(PKG) --version=$(VERSION) \
		--name "$(MAINTAINER)" --email=$(EMAIL1)@$(EMAIL2) \
		--summary "Print font tables from a LaTeX document." \
		--directory=/macros/latex/contrib/$(PKG) \
		--DoNotAnnounce=1 \
		--announce "" \
		--notes "" \
		--license=free --freeversion=lppl \
		--file=$(PKG).tar.gz
