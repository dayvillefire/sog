.SUFFIXES: .pdf

TARGETS := $(shell ls -1 *.md | sed -e 's/\.md/\.pdf/;')

all: clean $(TARGETS)

clean:
	rm *.pdf -vf

%.pdf : %.md
	pandoc --template template/template.tex -f gfm+yaml_metadata_block --pdf-engine=xelatex --metadata-file=$< -i $< -o $@
