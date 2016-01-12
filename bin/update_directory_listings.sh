#!/bin/sh
# adapted from http://blog.kaltepoth.de/
# github pages accept static html only, so we need to create static directory
# listings for subdirectories.
for DIR in src data data/input; do
  (
    echo  "<html>\n<body>\n<h1>Directory listing</h1>\n<hr/>\n<pre>"
    ls -1pa "${DIR}" | grep -v "^\./$" | grep -v "^index\.html$" | \
        awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }'
    echo  "</pre>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done
