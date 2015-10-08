MAIN=main

pdf:
	latexmk -lualatex $(MAIN)

clean:
	rm -vf *.bbl *.blg *.aux *.fls *.fdb_latexmk *.log *.out *.toc $(MAIN).pdf $(MAIN).dvi

