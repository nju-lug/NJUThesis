# Build and Release Architecture

The build and release flow is centered on `l3build`.

Local build model:

- `build.lua` sets `module = "njuthesis"`.
- Source files live in `source/`.
- The source file is `njuthesis.dtx`.
- Install files are generated `.cls` and `.def` files.
- Typesetting the manual uses XeLaTeX.
- Unpacking uses XeTeX.
- Check engines are XeTeX and LuaTeX.

CI build model:

- Build CI runs for pushes and PRs to `master`.
- It installs TeX Live from a CTAN mirror.
- It installs `xetex` and `l3build`, then runs `l3build install`.
- It computes and installs dependency closure through `scripts/download.sh` and
  `scripts/main.py`.
- It compiles undergraduate, graduate, and national-library cover test files in
  `test/`.
- It uploads generated class and definition files from `build/unpacked/`.

Release model:

- Release CI runs on `v*` tags.
- It installs extra fonts and a current `ctex` from source.
- It runs `l3build ctan` for the CTAN zip and manual PDF.
- It moves `docs/` and `build/unpacked/` contents into the release staging area
  to create a user zip.

Dependency analysis:

- `scripts/file_parser.py` extracts class, package, font, and Lua module
  dependencies from TeX/Lua files.
- `scripts/main.py` maps files to TeX Live packages using downloaded tlpdb data
  and a recursive dependency JSON.
- CI passes additional package seeds for known requirements.
