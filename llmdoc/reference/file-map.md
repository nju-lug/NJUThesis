# File Map

Root files:

- `README.md` - Chinese project README and user quick start.
- `README-CTAN.md` - CTAN-oriented English README.
- `CHANGELOG.md` - release history and unreleased notes.
- `LICENSE` - LPPL license.
- `build.lua` - l3build config.
- `install-unix.sh`, `install-win.bat` - create a local example workspace.
- `.editorconfig`, `.gitignore`, `.vscode/settings.json` - editor/repo config.

Source:

- `source/njuthesis.dtx` - canonical source and manual.
- `source/latexmkrc` - documentation build settings.
- `source/nju-emblem-*.pdf` - NJU emblem logo assets (black and purple).
- `source/nju-name-*.pdf` - NJU name logo assets (black and purple).

Samples and assets:

- `docs/njuthesis-sample.tex` - public sample thesis.
- `docs/njuthesis-setup.def` - public sample configuration.
- `docs/njuthesis-sample.bib` - sample bibliography.

Tests:

- `test/test-xetex-undergraduate.tex` - undergraduate XeLaTeX variant.
- `test/test-xetex-graduate.tex` - graduate XeLaTeX variant.
- `test/test-xetex-graduate-nlcover.tex` - graduate national-library cover.
- `test/test-luatex.tex` - LuaLaTeX variant.
- `test/test.tex` - shared test body.
- `test/chapters/` - test chapter content.
- `test/*.png`, `test/test.bib` - test assets and bibliography.

Scripts:

- `scripts/download.sh` - fetch and verify TeX Live package database.
- `scripts/main.py` - compute and install dependency closure.
- `scripts/file_parser.py` - parse TeX/Lua dependency declarations.
- `scripts/generate-img.*`, `scripts/generate-img.tex` - image generation
  helper assets.

GitHub:

- `.github/workflows/build.yml` - build/test workflow.
- `.github/workflows/release.yml` - tag release workflow.
- `.github/workflows/texlive.profile` - TeX Live install profile.
- `.github/ISSUE_TEMPLATE/` - issue forms.
- `.github/CODE_OF_CONDUCT.md` - code of conduct.

Generated/secondary:

- `build/` - l3build output.
- `mythesis/` - example/generated workspace and compile artifacts.
