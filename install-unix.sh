#!/usr/bin/env sh

mkdir -p "mythesis"
cd "mythesis"

cp -f "../docs/njuthesis-sample.tex"            .
cp -f "../docs/njuthesis-sample.bib"            .
cp -f "../docs/njuthesis-setup.def"             .
cp -f "../docs/nju-emblem.pdf"                  .
cp -f "../docs/nju-name.pdf"                    .
cp -f "../source/njuthesis.dtx"                 .

xetex "njuthesis.dtx" > /dev/null

rm *.dtx
rm *.ins
rm *.log
rm njuthesis-doc.cls

cd ..
