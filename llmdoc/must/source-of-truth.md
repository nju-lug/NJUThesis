# Source of Truth

The canonical source is `source/njuthesis.dtx`.

Treat these as primary:

- `source/njuthesis.dtx` - implementation, manual text, docstrip guards, class
  code, generated definition-file sections, and documentation class. The dtx
  preamble also includes a file-list metadata block and an install-time
  `\Msg` block; both must list every source file (including logo PDFs:
  `njuthesis-emblem-black.pdf`, `njuthesis-emblem-purple.pdf`,
  `njuthesis-name-black.pdf`, `njuthesis-name-purple.pdf`). When adding or
  renaming source files, update both blocks.
- `build.lua` - l3build configuration for unpacking, installing, checking, and
  CTAN packaging.
- `template/` - public starter sample files used in the user package.
- `examples/` - typical non-core usage examples; these are references, not
  guaranteed common template interfaces.
- `test/` - compile fixtures for supported engines and document variants.
- `.github/workflows/` - build and release behavior.
- `CHANGELOG.md` - user-visible change history and unreleased notes.

Treat these as generated or secondary unless the task says otherwise:

- `build/` - l3build output.
- `mythesis/njuthesis.cls` and `mythesis/*.def` - generated from the dtx.
- `mythesis/*.aux`, `*.bbl`, `*.bcf`, `*.blg`, `*.fdb_latexmk`, `*.fls`,
  `*.log`, `*.out`, `*.run.xml`, `*.thm`, `*.toc`, `*.xdv`, `*.pdf` - compile
  outputs or example workspace artifacts.

When behavior differs between generated files and `source/njuthesis.dtx`, trust
the dtx and regenerate or update generated artifacts only when the requested
workflow requires it.
