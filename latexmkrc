# vim: set ft=perl:

# Use XeLaTeX to compile.
$pdf_mode = 5;

$xelatex = "xelatex -shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -no-pdf -synctex=1 %O %S";
$xdvipdfmx = "xdvipdfmx -q -E -o %D %O %S";

$bibtex_use = 1.5;

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

# Process glossary (change history).
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("zhmakeindex -s gglo.ist -o \"$_[0].gls\" \\
        -t \"$_[0].glg\" \"$_[0].glo\"");
}

add_cus_dep('nlo', 'nls', 0, 'nlo2nls');
sub nlo2nls {
    system("makeindex -s nomencl.ist -o \"$_[0].nls\" \"$_[0].nlo\"");
}
push @generated_exts, 'nlo', 'nls';
