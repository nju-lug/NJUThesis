# Reflection: Cover Logo Mechanism Refactor

Task context:

- Replace `njuvisual`-based procedural logo drawing with bundled PDF assets.
- Redesign `image/nju-emblem` and `image/nju-name` from free-form file paths to
  `.choice:` keys with `black`, `purple`, and custom (`unknown`) branches.
- Add `nju-logo-color` convenience key for setting both colors at once.
- Wire internal logo command generation through the `cover / begin` hook instead
  of `\ctex_at_end_preamble:n`.
- Move logo PDF files from `docs/` to `source/` and declare them as `binaryfiles`
  in `build.lua`.

What changed:

- `\@@_emblem:N` / `\@@_name:N` wrappers (which delegated to user-level
  `\njuemblem` / `\njuname`) removed. Replaced by a four-layer internal command
  family: `:Nn` (base — `\includegraphics`), `:cv` (csname→value variant), `:n`
  (suffix→dim convenience), `:` (zero-arg shorthand for default suffix).
- `\@@_new_img_cmd:nn` (user-level `\NewDocumentCommand` per logo) replaced by
  `\@@_logo_file_update:nn` (populates a prop list) and
  `\@@_new_logo_cs:nn`-style internal commands generated at class-load time.
- Blind-review clearing: `\cs_gset_eq:NN \@@_logo_emblem:n \use_none:n` replaces
  `\RenewDocumentCommand \njuemblem { o m m } {}` for normal cover call sites.
  Direct base-helper calls such as the fixed undergraduate declaration emblem
  must be checked separately; anonymous mode disables declaration pages.
- `emblem color` / `name color` format defaults removed (dead with njuvisual
  gone).
- `missing-image` message removed (dead code — no fallback trigger remains).

Org lesson:

- Keep the command-generation and key-definition loops visually separate. The
  current code closes the command loop before the user-interface subsection and
  opens a new loop for the keys, which is easier to read than relying on one
  long loop across doc sections.
