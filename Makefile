FILE = $(wildcard *.tex)
PDF  = $(FILE:.tex=.pdf)
DVI  = $(FILE:.tex=.dvi)
AUX  = $(FILE:.tex=.aux)
LOG  = $(FILE:.tex=.log)

.PHONY:run
run:$(PDF) $(DVI)

%.pdf: %.dvi
	dvipdfmx $<

%.dvi: %.tex
	platex -synctex=1 $<
#	pbibtex $*

#クリーンして実行
.PHONY: all
all: clean run

#クリーン
.PHONY:clean
clean: 
	rm -f $(PDF) $(DVI) $(AUX) $(LOG)
