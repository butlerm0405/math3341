LATEX = xelatex --interaction=batchmode
#FILES = MATH.3341.Lab.14
FILES = test
RM = rm -rf

all: distclean $(FILES:=.pdf)

MATH.3341.Lab.14.pdf: MATH.3341.Lab.14.tex
	$(LATEX) $<
	$(LATEX) $<
	$(RM) $(FILES:=.out) $(FILES:=.log) $(FILES:=.txt) $(FILES:=.idx) $(FILES:=.toc) $(FILES:=.aux)
test.pdf: test.tex
	$(LATEX) $<
	$(LATEX) $<
	$(RM) $(FILES:=.out) $(FILES:=.log) $(FILES:=.txt) $(FILES:=.idx) $(FILES:=.toc) $(FILES:=.aux)


clean:
	$(RM) $(FILES:=.out) $(FILES:=.log) $(FILES:=.txt) $(FILES:=.idx) $(FILES:=.toc) $(FILES:=.aux) texput.log

distclean: clean
	$(RM) $(FILES:=.pdf)
