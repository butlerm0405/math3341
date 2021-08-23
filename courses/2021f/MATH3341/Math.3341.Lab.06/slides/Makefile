TEX = xelatex  # xelatex
PANDOC = pandoc
TFLAGS = -interaction=batchmode
PFLAGS =  -t beamer --slide-level=3 --variable="institute:University of Wyoming" --variable="shortinstitute:UWyo." --variable="shorttitle:MATH 3341 Lab 06" --variable="shortauthor:Libao Jin" --template=template.tex
PFLAGSS = -t beamer --slide-level=3 --variable="seal:yes" --variable="institute:University of Wyoming" --variable="shortinstitute:UWyo." --variable="shorttitle:MATH 3341 Lab 06" --variable="shortauthor:Libao Jin" --template=template.tex
PTFLAGS = -t beamer --slide-level=3
BTHEME = -V colortheme:crane -V theme:Bergen -V fonttheme:professionalfonts
BTHEME = -V colortheme:crane -V theme:Berkeley -V fonttheme:professionalfonts
ETHEME = -V colortheme:crane -V theme:metropolis -V fonttheme:professionalfonts
MTHEME = -V colortheme:crane -V theme:Madrid -V fonttheme:professionalfonts
RTHEME = -V colortheme:crane -V theme:Rochester -V fonttheme:professionalfonts
WTHEME = -V colortheme:crane -V theme:Warsaw -V fonttheme:professionalfonts
THEME = -V colortheme:crane -V theme:Warsaw -V fonttheme:professionalfonts
OUTPUTFOLDER = .

PDFFILES = slides slides_warsaw slides_rochester slides_metropolis slides_madrid slides_bergen slides_berkeley

TEXFILES = body

.DEFAULT_GOAL := slides

all: $(PDFFILES)

basic: slides slides_transition

clean:
	rm -rf $(TEXFILES:=.out) $(TEXFILES:=.aux) $(TEXFILES:=.txt) $(TEXFILES:=.idx) $(TEXFILES:=.log) $(TEXFILES:=.nav) $(TEXFILES:=.toc) $(TEXFILES:=.snm) $(TEXFILES:=.tex)

distclean: clean
	rm -rf $(PDFFILES:=.out) $(PDFFILES:=.aux) $(PDFFILES:=.txt) $(PDFFILES:=.idx) $(PDFFILES:=.log) $(addprefix $(OUTPUTFOLDER)/, $(PDFFILES:=.pdf)) $(PDFFILES:=.nav) $(PDFFILES:=.toc) $(PDFFILES:=.snm)  $(addprefix $(OUTPUTFOLDER)/, $(TEXFILES:=.pdf))

slides: body.pdc
	$(PANDOC) --variable="handout:handout" $(PFLAGS) $(THEME) $< -o $(OUTPUTFOLDER)/$@.pdf

slides_transition: body.pdc
	$(PANDOC) $(PFLAGS) $(THEME) $< -o $(OUTPUTFOLDER)/$@.pdf

slides_bergen: body.pdc
	$(PANDOC) $(PFLAGSS) $(BTHEME) $< -o $(OUTPUTFOLDER)/$@.pdf

slides_berkeley: body.pdc
	$(PANDOC) $(PFLAGS) $(KTHEME) $< -o $(OUTPUTFOLDER)/$@.pdf

slides_madrid: body.pdc
	$(PANDOC) $(PFLAGS) $(MTHEME) $< -o $(OUTPUTFOLDER)/$@.pdf

slides_metropolis: body.pdc
	$(PANDOC) $(PFLAGS) $(ETHEME) $< -o $(OUTPUTFOLDER)/$@.pdf

slides_rochester: body.pdc
	$(PANDOC) $(PFLAGS) $(RTHEME) $< -o $(OUTPUTFOLDER)/$@.pdf

slides_warsaw: body.pdc
	$(PANDOC) $(PFLAGS) $(WTHEME) $< -o $(OUTPUTFOLDER)/$@.pdf

body: body.pdc
	$(PANDOC) --listings $(PTFLAGS) $< -o $@.tex

slides_main: main.tex body
	$(TEX) $(TFLAGS) --shell-escape --jobname=$@ $<
	$(TEX) $(TFLAGS) --shell-escape --jobname=$@ $<
	mv $@.pdf $(OUTPUTFOLDER)/$@.pdf
	rm -rf $(@:=.log) $(@:=.out) $(@:=.aux) $(@:=.txt) $(@:=.idx) $(@:=.log) $(@:=.nav) $(@:=.toc) $(@:=.snm) $(@:=.vrb) *.log *.out *.aux *.txt *.idx *.log *.nav *.toc *.snm *.vrb
