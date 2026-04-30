# Project Overview

`njuthesis` provides a LaTeX document class for Nanjing University
undergraduate theses, graduate dissertations, doctoral dissertations, and
postdoctoral reports.

The class aims to encode university formatting requirements and related
national standards while providing a user-facing key-value interface. The
implementation is written mostly in LaTeX3 and documented in the same dtx file
that generates the distributable files.

Major directories and files:

- `source/njuthesis.dtx` - canonical documented source and manual.
- `source/latexmkrc` - latexmk settings for building the documentation.
- `build.lua` - l3build configuration.
- `docs/` - sample thesis, setup file, bibliography, and NJU visual assets.
- `test/` - smoke-test documents for engine and document-type variants.
- `scripts/` - dependency discovery helpers used by CI.
- `.github/workflows/build.yml` - PR and branch build workflow.
- `.github/workflows/release.yml` - tag release workflow and packaging.
- `install-unix.sh` and `install-win.bat` - scripts to create a local example
  workspace.

Primary user path:

1. Install a current TeX distribution.
2. Use the release user zip or the NJU online TeX platform.
3. Edit `njuthesis-sample.tex` and `njuthesis-setup.def`.
4. Compile with XeLaTeX or LuaLaTeX, commonly through `latexmk -xelatex`.

Primary maintainer path:

1. Edit `source/njuthesis.dtx`.
2. Use `l3build` to unpack/install/check.
3. Keep samples and tests aligned with user-facing changes.
4. Let CI package generated artifacts from the canonical source.
