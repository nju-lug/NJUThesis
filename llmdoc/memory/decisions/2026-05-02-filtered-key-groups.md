# Decision: Filtered Key Groups for `\njusetup`

Context:

- `\njusetup` should remain a stable interface even when a feature package is
  disabled by class option.
- `anonymous` mode already needs grouped-key filtering.
- `unicode-math = false` should mean njuthesis does not perform math
  configuration, but `nju / math` keys should still exist so default setup files
  continue to parse.

Decision:

- Keep feature-dependent keys defined.
- Assign l3keys groups to keys that should be ignored under a mode or feature
  switch.
- Maintain one global clist of group names that `\@@_keys_set:nn` should
  exclude. The current variable name is `\g_@@_keys_excl_clist`.
- Build that clist once after class options are processed, then define
  `\@@_keys_set:nn` once:
  - if the clist is empty, alias `\@@_keys_set:nn` to `\keys_set:nn`;
  - if the clist is non-empty, define `\@@_keys_set:nn` to call
    `\@@_keys_set_exclude_groups:nnn` with the stored clist.

Rationale:

- Per-call boolean checks in `\@@_keys_set:nn` are unnecessary because the
  relevant class options are fixed before the user setup interface is defined.
- A single clist scales better than separate nested conditionals as more
  filtered groups are added.
- Keeping the keys defined preserves setup-file compatibility while disabling
  feature-specific behavior.

Implementation notes:

- Declare `\g_@@_keys_excl_clist` with the other early variables, but populate
  it near `\@@_keys_set:nn` so the filtering behavior is easy to read in one
  place.
- Add group names with direct option-state checks:
  `\bool_if:NT \g_@@_opt_anon_bool { \clist_gput_right:Nn ... { anonymous } }`.
- For `unicode-math = false`, add a group such as `unicode-math`.
- Mark affected math keys with `.groups:n = { unicode-math }`.
- Avoid changing the clist after `\@@_keys_set:nn` has been defined. If a future
  feature needs runtime switching, this decision should be revisited.
- Regression tests for math option effects should assert observable TeX-level
  behavior after `\begin{document}`, because math font loading and delayed
  command rewrites run at the begin-document hook.
- The current math option regression checks the `unicode-math = false` absence
  case by recording actual symbol command meanings and the active math font
  families. A full matrix over all supported math fonts should be a separate
  dedicated font test.
