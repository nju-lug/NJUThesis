#!/usr/bin/env texlua

-- Build script for njuthesis.
-- run with `l3build`

module        = "njuthesis"

checkengines  = {"xetex"}
checkopts     = "-interaction=batchmode"
testfiledir   = "test"
checkfiles    = {"*.lvt"}

textfiles     = {"LICENSE", "README*.md", "*.ins"}
ctanreadme    = "README-CTAN.md"

njulogofiles  = {
    "nju-emblem-black.pdf",
    "nju-emblem-purple.pdf",
    "nju-name-black.pdf",
    "nju-name-purple.pdf",
}

sourcefiledir = "source"
sourcefiles   = {"*.dtx", table.unpack(njulogofiles)}
installfiles  = {"*.cls", "*.def", table.unpack(njulogofiles)}

binaryfiles   = {table.unpack(njulogofiles)}

typesetexe    = "xelatex"
typesetfiles  = {"njuthesis.dtx"}

unpackexe     = "xetex"
unpackfiles   = {"njuthesis.dtx"}
