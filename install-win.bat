@ECHO OFF

MKDIR "mythesis"
CD    "mythesis"

COPY /Y "..\docs\njuthesis-sample.tex"            .
COPY /Y "..\docs\njuthesis-sample.bib"            .
COPY /Y "..\source\njuthesis.dtx"                 .
COPY /Y "..\scripts\generate-img.tex"             .

curl -s -o "njuvisual.dtx" "https://mirror.nju.edu.cn/CTAN/macros/latex/contrib/njuvisual/njuvisual.dtx"
curl -s -o "njuvisual-curves.dtx" "https://mirror.nju.edu.cn/CTAN/macros/latex/contrib/njuvisual/njuvisual-curves.dtx"

xetex "njuthesis.dtx"                      > NUL
xetex "njuvisual.dtx"                      > NUL
pdflatex --shell-escape "generate-img.tex" > NUL

DEL "*.aux"
DEL "*.auxlock"
DEL "*.dpth"
DEL "*.dtx"
DEL "*.ins"
DEL "*.log"
DEL "*.md5"
DEL "generate-img.tex"
DEL "generate-img.pdf"
DEL "njuvisual-example.tex"

CD ..
