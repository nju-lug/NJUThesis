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

Edit `\njusetup` or module keys:

1. Keep `source/njuthesis.dtx` as the source of truth.
2. Preserve anonymous-mode key filtering when changing module forwarding. Module
   keys under top-level `nju` should route nested values through the internal
   filtered setter, not directly through raw l3keys meta expansion.
3. Prefer defining the internal setter according to class option state once.
   Build the excluded-group clist after option processing, then alias
   `\@@_keys_set:nn` to `\keys_set:nn` when the clist is empty, or define it to
   call `\keys_set_exclude_groups:nnn` when groups need screening. Avoid putting
   option-condition logic inside the setter body unless a later behavior change
   requires runtime switching.
4. Exercise both compact module syntax, such as `\njusetup[info]{...}`, and
   full-path syntax, such as `\njusetup[abstract/title-style]{...}`.

Edit feature-dependent setup keys:

1. Keep user-facing keys defined when disabling an optional feature package if
   existing setup files may contain those keys.
2. Assign l3keys groups to keys that should become inert under a class option.
   For example, math keys that require njuthesis-managed `unicode-math`
   configuration should belong to a `unicode-math` group and be filtered when
   `unicode-math = false`.
3. Add the group name to the global excluded-group clist during option-state
   initialization, not during every `\njusetup` call.
4. For math option behavior, assert observable TeX-level behavior after
   `\begin{document}` because font loading and math command rewrites are delayed
   to the begin-document hook. Prefer checking symbol command meanings and
   active math font families over only checking internal option booleans. Keep
   broad font-family coverage in a separate font-focused regression test.

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
