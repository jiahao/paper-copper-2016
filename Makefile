MAIN=main

pdf:
	latexmk -pdf $(MAIN) -auxdir=output -outdir=output

travis:
	#Create newunicodechar.sty
	curl -O  http://mirrors.ctan.org/macros/latex/contrib/newunicodechar/newunicodechar.ins
	latex newunicodechar.ins
	#Old latexmk doesn't understand auxdir and outdir options
	latexmk -pdf -pdflatex='pdflatex %S %O -interaction=nonstopmode -halt-on-error' $(MAIN)

clean:
	rm -vf output/* *.bbl *.blg *.aux *.fls *.fdb_latexmk *.log *.out *.toc *.tdo $(MAIN).pdf $(MAIN).dvi

