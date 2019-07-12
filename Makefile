FILE = $(wildcard *.tex)
PDF  = $(FILE:.tex=.pdf)
DVI  = $(FILE:.tex=.dvi)

.PHONY:run
run:$(PDF) $(DVI)

%.pdf: %.dvi
	dvipdfmx $<

%.dvi: %.tex
	platex $<
#	pbibtex $*

#クリーンして実行
.PHONY: all
all: clean run

#クリーン
.PHONY:clean
clean: 
	rm -f $(PDF) $(DVI)
