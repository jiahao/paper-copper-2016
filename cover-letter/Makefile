MAIN=cover-letter

pdf:
	latexmk -pdf $(MAIN) -auxdir=../output -outdir=../output

clean:
	rm -vf ../output/* *.bbl *.blg *.aux *.fls *.fdb_latexmk *.log *.out *.toc *.tdo $(MAIN).pdf $(MAIN).dvi

