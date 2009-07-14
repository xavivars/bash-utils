#!/bin/bash

TRAIN=70
DEV=20
TEST=10

FILE=$1
NFILE=`basename $FILE`

NL=`wc -l $FILE | cut -d " " -f 1`

ET=`echo "$NL * 10 * $TRAIN / 1000" | bc`

sed -n -e "1,$ET p" -e "$ET q" < $FILE > $NFILE.train

let SD=$ET+1
let SUM=$TRAIN+$DEV
ED=`echo "$NL * 10 * $SUM / 1000" | bc`

sed -n -e "$SD,$ED p" -e "$ED q" < $FILE > $NFILE.dev

let ST=$ED+1

sed -n -e "$ST,$NL p" -e "$NL q" < $FILE > $NFILE.test
