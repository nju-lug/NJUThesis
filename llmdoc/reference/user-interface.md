# User Interface Reference

Class:

```tex
\documentclass{njuthesis}
```

Supported engines:

- XeLaTeX.
- LuaLaTeX.

Common class options:

- `type = bachelor|master|doctor|postdoc`
- `degree = academic|professional`
- `nl-cover`
- `decl-page`
- `draft`
- `anonymous`
- `minimal`
- `oneside`
- `twoside`
- `latin-font = fandol|gyre|mac|macoffice|win|none`
- `cjk-font = fandol|founder|mac|macoffice|noto|source|win|none`
- `fontset = fandol|mac|macoffice|win|none`
- `math-font = asana|cambria|fira|garamond|lm|libertinus|newcm|stix|bonum|dejavu|pagella|schola|termes|xits|none`
- `font-path = <path>`
- `config = <file list>`

Main setup command:

```tex
\njusetup{...}
\njusetup[info]{...}
\njusetup[bib/resource]{refs.bib}
```

The optional argument is normalized as a top-level `nju` key assignment. Module
forms such as `\njusetup[info]{...}` rely on the corresponding top-level module
key to forward into `nju / info`; full paths such as
`\njusetup[info/title]{...}` are passed as top-level nested keys.

Important setup modules:

- `info` - title, author, department, major, supervisor, dates, classification,
  committee, degree names, email, and related metadata.
- `bib` - bibliography style, resource files, and biblatex options.
- `image` - graphics path and NJU emblem/name selection. `nju-logo-color`
  accepts built-in colors `black|purple` and sets both emblem and name at once;
  `nju-emblem` and `nju-name` also accept custom file paths.
- `abstract` - abstract TOC entry, underline behavior, and title style.
- `tableofcontents`, `listoffigures`, `listoftables` - TOC entry behavior.
- `math` - TeX/ISO/GB math style and detailed symbol choices.
- `theorem` - theorem style, fonts, QED symbol, counters, type list, and
  built-in environment generation.
- `footnote` - footnote marker style, circled text options, and hanging indent.
- `header`, `footer` - page style content positions.
- `anonymous-mode` - blind-review behavior such as hiding school information.

Feature toggles:

- `unicode-math = false` means njuthesis does not perform its automatic math
  configuration. The `nju / math` setup keys should still exist so shared setup
  files can be parsed, but keys that require njuthesis-managed `unicode-math`
  behavior are filtered and inert under this option.

Major document commands and environments:

- `\maketitle` - generates configured cover and declaration pages.
- `abstract` - Chinese abstract.
- `abstract*` - English abstract.
- `\tableofcontents`, `\listoffigures`, `\listoftables`.
- `\mainmatter`, `\frontmatter` - redefined page style/page numbering
  transitions.
- `notation`, `notation*` - symbol table pages.
- `preface` - preface page.
- `acknowledgement` - acknowledgement page, with anonymous-mode behavior.
- `\njuchapter{...}` - unnumbered chapter with TOC/bookmark handling.
- `\njupaperlist[<title>]{<bib keys>}` - academic achievements list.

Customization commands:

- `\njusetformat{<name>}{<format>}`
- `\njusetlength{<name>}{<length>}`
- `\njusetlength*{<name>}{<skip>}`
- `\njusetname{...}`
- `\njusettext{...}`
