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
- `memory/decisions/` - durable decisions that should not be buried in guides.
  - [Filtered Key Groups for `\njusetup`](memory/decisions/2026-05-02-filtered-key-groups.md)

Scratch investigations are kept outside stable llmdoc at `.llmdoc-tmp/`.
