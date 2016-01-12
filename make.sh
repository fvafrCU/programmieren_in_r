render.r -k index.rmd
chmod 644 index.*
chmod 744 index.R
find . -type d -exec chmod 755 {} \;
find src/ -type f -exec chmod 644 {} \;
find data/ -type f -exec chmod 644 {} \;
find answers/ -type f -exec chmod 644 {} \;
find examples/ -type f -exec chmod 644 {} \;
./bin/update_directory_listings.sh

grep -v "\[.*\](.*)" index.rmd | wc -L
grep -v "\[.*\](.*)" index.rmd | awk '{ if (length($0) > max) {max = 80; maxline = $0} } END { print maxline }'
