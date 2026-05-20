#!/usr/bin/env sh

mkdir -p mythesis
cd mythesis

cp -f ../template/njuthesis-sample.tex        .
cp -f ../template/njuthesis-sample.bib        .
cp -f ../template/njuthesis-setup.def         .
cp -f ../source/nju-emblem*.pdf               .
cp -f ../source/nju-name*.pdf                 .
cp -f ../source/njuthesis.dtx                 .

xetex njuthesis.dtx > /dev/null

rm *.dtx
rm *.ins
rm *.log
rm njuthesis-doc.cls

cd ..
