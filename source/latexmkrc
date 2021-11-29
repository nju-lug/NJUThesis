# Latexmk configuration file for njuthesis documentation.
# vim: set ft=perl:

# Use XeLaTeX to compile.
$pdf_mode = 5;
$xelatex = "xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";

$bibtex_use = 1.5;

# Clean auxiliary files .
$clean_ext = "hd loe ptc run.xml synctex.gz thm xdv";

# Process index.
$makeindex = "makeindex %O -s gind.ist -o %D %S";
add_cus_dep('glo','gls',0,'makeindex');
sub makeindex {
  if ( $silent ) {
    system( "makeindex -q -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"" );
  }
  else {
    system( "makeindex -s gglo.ist -o \"$_[0].gls\" \"$_[0].glo\"" );
  };
}
$makeindex_silent_switch = "-q";

# Show CPU time used.
$show_time = 1;
