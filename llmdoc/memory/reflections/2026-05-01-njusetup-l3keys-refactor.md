# Reflection: `\njusetup` l3keys Refactor

Task context:

- Replace deprecated `\keys_set_filter:nnn` usage with
  `\keys_set_exclude_groups:nnn`, while keeping a fallback for older kernels.
- Simplify `\njusetup` optional-argument handling so both module names and full
  nested key paths are passed as top-level `nju` assignments.
- Track this as related to GitHub issue `nju-lug/NJUThesis#281`.

Important lesson:

- Normalizing `\njusetup[info]{...}` to `\keys_set:nn { nju } { info = {...} }`
  is only safe if the top-level `info` module key forwards through the same
  anonymous-aware setter. The l3keys `.meta:nn` helper expands through an
  internal setter and would not reapply group filtering to nested keys.
- The group-list argument to `\keys_set_exclude_groups:nnn` should receive a
  literal group list. Passing a conditional expression as that argument does not
  produce the intended `anonymous` group name for l3keys filtering; branch before
  the call instead.
- Current style preference: do not put option-state logic inside the
  `\@@_keys_set:nn` command body. Define `\@@_keys_set:nn` once from the
  anonymous option state: anonymous mode uses
  `\keys_set_exclude_groups:nnn` with the literal `anonymous` group, and normal
  mode aliases `\keys_set:nn`.

Promotion:

- `llmdoc/guides/common-development-tasks.md` now calls this out for future
  `\njusetup` or module-key edits.
- `llmdoc/reference/user-interface.md` now documents the normalized
  optional-argument model.
- `llmdoc/must/build-and-test-rules.md` now records that log-checkable class
  behavior should use focused l3build `.lvt`/`.tlg` regression tests under
  `test/`.
- `llmdoc/architecture/build-release-architecture.md` now records that CI runs
  `l3build check -e xetex` before document compile fixtures.
- `llmdoc/must/repository-rules.md` now records the language convention:
  changelog, documented dtx prose, and commit messages use Chinese; llmdoc uses
  English.
