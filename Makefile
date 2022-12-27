.SUFFIXES: .pdf

TARGETS := $(shell ls -1 *.md | sed -e 's/\.md/\.pdf/;')

all: clean compile assemble

assemble: compile
	@echo " --> Compiling into single output file"
	pdfjam $(TARGETS) -o SOG-Book.pdf

compile: $(TARGETS)
	@echo " --> Compiling individual PDF files from Markdown source"

clean:
	@echo " --> Cleaning up old files"
	rm *.pdf -vf

%.pdf : %.md
	pandoc --template template/template.tex -f gfm+yaml_metadata_block --pdf-engine=xelatex --metadata-file=$< -i $< -o $@
