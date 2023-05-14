@ECHO OFF

MKDIR "mythesis"
CD    "mythesis"

COPY /Y "..\docs\njuthesis-sample.tex"            .
COPY /Y "..\docs\njuthesis-sample.bib"            .
COPY /Y "..\docs\njuthesis-setup.def"             .
COPY /Y "..\docs\nju-emblem.pdf"                  .
COPY /Y "..\docs\nju-name.pdf"                    .
COPY /Y "..\source\njuthesis.dtx"                 .

xetex "njuthesis.dtx"                      > NUL

DEL "*.dtx"
DEL "*.ins"
DEL "*.log"
DEL "njuthesis-doc.cls"

CD ..
