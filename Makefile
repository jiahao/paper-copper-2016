MAIN=main

pdf:
	latexmk -lualatex $(MAIN) -auxdir=output -outdir=output

travis:
	#Old latexmk doesn't understand auxdir and outdir options
	latexmk -lualatex -pdflatex='pdflatex %S %O -interaction=nonstopmode -halt-on-error' $(MAIN)

clean:
	rm -vf output/* *.bbl *.blg *.aux *.fls *.fdb_latexmk *.log *.out *.toc *.tdo $(MAIN).pdf $(MAIN).dvi

