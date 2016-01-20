for file in $(find . -name "*.rmd")
do 
    grep -v "\[.*\](.*)" index.rmd | wc -L
    grep -v "\[.*\](.*)" index.rmd | awk '{ if (length($0) > max) {max = 80; maxline = $0} } END { print maxline }'
done

