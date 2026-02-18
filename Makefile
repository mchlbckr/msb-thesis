.PHONY: all html pdf check clean

all: html pdf

html:
	quarto render --to html --output-dir _output-html

pdf:
	quarto render --to pdf --output-dir _output-pdf

# Validate BibTeX syntax without a full render
check:
	biber --tool --validate-datamodel bib/references.bib

clean:
	rm -rf _output-html _output-pdf
