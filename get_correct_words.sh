#!/bin/bash

LNG=$1
TMP="/tmp/auxGCWtxt.tmp"
LST="/tmp/auxGCWlist.tmp"

IN=''
Y=''
SEP=''

while read Y;
do
    IN="$IN$SEP$Y"
    SEP="\n"
done

echo -e $IN > $TMP

aspell --encoding=utf-8 -l $LNG list < $TMP > $LST

deleteWords.py $LST < $TMP | sed -e '/^$/d'

rm $TMP $LST



