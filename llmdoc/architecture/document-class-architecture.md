# Document Class Architecture

`source/njuthesis.dtx` combines manual prose, implementation, and docstrip
guards. Guarded regions generate the class, thesis-type definition files, and
the documentation class.

Core structure:

- The class is an expl3 class declared as `njuthesis`.
- It loads `ctexbook` as the base class.
- It defines class options and user settings through `l3keys`.
- It uses `xtemplate` for reusable page and element instances, especially cover
  and abstract pages.
- It uses LaTeX hooks for cover generation in recent unreleased code:
  `cover/begin`, `cover/body`, `cover/end`, and `cover/back`.
- Back-cover authorization material is registered under `cover/back`; `\maketitle`
  schedules that semantic hook on `enddocument` with `\hook_use_once:n`, so the
  authorization page is not generated unless the title-page flow is used.

Generated targets:

- `njuthesis.cls` - main document class.
- `njuthesis-undergraduate.def` - undergraduate-specific page/text constants.
- `njuthesis-graduate.def` - graduate-specific page/text constants.
- `njuthesis-postdoctoral.def` - postdoctoral-specific page/text constants.
- `njuthesis-doc.cls` - documentation class for the manual.

Configuration flow:

1. Class options are parsed under the `nju` key namespace.
2. Optional packages are enabled or disabled, with `minimal` disabling feature
   packages and math font loading.
3. `\njusetup` applies preamble configuration under modules such as `info`,
   `bib`, `image`, `abstract`, `theorem`, `math`, `header`, and `footer`.
4. Late setup hooks load bibliography options/resources, configure PDF metadata,
   resolve images, and prepare page styles.
5. User commands/environments generate covers, abstracts, special pages,
   theorem environments, paper lists, and notation pages.

Layout-sensitive subsystems:

- Cover pages for undergraduate, graduate, postdoctoral, and national-library
  variants.
- Declaration and authorization pages.
- Abstract pages and keyword lists.
- Page geometry, headers, footers, front matter, and main matter transitions.
- TOC/list-of-figures/list-of-tables formatting.
- Bibliography loading and heading behavior.
- Font selection for Latin, CJK, and math fonts.
