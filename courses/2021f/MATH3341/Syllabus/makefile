LATEX = latexmk
FLAGS = -xelatex -silent
FILES = MATH.3341.Syllabus.Fall.2021.Online
RM = rm -rf

%.pdf: %.tex
	$(LATEX) $(FLAGS) $<

clean:
	$(LATEX) -c
	$(RM) *xdv

distclean: clean
	$(RM) $(FILES:=.pdf)
