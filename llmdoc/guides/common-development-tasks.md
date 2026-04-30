# Common Development Tasks

Before editing:

1. Read `llmdoc/startup.md`.
2. Confirm whether the target is source, sample, test, packaging, or generated
   output.
3. Prefer `source/njuthesis.dtx` for class behavior changes.

Edit class behavior:

1. Locate the relevant manual and implementation section in
   `source/njuthesis.dtx`.
2. Update both user-facing documentation and implementation when changing a
   public option, command, or environment.
3. Regenerate/install with `l3build install` before compiling tests.
4. Compile the closest `test/test-*.tex` variant.

Edit public samples:

1. Update `docs/njuthesis-sample.tex` for document structure examples.
2. Update `docs/njuthesis-setup.def` for `\njusetup` configuration examples.
3. Keep sample comments aligned with current supported options and README
   guidance.

Investigate build failures:

1. Check whether failure happens during TeX Live setup, `l3build install`,
   dependency installation, or test compilation.
2. If package dependencies changed, inspect `scripts/file_parser.py`,
   `scripts/main.py`, and workflow `PACKAGES` seeds.
3. If generated files are stale, regenerate from the dtx rather than editing
   generated output.

Release/package changes:

1. Read `.github/workflows/release.yml`.
2. Confirm `l3build ctan` still produces the expected CTAN zip and manual.
3. Confirm the user zip still includes sample files, generated class/def files,
   visual assets, `LICENSE`, `CHANGELOG.md`, and `README.md`.
