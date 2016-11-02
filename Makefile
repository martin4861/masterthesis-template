filename=thesis

pdf: 
	mkdir -p precompiled
	pdflatex -synctex=-1 -interaction=nonstopmode -shell-escape ${filename}.tex
	bibtex ${filename}
	pdflatex -synctex=-1 -interaction=nonstopmode -shell-escape ${filename}.tex
	pdflatex -synctex=-1 -interaction=nonstopmode -shell-escape ${filename}.tex

read:
	evince ${filename}.pdf &

clean:
	rm -rf precompiled
	rm -f ${filename}.{ps,pdf,log,aux,out,dvi,bbl,blg}