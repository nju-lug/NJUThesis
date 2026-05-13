# Graduate Cover Word Template Spacing

Why the graduate ordinary cover has several small spacing and offset constants
that look arbitrary.

## Context

The graduate Word template uses visually tuned line breaks and spacing rather
than a clean, reusable layout model. The current LaTeX implementation follows
the Word template where the visible result matters, even when the constants do
not form an elegant typographic system.

Treat these values as compatibility adjustments. They are intended to match the
school-provided Word version, not to establish a general cover-layout API.

## Scope

The current source changes are limited to the graduate ordinary cover path in
`source/njuthesis.dtx`:

- `g / cover-front / top`
- `g / cover-front / emblem-img`
- `g / cover-front / type`
- `g / cover-front / info`
- `g / cover-front / date`
- `\@@_g_cover_top:`
- `\@@_g_cover_info:`
- `g / cover-back / info`
- `\@@_g_cover_back:`
- the `cover-g-front` and `cover-g-back` page instances
- graduate cover constants such as rule widths, logo widths, and underline
  depth

Do not generalize these adjustments to undergraduate, postdoctoral, abstract,
or national-library cover layouts without a separate visual comparison.

## Front Cover Changes

The top metadata block was moved and resized to align with the Word cover:

- horizontal offset changed from `-.5 cm` to `-18 pt`
- local line spacing for small top text changed from `1.083` to `0.923`
- bottom skip changed from `20 pt` to `20.5 pt`
- top-field underline width is now fixed at `60 pt`
- the colon separator is placed in a fixed `14.4 pt` box

This removes the old dynamic underline width based on student-id width. The
Word layout appears to use fixed-width fields, so the LaTeX path now follows
that visual behavior.

Nearby front-cover elements were also tuned:

- emblem bottom skip: `.47 cm` to `14.5 pt`
- type/title block bottom skip: `20 pt plus 1 fill` to `0 pt plus 1 fill`
- info block local format: `\@@_zihao:nn { 1.02 } { 3 }`
- info block bottom skip: `23 pt plus 1 fill`
- info block left separator: `.7 cm` to `25 pt`
- date format explicitly set to `\zihao { 4 }`
- date bottom skip: `102 pt`

The `cover-g-front` page instance now leaves the page-level format as
`\kaishu`. Individual elements set the sizes they need locally. This avoids one
page-level `\zihao { 3 }` leaking into elements whose Word-matching size is
different.

## Back Cover Changes

The back-cover info block received small horizontal and vertical offsets:

- page top skip changed from `5.3 cm` to `173 pt`
- info element bottom skip changed from `8.1 cm` to `8.07 cm`
- the whole info vbox is shifted left by `22 pt`
- entries inside the block are shifted right by `11 pt`
- a `-4 pt` vertical skip tightens the reviewer/date transition
- defend date content is printed directly instead of centered in the rule-width
  box

These are visual alignment constants. They should stay local to
`\@@_g_cover_back:` rather than being lifted into the common cover-entry
helpers.

## Constant Changes

Graduate-specific generated `.def` constants were tuned as part of the same
visual pass:

```tex
%<def-g> { c rule wd   } { 7 cm },
%<def-g> { c rule wd i } { 246 pt },
%<def-g> { emblem wd   } { 39.8 pt },
%<def-g> { name wd     } { 109 pt },
%<def-g> { rule dp i   } { -.75 ex },
```

These constants are deliberately narrow. They encode the current Word-template
match and should not be treated as canonical typographic measurements.

## Maintenance Notes

When changing this area, compare the rendered graduate ordinary cover against
the Word-derived target before "cleaning up" the numbers. The implementation is
not messy because the TeX layout needs to be; it is messy because the external
template being matched is not internally systematic.

If a future official template becomes more rigorous, prefer replacing these
local offsets with a simpler layout model at that time.
