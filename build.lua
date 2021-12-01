#!/usr/bin/env texlua

-- Build script for njuthesis.
-- run with `l3build`

module = "njuthesis"

checkengines = {"xetex", "luatex"}
checkopts    = "-interaction=batchmode"

ctanreadme = "README-CTAN.md"

sourcefiles  = {"source/*.dtx"}
installfiles = {"*.cls"}

typesetexe   = "xelatex"
typesetfiles = {"njuthesis.dtx"}

unpackfiles = {"njuthesis.dtx"}
unpackexe   = "xetex"
