# Anonymous Mode Mechanism

How `anonymous` and `anonymous-mode/no-nju` remove review-sensitive content.

## Class Option

`anonymous` is a class option. During option parsing it sets
`\g_@@_opt_anon_bool`. If the option is active, the class adds the literal group
name `anonymous` to `\g_@@_keys_excl_clist`; `\njusetup` then routes through the
project wrapper around `l3keys` so grouped keys can be filtered.

This keeps later user setup files from reintroducing fields that should remain
hidden in blind review.

## Declaration Pages

Anonymous mode always disables declaration pages:

```tex
\bool_if:NT \g_@@_opt_anon_bool
  { \bool_gset_false:N \g_@@_opt_decl_bool ... }
```

This means the undergraduate declaration page's direct purple emblem is not a
blind-review leak. The page is never registered into the cover body when
anonymous mode has cleared `decl-page`.

## Personal Information

When `anonymous` is active, the class replaces selected author and supervisor
fields with anonymous placeholders:

```tex
author        = \@@_name:n { anonymous a },
author*       = \@@_name:n { anonymous a },
supervisor    = { \@@_name:n { anonymous a }, \@@_name:n { anonymous b } },
supervisor*   = { \@@_name:n { anonymous c } \@@_quad: \@@_name:n { anonymous a } },
supervisor-ii = ,
supervisor-ii* =
```

Other metadata keys are protected through the grouped-key filtering mechanism
described in `memory/decisions/2026-05-02-filtered-key-groups.md`.

## Paper List And Acknowledgement

Anonymous mode redirects output commands rather than asking each call site to
branch manually:

- `\@@_paperlist:nn` becomes `\@@_paperlist_anon:nn`.
- `\@@_acknowledgement:n` becomes `\@@_acknowledgement_anon:n`.
- PDF author metadata is cleared.

This keeps blind-review behavior centralized.

## Hiding School Information

`anonymous-mode/no-nju` is a setup key, not a class option. It only has an
effect when both booleans are true:

```tex
\bool_lazy_and:nnT
  { \g_@@_opt_anon_bool } { \g_@@_opt_nonju_bool }
  { ... }
```

At end preamble, the class clears school names and school code, and suppresses
logo helpers:

```tex
\tl_clear:N  \l_@@_name_nju_tl
\tl_clear:N  \l_@@_name_nju_en_tl
\tl_gclear:N \g_@@_info_code_tl
\cs_gset_eq:NN \@@_logo_emblem:n \use_none:n
\cs_gset_eq:NN \@@_logo_name:n   \use_none:n
```

Redefining the `:n` convenience layer is enough for normal cover logo call
sites, because `\@@_logo_emblem:` and `\@@_logo_name:` both dispatch through
`:n`.

## Maintenance Notes

- Keep anonymous filtering in the `\njusetup` wrapper path. Raw `\keys_set:nn`
  calls bypass the group filter and should only be used where that is intended.
- If a future page uses `\@@_logo_emblem:Nn` directly, check whether that page
  can exist in anonymous mode. The direct base helper is not affected by
  `anonymous-mode/no-nju`; current undergraduate declaration usage is safe
  because anonymous mode disables declaration pages.
