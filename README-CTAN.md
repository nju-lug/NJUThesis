The `njuthesis` class
=====================

The `njuthesis` class is intended for typesetting Nanjing University
dissertations with LaTeX, providing support for bachelor, master, and
doctoral thesis. Compilation of this class requires either `xelatex`
or `lualatex` engine.

Usage
-----

A minimal example of this document class should look like

```LaTeX
\documentclass{njuthesis}
\njusetup{}
\begin{document}
\maketitle
\tableofcontents
\mainmatter
\chapter{Welcome}
Hello \LaTeX{}！
\printbibliography
\end{document}
```

Contributing
------------

[Issues](https://github.com/nju-lug/NJUThesis/issues) and
[pull requests](https://github.com/nju-lug/NJUThesis/pulls)
are always welcome.

Wiki
----

Please see [Chinese wiki](https://github.com/nju-lug/NJUThesis/wiki).

License
-------

This work may be distributed and/or modified under the conditions of
the [LaTeX Project Public License](http://www.latex-project.org/lppl.txt),
either version 1.3c of this license or (at your option) any later
version.

-----

Copyright (C) 2021 - 2022 by NJU LUG.
