make all: indices html pdf check

make html: data_types.html index.html 
make pdf: eval.pdf notes.pdf slides.pdf
	
eval.pdf:
	texi2pdf --clean notes/eval.tex
notes.pdf:
	pandoc -t beamer notes/notes.md -o notes.pdf
slides.pdf: 
	pandoc -t beamer notes/slides.md -o slides.pdf
data_types.html: 
	./bin/render.r -k data_types.rmd

.PHONY: index.html
index.html: 
	./bin/render_index.cl
indices: set_permissions
	./bin/update_directory_listings.cl
check: set_permissions
	./bin/check_line_width.cl
set_permissions:
	chmod 700 ./bin/set_permissions.cl && ./bin/set_permissions.cl
