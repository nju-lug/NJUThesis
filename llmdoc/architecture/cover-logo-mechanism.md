# Cover Logo Mechanism

How the NJU emblem and name images reach cover, declaration, and authorization
pages. As of v1.5.0, logos are bundled PDF files; `njuvisual` procedural drawing
is no longer used as a fallback.

## Data Flow

```
User keys (nju / image)
  ↓  choice handlers call \@@_logo_file_update:nn
\l_@@_logo_file_prop  (prop: emblem → filename, name → filename)
  ↓  cover / begin hook copies to tl vars via \prop_map_inline:Nn
\l_@@_logo_file_emblem_tl, \l_@@_logo_file_name_tl
  ↓  element instances call \@@_logo_emblem: / \@@_logo_name:
\includegraphics[width=<dim>]{<filename>}
```

The split between prop and tl vars exists because the prop is populated by
key handlers at `\njusetup` time (preamble), while the tl vars are set at
cover-begin time just before rendering. This avoids needing the prop itself to
be expandable inside the xtemplate element `content` key.

## Key Interface

### `nju-emblem`, `nju-name` (`nju / image`)

Choice keys generated inside `\clist_map_inline:nn { emblem, name }`:

| Choice | File |
|--------|------|
| `black` | `nju-emblem-black.pdf` / `nju-name-black.pdf` |
| `purple` | `nju-emblem-purple.pdf` / `nju-name-purple.pdf` |
| `unknown` (any other value) | Used as a literal file path |

### `nju-logo-color` (`nju / image`)

Convenience key using `.choices:nn { black, purple }`. Sets both
`nju-emblem` and `nju-name` to the same value via `\keys_set:nn`.
Initial value is `purple`; the `.initial:n` fires the choice handler at
key-definition time, populating `\l_@@_logo_file_prop` with default entries.

## Internal Command Family

Four layers per logo type, generated inside the same `\clist_map_inline`:

| Variant | Arg | Purpose |
|---------|-----|---------|
| `\@@_logo_<type>:Nn` | dim, file (implicit) | Base: `\includegraphics[width=#1]{#2}` |
| `\@@_logo_<type>:cv` | {dim_csname} {file_tl_csname} | Generated variant via `\cs_generate_variant:cn` |
| `\@@_logo_<type>:n` | {suffix} | Builds dim csname `l_@@_<type>wd<suffix>_dim`, reads `\l_@@_logo_file_<type>_tl`, calls `:cv` |
| `\@@_logo_<type>:` | — | Zero-arg: calls `:n {}` — uses default `l_@@_<type>wd_dim` |

Suffix → dimension variable mapping:

| Suffix | Dim variable | Used by |
|--------|-------------|---------|
| `{}` (default) | `l_@@_emblemwd_dim` / `l_@@_namewd_dim` | Standard covers |
| `{i}` | `l_@@_emblemwdi_dim` | Declaration page emblem |
| `{ii}` | `l_@@_emblemwdii_dim` | Graduate English cover emblem |

## Build Integration (`build.lua`)

```lua
njulogofiles = {
    "nju-emblem-black.pdf", "nju-emblem-purple.pdf",
    "nju-name-black.pdf",   "nju-name-purple.pdf",
}
sourcefiles  = {"*.dtx", table.unpack(njulogofiles)}
installfiles = {"*.cls", "*.def", table.unpack(njulogofiles)}
binaryfiles  = {table.unpack(njulogofiles)}
```

Logo PDFs live in `source/` alongside the dtx. They are declared as
`binaryfiles` so `l3build ctan` does not treat them as text.

## Blind Review Handling

When both `anonymous` and `no-nju` are active:

```latex
\cs_gset_eq:NN \@@_logo_emblem:n \use_none:n
\cs_gset_eq:NN \@@_logo_name:n   \use_none:n
```

Redefining `:n` (the convenience entry point) covers all call sites through
one change. This replaced the old approach of individually redefining
`\njuemblem` / `\njuname` (user-level commands that no longer exist).

## Removed: njuvisual Fallback

Before v1.5.0, the class checked at `\ctex_at_end_preamble:n` whether
`\njuemblem` / `\njuname` were defined. If either was missing, both were
undefined and `njuvisual` was loaded with a `missing-image` warning.
Removed items:

- `\@@_emblem:N`, `\@@_name:N` wrapper commands.
- `\ctex_at_end_preamble:n` fallback logic.
- `missing-image` message definition.
- `emblem color` / `name color` format defaults (only used by njuvisual).
