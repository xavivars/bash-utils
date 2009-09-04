#!/bin/bash

LNG=$1
TMP="/tmp/auxGCWtxt.tmp"

IN=''
Y=''
SEP=''
NUM=0

while read Y;
do
    IN="$IN$SEP$Y"
    SEP="\n"
    let NUM=$NUM+1
    if [ $NUM -eq 1000 ]; then

        echo -e $IN > $TMP

        aspell --encoding=utf-8 -l $LNG list < $TMP

        IN=''
        SEP=''

        echo -e $NUM" words" >&2
        NUM=0
    fi
done

echo -e $IN > $TMP

aspell --encoding=utf-8 -l $LNG list < $TMP

rm $TMP



