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
  `\RenewDocumentCommand \njuemblem { o m m } {}`. One redefinition covers all
  call sites.
- `emblem color` / `name color` format defaults removed (dead with njuvisual
  gone).
- `missing-image` message removed (dead code — no fallback trigger remains).

Org lesson:

- The `\clist_map_inline:nn { emblem, name }` loop spans two subsubsections
  (`校名校徽` for command definitions, `用户接口` for key definitions). This
  works because TeX macros don't care about doc structure, but it's fragile for
  readers. The comment "注意这里还在使用前面的 clist_map_inline:nn" is a
  minimum guardrail. If this code is ever revisited, consider unrolling the loop.
