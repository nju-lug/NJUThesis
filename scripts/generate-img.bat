@ECHO OFF

pdflatex --shell-escape generate-img
DEL "generate-img.pdf"
DEL "*.aux"
DEL "*.auxlock"
DEL "*.dpth"
DEL "*.log"
DEL "*.md5"
