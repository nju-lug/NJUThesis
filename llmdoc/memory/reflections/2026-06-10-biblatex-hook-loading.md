# 2026-06-10 biblatex hook 载入重构反思

## 背景

本次重构将参考文献宏包的处理从 `BeforeBeginEnvironment{document}` 中手动执行
`pre -> \RequirePackage{biblatex} -> post`，改为基于 LaTeX 内核 hook：

- `package / biblatex / before`：载入前释放临时 `\addbibresource`，并传入加载期样式选项。
- `package / biblatex / after`：载入后执行普通 `biblatex` 选项、设置默认 bibliography heading、导入资源文件。
- `env / document / before`：用户没有手动载入 `biblatex` 时的后备自动载入。

目标是允许用户在导言区自行 `\usepackage{biblatex}`，仍能接收模板通过 `\njusetup[bib]` 收集的设置，同时给用户在宏包载入后添加自定义补丁留出清晰时序。

## 关键结论

- `package/<name>/before` 与 `package/<name>/after` 是适合这个场景的 one-time package hooks；如果宏包已经载入，向 `package/<name>/after` 添加代码会立即执行。
- `env/document/before` 可以替代 `etoolbox` 的 `\BeforeBeginEnvironment{document}` 作为后备载入点，保持 hook 机制一致。
- `biblatex` 默认后端是 `biber`，模板不必再显式追加 `backend=biber`。
- `bib/style` 属于加载期样式选择，单独收集为 `\g_@@_blx_style_clist` 并在 `pre` 阶段传给 `\PassOptionsToPackage`。
- `bib/option` 通过 `\ExecuteBibliographyOptions` 在 `post` 阶段执行；不要在用户手册常规选项说明中过早暴露实现细节。
- `bib/resource` 是 clist 接口，而 `\addbibresource` 只接受单个文件名；post 阶段必须用 `\clist_map_inline:Nn` 逐项调用真实 `\addbibresource`。
- `biblatex=false` 仍应表示完全退出 njuthesis 的 biblatex 集成，与 `unicode-math=false` 的特性开关语义一致。

## 测试经验

新增 `test/config-biblatex.lua` 作为带 Biber 的 l3build 配置：

- `testfiledir = "test/biblatex"`。
- `supportdir = testfiledir`，确保 `.bib` 被复制到运行目录。
- `test_types.log.test = ".tex"`，因为 l3build 在读额外 config 前已按默认 `.lvt` 初始化测试类型，仅设置 `lvtext = ".tex"` 不够。
- `checkruns = 3`，并在第一轮 LaTeX 后运行 `biber`。

回归测试应完整编译并 `\printbibliography`，再用 `l3build save -c test/config-biblatex <name>` 生成 `.tlg`，而不是只断言内部开关。测试文件中的 cite 命令参数不能写成 `\cite { key }`，否则 `biblatex` 会把尾随空格视为 citekey 的一部分，导致 `.tlg` 中出现错误的 undefined citation 警告。

## 失误与修正

- 曾过度设计运行时 helper，让 `bib/option` 和 `bib/resource` 在 `biblatex` 已加载后仍动态挂 hook。用户指出该复杂度不必要，最终收回到“先 `\njusetup[bib]`，再手动 `\usepackage{biblatex}`，然后写补丁”的清晰边界。
- 曾建议把样式选项直接交给 `\PassOptionsToPackage`，但在当前实现中使用 `\g_@@_blx_style_clist` 更符合用户简化后的代码结构；关键是不要再引入更宽泛的 load-option 抽象。
- 曾生成含 undefined citation warning 的 `.tlg`。根因不是 Biber 轮次，而是 `\cite { key }` 的空格写法。

## 可推广规则

- 修改宏包载入时序时，优先用语义层 hooks（如 `package/<pkg>/before|after`）而不是底层 file hooks。
- 参考文献输出行为应尽量用完整 `.tex + .bib + biber + \printbibliography` 回归测试覆盖。
- 用户手册常规选项说明应保持面向用户需求；实现细节放在“定制补丁”等高级小节中。
