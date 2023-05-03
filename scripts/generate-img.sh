#!/usr/bin/env sh

pdflatex --shell-escape generate-img
rm generate-img.pdf
rm *.aux
rm *.auxlock
rm *.dpth
rm *.log
rm *.md5
