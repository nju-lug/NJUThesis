# Cover Hook Option Timing

Why some class-option effects must be resolved before the thesis-type `.def`
file is loaded.

## Background

Before the cover hook refactor, declaration pages were effectively decided when
the cover-generation command executed. Code later in the class could still
change `\g_@@_opt_decl_bool` before rendering, and the old flow would observe
that final value.

After the hook refactor, the generated thesis-type `.def` file registers cover
code into hooks during class loading:

- `cover/body` receives the main cover code.
- `cover/body` may also receive `decl-i` when `decl-page` is true.
- `cover/back` may receive `decl-ii` for the graduate authorization page.

Once code has been added to a hook, later changes to the boolean that decided
the registration do not remove that hook code. Therefore any option that affects
whether cover/declaration hook code is registered must be settled before the
`.def` file is loaded.

## Current Load Order

The important execution order is:

1. Define class-option keys under `nju / option`.
2. Run `\ProcessKeysOptions { nju / option }`.
3. Apply derived class-option normalization that affects early decisions. The
   current example is anonymous mode forcing `decl-page = false`.
4. Declare the semantic cover hooks.
5. Load the thesis-type `.def` file selected by `type`.
6. The `.def` file performs thesis-type setup, including declaration-package
   loading and cover hook registration based on the already-final option
   booleans.
7. Load user config files from the `config` class option.

The documented-source order in `source/njuthesis.dtx` can be misleading because
guarded `.def` code appears near related class code, but it only executes when
the generated `.def` file is input.

## Anonymous Mode And Declaration Pages

Anonymous mode disables declaration pages immediately after class options are
processed:

```tex
\ProcessKeysOptions { nju / option }

\bool_if:NT \g_@@_opt_anon_bool
  { \keys_set:nn { nju / option } { decl-page = false } }
```

This must happen before loading `njuthesis-undergraduate.def`,
`njuthesis-graduate.def`, or `njuthesis-postdoctoral.def`; otherwise those
files may already have registered declaration-page hook code.

## Maintenance Rules

- Keep hook-registration decisions out of late document-generation code unless
  the hook body itself is intentionally meant to branch at render time.
- Class options live under `nju / option`; see
  `memory/decisions/2026-05-12-class-option-namespace.md` for the namespace
  decision.
- If a class option changes whether a hook should be registered, normalize it
  immediately after `\ProcessKeysOptions` and before `.def` loading.
- If a class option internally forwards to other class options, forward within
  `nju / option`. Forwarding to the public `nju` setup namespace will miss
  class-option keys.
- User config files are loaded after the thesis-type `.def` file. They should
  not be used to change class options that have already controlled package
  loading or cover hook registration.
