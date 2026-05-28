# Reflection: National Library Cover Title Line-Breaking Fix

Task context:

- Fix [#314]: National library cover title had incorrect line-breaking,
  causing the title to overflow or break at wrong positions.
- Root cause: `\@@_cover_title_nl:` used a raw `\vbox:n` with manually set
  `\tex_hsize:D` to constrain the title width, but did not call
  `\@parboxrestore` to reset paragraph parameters.
- The shared helper `\@@_box_paragraph:nn` (introduced in v1.5.0 at line 3289)
  already handled this correctly by wrapping `\vbox_top:n` with
  `\@parboxrestore` and `\tex_prevdepth:D` preservation. The generic cover
  entry title code (`\@@_cover_entry_title:NNNN` at line 3616) already used it,
  but `\@@_cover_title_nl:` was an older code path that had not been updated.

What changed:

- `\@@_cover_title_nl:` now calls `\@@_box_paragraph:nn { 15 em }
  { \l_@@_fmt_covertitle_tl \@@_print_ulined_title: }` — matching the pattern
  used by `\@@_cover_entry_title:NNNN`.
- The old `\mode_leave_vertical:` + raw `\vbox:n` block is removed.
- The format token list `\l_@@_fmt_covertitle_tl` is now correctly included in
  the title content, which the old code also omitted.

Lesson:

- When a shared helper replaces raw TeX primitives, audit all existing call
  sites for the same pattern. The NL cover title was an orphaned call site
  that predated the helper and went unnoticed because it was in a different
  cover variant (`cover-nl`) rather than the generic cover path.
