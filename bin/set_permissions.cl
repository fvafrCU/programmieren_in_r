chmod 644 index.*
chmod 744 index.R
chmod 700 bin/*
find . -type d -exec chmod 755 {} \;
for dir in src data answers examples 
do 
    find ${dir} -type f -exec chmod 644 {} \;
done
for dir in src data answers examples
do 
    find ${dir} -type d -exec chmod 755 {} \; 
done
 
