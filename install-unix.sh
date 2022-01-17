#!/usr/bin/env sh

mkdir -p "mythesis"
cd "mythesis"

cp -f "../docs/njuthesis-sample.tex"            .
cp -f "../docs/njuthesis-sample.bib"            .
cp -f "../source/njuthesis.dtx"                 .
cp -f "../scripts/generate-img.tex"             .

wget -q "https://mirror.nju.edu.cn/CTAN/macros/latex/contrib/njuvisual/njuvisual.dtx"
wget -q "https://mirror.nju.edu.cn/CTAN/macros/latex/contrib/njuvisual/njuvisual-curves.dtx"

xetex "njuthesis.dtx"                      > /dev/null
xetex "njuvisual.dtx"                      > /dev/null
pdflatex --shell-escape "generate-img.tex" > /dev/null

rm *.aux
rm *.auxlock
rm *.dpth
rm *.dtx
rm *.ins
rm *.log
rm *.md5
rm generate-img.tex
rm generate-img.pdf
rm njuvisual-example.tex

cd ..
