DOCS = NYSGP_achievements.pdf

nysgp_FIGS =

nysgp_TABS = tag.tex

nysgp_DEPS = $(nysgp_TABS) $(nysgp_FIGS) biblio.bib

BYPROD = NYSGP_acievements.bbl NYSGP_achievements.blg __tag.tex

default: gitID $(DOCS)

.PHONY: gitID
gitID:
	./git-tag.sh

NYSGP_achievements.pdf: NYSGP_achievements.tex $(nysgp_DEPS)

NYSGP_achievements.bbl: NYSGP_achievements.pdf

%.pdf: %.tex
	pdflatex $< && pdflatex $<

clean:
	rm -f *.aux *.log *.out *.dvi $(DOCS) $(BYPROD)
