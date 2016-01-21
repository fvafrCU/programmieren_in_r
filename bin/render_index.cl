if [ -n "$(ip -o link show | grep 'state UP')" ] || \
    [ "$(hostname)" = "fvafrdebianCU" ]
then 
    ./bin/render.r -k index.rmd
else 
    echo "offline? skip rendering of index.rmd"
fi

