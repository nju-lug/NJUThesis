# Logo Color Mechanism

How NJU emblem/name color selection works after the v1.5.0 bundled-PDF logo
refactor. This document is about color/default selection only; blind-review
behavior is documented in `anonymous-mode-mechanism.md`.

## Source Of Truth

- Implementation: `source/njuthesis.dtx`, section `校名校徽`.
- Generated assets: `source/nju-emblem-black.pdf`,
  `source/nju-emblem-purple.pdf`, `source/nju-name-black.pdf`,
  `source/nju-name-purple.pdf`.
- Build packaging: `build.lua` lists the logo PDFs as source, install, and
  binary files.

## Default Color

The default color is not stored in an `l3keys` key inside the generated `.def`
files. The `.def` file is loaded early in `njuthesis.cls`, before the
`nju / image` keys are defined, so defining or initializing `nju-logo-color`
there would depend on an unavailable key.

Instead, each thesis-type `.def` declares one constant:

```tex
%<def-u|def-p>\tl_const:Nn \c_@@_logo_color_tl { black  }
%<def-g>\tl_const:Nn \c_@@_logo_color_tl { purple }
```

Later, when the class defines `nju-logo-color`, it consumes that constant:

```tex
nju-logo-color .initial:V = \c_@@_logo_color_tl
```

This preserves the historical `.def` loading order while still giving each
thesis type its own default.

## User Keys

`nju-logo-color` is a convenience key under `nju / image`:

```tex
nju-logo-color .choices:nn = { black, purple }
  { \keys_set:nn { nju / image } { nju-emblem = #1, nju-name = #1 } }
```

It only accepts the built-in color names `black` and `purple`.

`nju-emblem` and `nju-name` are separate choice keys generated for the two logo
types:

| Choice | Effect |
|--------|--------|
| `black` | Use `nju-emblem-black.pdf` or `nju-name-black.pdf`. |
| `purple` | Use `nju-emblem-purple.pdf` or `nju-name-purple.pdf`. |
| unknown value | Treat the value as a literal file path. |

Use `nju-logo-color` when both files should use the same built-in color. Use
`nju-emblem` and `nju-name` when a caller needs separate colors or custom files.

## Runtime Flow

```
default constant or user key
  -> choice handler calls \@@_logo_file_update:nn
  -> \l_@@_logo_file_prop stores emblem/name filenames
  -> cover/begin hook copies prop entries into tl variables
  -> element instances call \@@_logo_emblem: or \@@_logo_name:
  -> \includegraphics loads the selected PDF
```

The prop-to-tl split is intentional. The prop is populated by key handlers at
configuration time, while the tl variables are updated in the `cover/begin`
hook immediately before cover rendering. The xtemplate element content then
only has to read token lists.

## Internal Command Family

For each logo type (`emblem`, `name`) the class creates these helpers:

| Variant | Role |
|---------|------|
| `\@@_logo_<type>:Nn` | Base wrapper around `\includegraphics[width=#1]{#2}`. |
| `\@@_logo_<type>:cv` | Variant accepting dimension and file token-list csnames. |
| `\@@_logo_<type>:n` | Selects a width variable by suffix and reads the current file token list. |
| `\@@_logo_<type>:` | Zero-argument form using the default width suffix. |

Width suffixes:

| Suffix | Dimension variable | Typical use |
|--------|--------------------|-------------|
| empty | `l_@@_emblemwd_dim` / `l_@@_namewd_dim` | Standard covers. |
| `i` | `l_@@_emblemwdi_dim` | Undergraduate declaration emblem. |
| `ii` | `l_@@_emblemwdii_dim` | Graduate English cover emblem. |

## Undergraduate Declaration Exception

The undergraduate honesty declaration uses the purple emblem directly:

```tex
\@@_logo_emblem:Nn \l_@@_emblemwdi_dim { nju-emblem-purple.pdf }
```

This page is a fixed declaration form and is not controlled by
`image/nju-logo-color`. Blind-review mode disables declaration pages before this
exception can matter.
