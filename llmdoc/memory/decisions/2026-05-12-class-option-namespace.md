# Decision: Class Options Live Under `nju / option`

Context:

- `\njusetup` uses the public top-level `nju` namespace for user configuration
  modules such as `info`, `image`, `bib`, `math`, and `anonymous-mode`.
- Document-class options are processed earlier than normal user setup and can
  affect package loading, selected thesis-type `.def` files, and cover hook
  registration.
- The cover hook refactor made some option-derived decisions, especially
  `anonymous` forcing `decl-page = false`, order-sensitive before `.def`
  loading.

Decision:

- Define document-class option keys under the internal namespace `nju / option`.
- Process class options with:

```tex
\ProcessKeysOptions { nju / option }
```

- Keep the public `nju` namespace for `\njusetup` module forwarding and user
  setup keys.

Rationale:

- Separating class options from setup modules avoids collisions between names
  like class option `type` and module keys such as `theorem/type`.
- It makes the class-option phase explicit: options are parsed, derived effects
  are normalized, then the thesis-type `.def` file is loaded.
- It prevents later `\njusetup`-style filtering or module forwarding from being
  confused with package-loading and hook-registration decisions that must happen
  during class loading.

Implementation notes:

- Internal class-option forwarding must stay inside `nju / option`. For
  example, `minimal` and `fontset` should call `\keys_set:nn { nju / option }`
  when forwarding to other class options.
- Do not use `\@@_keys_set:nn` for class-option normalization. That helper is
  for the public `\njusetup` path and may filter grouped setup keys.
- If a class option determines whether hook code is registered, normalize it
  immediately after `\ProcessKeysOptions { nju / option }` and before loading
  the generated thesis-type `.def` file.
- User config files named by the `config` class option load after the selected
  `.def` file. They should not be relied on to change class-option decisions
  that have already controlled package loading or cover hook registration.
