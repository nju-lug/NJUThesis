@ECHO OFF

MKDIR "mythesis"
CD    "mythesis"

COPY /Y "..\template\njuthesis-sample.tex"        .
COPY /Y "..\template\njuthesis-sample.bib"        .
COPY /Y "..\template\njuthesis-setup.def"         .
COPY /Y "..\source\nju-emblem*.pdf"               .
COPY /Y "..\source\nju-name*.pdf"                 .
COPY /Y "..\source\njuthesis.dtx"                 .

xetex "njuthesis.dtx"                      > NUL

DEL "*.dtx"
DEL "*.ins"
DEL "*.log"
DEL "njuthesis-doc.cls"

CD ..
