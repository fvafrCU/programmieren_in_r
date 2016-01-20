make all: data_types.html index.html data_types.html
data_types.html: 
	./bin/render.r -k data_types.rmd
index.html: 
	if [ -n "$(ip -o link show | grep 'state UP')" ]; then ./bin/render.r -k index.rmd; else echo "offline? skip rendering of index.rmd"; fi
indices: set_permissions
	./bin/update_directory_listings.cl
check: set_permissions
	./bin/check_line_width.cl
set_permissions:
	chmod 700 ./bin/set_permissions.cl && ./bin/set_permissions.cl


































































































































































































































































































































































































































































































