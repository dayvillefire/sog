.SUFFIXES: .pdf .html

TARGETS := $(shell ls -1 *.md | sed -e 's/\.md/\.pdf/;')
HTML_TARGETS := $(shell ls -1 *.md | sed -e 's/\.md/\.html/;')

all: clean compile assemble

assemble: compile
	@echo " --> Compiling into single output file"
	pdfjam $(TARGETS) -o SOG-Book.pdf

compile: $(TARGETS) $(HTML_TARGETS)
	@echo " --> Compiling individual PDF files from Markdown source"

clean:
	@echo " --> Cleaning up old files"
	rm *.pdf *.html -f

%.pdf : %.md
	pandoc --template template/template.tex -f gfm+yaml_metadata_block+fancy_lists --pdf-engine=xelatex --metadata-file=$< -i $< -o $@

%.html : %.md
	pandoc -f gfm+yaml_metadata_block+fancy_lists --metadata-file=$< -i $< -o $@
