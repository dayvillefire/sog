.SUFFIXES: .pdf

clean:
	rm *.pdf -vf

%.pdf : %.md
	pandoc --template template/template.tex -f gfm+yaml_metadata_block --pdf-engine=xelatex --metadata-file=$< -i $< -o $@
