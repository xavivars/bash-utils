#!/bin/bash

DIR=`dirname $0`


$DIR/./addSpaces.py | sed -e "s/\ \ \ /\.\n/g" -e "s/$/\./g"
