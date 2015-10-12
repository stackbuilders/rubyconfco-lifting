all: compile

compile: rubyconf-presentation.tex
	pdflatex -output-directory output rubyconf-presentation.tex
	cp output/rubyconf-presentation.pdf rubyconf-presentation.pdf

clean:
	rm -f output/rubyconf-presentation.{aux,log,nav,out,snm,toc,vrb,pdf}
	rm -f rubyconf-presentation.{aux,log,nav,out,snm,toc,vrb,pdf}
