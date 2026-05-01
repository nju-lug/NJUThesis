# Build and Test Rules

Build tool:

- Use `l3build` through `build.lua`.
- The configured check engines are `xetex` and `luatex`.
- `l3build install` unpacks and installs generated class/definition files for
  local tests.
- `l3build ctan` creates the CTAN package during release.

Compile engines:

- User documents should compile with XeLaTeX or LuaLaTeX.
- The README recommends `latexmk -xelatex` for the sample template.
- CI currently compiles selected XeLaTeX tests; the LuaLaTeX test exists but is
  commented out in `.github/workflows/build.yml`.

Important local checks:

- For class or interface edits, run an l3build unpack/install step before
  testing generated class behavior.
- For l3keys, option parsing, or other log-checkable behavior, add focused
  l3build regression tests as `.lvt`/`.tlg` pairs under `test/` and run
  `l3build check -e xetex <test-name>`.
- Compile at least one relevant file from `test/` when touching layout,
  bibliography, class options, fonts, covers, abstracts, or declaration pages.
- For release/package changes, inspect `.github/workflows/release.yml` and
  confirm the CTAN/user zip contents still make sense.

Do not rely on `build/` or `mythesis/` being up to date unless you just
regenerated them in the current workflow.
