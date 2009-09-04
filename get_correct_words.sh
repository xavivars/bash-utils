#!/bin/bash

LNG=$1
TMP="/tmp/auxGCWtxt.tmp"
LST="/tmp/auxGCWlist.tmp"
CTMP="/tmp/auxcGCWtxt.tmp"

IN=''
Y=''
SEP=''
NUM=0

echo -e '' > $LST
echo -e '' > $CTMP

while read Y;
do
    IN="$IN$SEP$Y"
    SEP="\n"
    let NUM=$NUM+1
    if [ $NUM -eq 1000 ]; then

        echo -e $IN > $TMP
        echo -e $IN >> $CTMP

        aspell --encoding=utf-8 -l $LNG list < $TMP >> $LST

        IN=''
        SEP=''

        echo -e $NUM" words" >&2
        NUM=0
    fi
done

echo -e $IN > $TMP
echo -e $IN >> $CTMP

aspell --encoding=utf-8 -l $LNG list < $TMP >> $LST

deleteWords.py $LST < $CTMP | sed -e '/^$/d'

rm $TMP $LST



