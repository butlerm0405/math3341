LATEX = latexmk
FLAG = --xelatex -quiet
FILES = main

all: distclean $(FILES:=.pdf)

main.pdf: main.tex
	$(LATEX) $(FLAG) $<
	$(LATEX) -c

clean:
	latexmk -c

distclean:
	latexmk -C
