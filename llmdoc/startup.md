# Startup

`njuthesis` is a LaTeX document class for Nanjing University bachelor,
master, doctoral, and postdoctoral documents. The project is primarily a
LaTeX3/docstrip codebase, not an application repo.

Read these first for any non-trivial work:

1. `llmdoc/must/source-of-truth.md`
2. `llmdoc/must/repository-rules.md`
3. `llmdoc/must/build-and-test-rules.md`
4. `llmdoc/overview/project-overview.md`

Fast orientation:

- Canonical implementation and manual source: `source/njuthesis.dtx`.
- Build config: `build.lua`, run through `l3build`.
- User sample package inputs: `docs/`.
- Compile tests: `test/`.
- CI and release automation: `.github/workflows/`.
- Generated or secondary outputs: `build/` and most of `mythesis/`.

Default working posture:

- Inspect `source/njuthesis.dtx` before editing generated `.cls` or `.def`
  files.
- Keep layout and interface changes reflected in sample files and tests when
  relevant.
- Prefer focused compile checks over broad assumptions; this project is
  layout-sensitive.
- Keep temporary investigation notes in `.llmdoc-tmp/investigations/`, not in
  stable docs.
