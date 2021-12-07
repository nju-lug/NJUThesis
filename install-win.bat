@ECHO OFF

MKDIR "mythesis"
CD    "mythesis"

COPY /Y "..\docs\njuthesis-sample.tex"            .
COPY /Y "..\docs\njuthesis-sample.bib"            .
COPY /Y "..\source\njuthesis.dtx"                 .

curl -s -o "njuvisual.dtx" "https://mirror.nju.edu.cn/CTAN/macros/latex/contrib/njuvisual/njuvisual.dtx"
curl -s -o "njuvisual-curves.dtx" "https://mirror.nju.edu.cn/CTAN/macros/latex/contrib/njuvisual/njuvisual-curves.dtx"

xetex "njuthesis.dtx" > NUL
xetex "njuvisual.dtx" > NUL

DEL "*.dtx"
DEL "*.ins"
DEL "*.log"

CD ..
