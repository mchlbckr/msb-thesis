.PHONY: all html pdf clean

all: html pdf

html:
	quarto render --to html --output-dir _output-html

pdf:
	quarto render --to pdf --output-dir _output-pdf

clean:
	rm -rf _output-html _output-pdf
