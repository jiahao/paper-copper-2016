MAIN=main

pdf: output/cover-letter.pdf
	latexmk -pdf $(MAIN) -auxdir=output -outdir=output

output/cover-letter.pdf:
	make -C cover-letter

travis:
	#Create newunicodechar.sty
	curl -O http://math.sut.ac.th/lab/software/texlive/texmf-dist/tex/latex/newunicodechar/newunicodechar.sty
	#Old latexmk doesn't understand auxdir and outdir options
	latexmk -pdf -pdflatex='pdflatex %S %O -interaction=nonstopmode -halt-on-error' $(MAIN)

clean:
	rm -vf output/* *.bbl *.blg *.aux *.fls *.fdb_latexmk *.log *.out *.toc *.tdo $(MAIN).pdf $(MAIN).dvi

