MAIN=main

pdf:
	latexmk -pdf $(MAIN) -auxdir=output -outdir=output

travis:
	#Old latexmk doesn't understand auxdir and outdir options
	latexmk -pdf -pdflatex='pdflatex %S %O -interaction=nonstopmode -halt-on-error' $(MAIN)

clean:
	rm -vf output/* *.bbl *.blg *.aux *.fls *.fdb_latexmk *.log *.out *.toc *.tdo $(MAIN).pdf $(MAIN).dvi

