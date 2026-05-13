# llmdoc Index

This is the llmdoc map for the `njuthesis` repository.

Start here:

- [Startup](startup.md) - fast orientation for future agents.

MUST read:

- [Source of Truth](must/source-of-truth.md) - which files are canonical and
  which are generated or secondary.
- [Repository Rules](must/repository-rules.md) - contribution constraints and
  project-specific guardrails.
- [Build and Test Rules](must/build-and-test-rules.md) - expected build,
  compile, and CI behavior.

Overview:

- [Project Overview](overview/project-overview.md) - what the project is and
  how the main directories fit together.

Architecture:

- [Document Class Architecture](architecture/document-class-architecture.md) -
  how `njuthesis.dtx` is structured and how the class is configured.
- [Logo Color Mechanism](architecture/cover-logo-mechanism.md) - how bundled
  logo color defaults and user keys select emblem/name PDFs.
- [Anonymous Mode Mechanism](architecture/anonymous-mode-mechanism.md) - how
  blind-review mode filters metadata, disables declaration pages, and hides
  school information.
- [Cover Hook Option Timing](architecture/cover-hook-option-timing.md) - why
  declaration-related class options must be normalized before thesis-type
  `.def` files register hook code.
- [Undergraduate Cover Second-Column Spacing](architecture/undergraduate-cover-second-column-spacing.md) -
  why the undergraduate cover uses separate label widths and local offsets.
- [Graduate Cover Word Template Spacing](architecture/graduate-cover-word-template-spacing.md) -
  why the graduate ordinary cover has local Word-template spacing constants.
- [Build and Release Architecture](architecture/build-release-architecture.md) -
  how l3build, tests, CI, and release packages connect.

Guides:

- [Common Development Tasks](guides/common-development-tasks.md) - practical
  workflows for editing, unpacking, compiling, and testing.

Reference:

- [File Map](reference/file-map.md) - source tree reference.
- [User Interface Reference](reference/user-interface.md) - class options,
  `\njusetup` modules, and major user commands.

Memory:

- `memory/reflections/` - working reflections and update notes.
  - [Cover Logo Refactor (2026-05-12)](memory/reflections/2026-05-12-cover-logo-refactor.md)
  - [\njusetup l3keys Refactor (2026-05-01)](memory/reflections/2026-05-01-njusetup-l3keys-refactor.md)
- `memory/decisions/` - durable decisions that should not be buried in guides.
  - [Class Options Under `nju / option`](memory/decisions/2026-05-12-class-option-namespace.md)
  - [Filtered Key Groups for `\njusetup`](memory/decisions/2026-05-02-filtered-key-groups.md)

Scratch investigations are kept outside stable llmdoc at `.llmdoc-tmp/`.
