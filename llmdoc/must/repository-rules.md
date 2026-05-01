# Repository Rules

Use the existing LaTeX3/docstrip style.

Project-specific guardrails:

- Do not edit generated class or definition files as the primary fix. Change
  `source/njuthesis.dtx` first.
- Keep public interface changes documented in the dtx manual sections and, when
  relevant, reflected in `docs/njuthesis-sample.tex` or
  `docs/njuthesis-setup.def`.
- Preserve XeLaTeX and LuaLaTeX support unless a task explicitly narrows scope.
- Avoid introducing pdfLaTeX assumptions; the class requires Unicode TeX
  engines.
- Be careful with layout changes. Covers, abstracts, declarations, headers,
  footers, and table of contents formatting are project-critical behavior.
- Keep generated/build directories out of stable reasoning unless the task is
  specifically about packaging or compile output.
- Update `CHANGELOG.md` for user-visible changes when doing normal feature or
  bug work.

Coding conventions:

- Follow the current expl3 naming style and `@@` internal namespace patterns in
  `source/njuthesis.dtx`.
- Keep user-facing keys under the `nju` namespace and module namespaces such as
  `nju / info`, `nju / bib`, `nju / image`, `nju / abstract`, `nju / theorem`,
  and `nju / math`.
- Use existing hooks, `xtemplate` page/element instances, and helper functions
  before adding a new mechanism.

Documentation language conventions:

- Write `CHANGELOG.md`, documented-source prose in `source/njuthesis.dtx`, and
  commit messages in Simplified Chinese unless the surrounding context requires otherwise.
- Write llmdoc knowledge files in English.
