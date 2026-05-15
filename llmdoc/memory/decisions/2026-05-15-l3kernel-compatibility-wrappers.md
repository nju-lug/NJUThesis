# Decision: Wrap New l3kernel Interfaces for Release Compatibility

Context:

- `njuthesis` v1.5.0 is intended to remain usable on TeX Live versions before
  TeX Live 2026 when the project does not otherwise require a newer kernel.
- Some l3kernel interfaces used during v1.5.0 work are newer than the minimum
  supported expl3 date checked by `source/njuthesis.dtx`.
- `\box_underline:Nnn` was introduced before the current minimum in some
  distributions, so `source/njuthesis.dtx` already uses an internal wrapper
  `\@@_box_underline:Nnn`.
- `\vbox_center:n` was added to `l3box` on 2026-02-17. Direct use breaks on
  pre-TeX Live 2026 installations even though the rest of the class can compile.

Decision:

- Do not call newly introduced l3kernel interfaces directly unless the required
  expl3 date is also raised deliberately.
- Add local internal wrappers for such interfaces near the shared helper code in
  `source/njuthesis.dtx`.
- Prefer the native interface when it exists, using `\cs_if_exist:NTF`.
- Provide a narrowly scoped fallback implementation only for the exact behavior
  needed by the class.

Rationale:

- This keeps the public release usable across the intended TeX Live range.
- It avoids raising the global expl3 requirement for one small helper.
- It makes compatibility code discoverable beside existing wrappers such as
  `\@@_box_underline:Nnn`.
- It keeps thesis-type `.def` files free from direct dependency on kernel
  features newer than the main class compatibility layer.

Implementation notes:

- The `\vbox_center:n` compatibility wrapper should be named
  `\@@_vbox_center:n`.
- Direct cover code should call `\@@_vbox_center:n`, not `\vbox_center:n`.
- The fallback should mirror the l3kernel behavior: set the content in a
  temporary vertical box, compute `height + depth`, split that total extent in
  half using the TeX odd-sp rounding rule, then set the remaining extent as
  depth.
- When adding another compatibility wrapper, record the upstream interface date
  in a `\changes` entry and note why the global expl3 requirement is not being
  raised.
