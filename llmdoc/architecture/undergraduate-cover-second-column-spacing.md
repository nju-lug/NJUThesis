# Undergraduate Cover Second-Column Spacing

Why the undergraduate cover info block has separate label widths for the first
and second columns.

## Context

The undergraduate Word template does not use equal label widths for the two
short fields on the same row. The LaTeX cover previously used one shared label
width, which made the second-column entries visually drift from the Word
template.

The current implementation keeps the visual adjustment in the undergraduate
cover path only. It is not a general cover-entry API change for graduate or
postdoctoral covers.

## Width Constants

The generated undergraduate `.def` now has two label widths:

```tex
%<def-u> { c label wd   } { 64 bp },
%<def-u> { c label wd i } { 40 bp },
```

They become:

- `\l_@@_clabelwd_dim` for the first-column label width.
- `\l_@@_clabelwdi_dim` for the second-column label width.

Graduate already has additional label widths for its own cover/back-cover
layout, so the naming follows the existing suffix pattern.

## Entry Helpers

Single-field rows still use the generic cover entry helper:

```tex
\@@_cover_entry:NNNn #1 #3 #5 { dept }
```

Two-field undergraduate rows now call helpers that accept both label widths:

```tex
\@@_cover_entry:NNNNnn #1 #2 \l_@@_tmpb_dim #5 { grade } { id }
\@@_cover_entry_supv:NNNNn #1 #2 \l_@@_tmpb_dim #5 { supv }
```

The signatures are:

- `\@@_cover_entry:NNNNnn <label-a> <label-b> <content> <format> <left> <right>`
- `\@@_cover_entry_supv:NNNNn <label-a> <label-b> <content> <format> <field>`

The first label width is used for the left label. The second label width is
used for the right label (`id` and `supvtitle`).

## Short Content Width

The short underline width is computed from the long underline width, the
second-column label width, and the horizontal separator:

```tex
\dim_set:Nn \l_@@_tmpb_dim { #3 * 1/2 - #2 * 1/2 - #4 }
```

This deliberately uses the second-column label width. The formula keeps the
right-hand pair aligned to the Word layout while preserving the shared content
width for both short fields in the row.

## Block Offset

The undergraduate cover info block also applies a small left shift:

```tex
\mode_leave_vertical:
\skip_horizontal:n { -16 pt }
\vbox_center:n { ... }
```

The `\vbox_center:n` wrapper keeps the shifted multi-line block as one vertical
object after the horizontal offset. This adjustment belongs to the undergraduate
cover info element and should not be lifted into common cover-entry helpers.

## Related Spacing Constants

The same visual alignment pass also tuned undergraduate-specific nearby values:

- `u / cover / name-img` bottom skip: `31.5 pt`.
- `u / cover / title` bottom skip: `4 pt plus 1 fill`.
- undergraduate `rule ht i`: `.7 pt`.
- undergraduate `rule dp i`: `-.6 ex`.

These values are format-matching constants. Do not generalize them to graduate
or postdoctoral cover layouts without a separate visual comparison.
