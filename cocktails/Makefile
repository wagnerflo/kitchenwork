cocktails.pdf: cocktails.tex .cocktails.tex
	context $< || rm -f $@
	context --purge

.cocktails.tex: $(filter-out cocktails.tex,$(wildcard *.tex))
	cat $(sort $?) > .cocktails.tex
