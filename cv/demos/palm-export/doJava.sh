#!/bin/sh

PATH=/home2/MiniWeb/berczuk/bin/j2re1.4.1_01/bin:$PATH

defs="-DisbnIn=${1}"
categoryDef="-DcategoryIn=${2}"

if test -n "${2}"; then
  defs="$defs $categoryDef"
fi

#echo "Running shell pgm <br/>"
#myjar=/home2/MiniWeb/berczuk/puablic_html/tempdir/cgidemo.jar
java $*

