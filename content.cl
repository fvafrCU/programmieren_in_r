sed -e "/\`\`\`/,/\`\`\`/d" < index.rmd | grep "^#.*" | sed -e "s/\*//g" > content.md
#pandoc -s -t beamer content.md -o content.pdf
