# 文档类架构

`source/njuthesis.dtx` 是唯一的规范源文件，包含手册正文、实现代码和 docstrip guard。Guarded 区段生成文档类（`.cls`）、论文类型定义文件（`.def`）和手册文档类（`.cls`）。

## 类声明与基类

- 类名为 `njuthesis`，使用 expl3 语法声明。
- 基类为 `ctexbook`，提供中文排版基础。
- 要求 Unicode TeX 引擎（XeTeX 或 LuaTeX）。

## 选项与配置系统

- 类选项通过 `l3keys` 定义在 `nju / option` 子路径下，并统一标记 `.usage:n = load` 以记录 load-only usage 元数据；类选项吸收后，通过 `\l_keys_usage_load_prop` 批量 undefine 用户层 `nju` 路径下的 load-only key，避免 `\njusetup` 误设类选项（参见 `memory/decisions/2026-05-12-class-option-namespace.md`）。
- 用户层设置通过 `\njusetup` 命令，模块子路径如 `nju / info`、`nju / bib`、`nju / image`、`nju / abstract`、`nju / theorem`、`nju / math`。
- 盲审模式下通过 `\g_@@_keys_excl_clist` 过滤敏感键值组（参见 `memory/decisions/2026-05-02-filtered-key-groups.md` 和 `anonymous-mode-mechanism.md`）。
- 新 l3kernel 接口有兼容包装以支持旧 TeX Live（参见 `memory/decisions/2026-05-15-l3kernel-compatibility-wrappers.md`）。

## 页面与元素系统

- 使用 `xtemplate` 定义可复用的页面和元素实例，特别是封面和摘要页。
- 使用 LaTeX hooks 生成封面：`cover/begin`、`cover/body`、`cover/end`、`cover/back`。
- 校徽 logo 通过 prop→tl→`\includegraphics` 流水线在 `cover/begin` hook 中注入（参见 `cover-logo-mechanism.md`）。
- 背面授权材料注册在 `cover/back` 下。`\maketitle` 通过 `\hook_use_once:n` 将该 hook 调度到 `enddocument`，确保只有走封面流程时才生成授权页。目前这个钩子下没有任何内容。

## 配置流时序

1. 类选项在 `nju / option` 键值命名空间下解析。所有选项键标记 `.usage:n = load`；随后从 `\l_keys_usage_load_prop` 读取 load-only key 列表，批量 undefine 用户层 `nju` 路径下对应的 `option / ...` key，阻止 `\njusetup` 误设类选项。
2. 可选宏包启用或禁用（`minimal` 禁用特性包和数学字体加载）。
3. 影响早期 hook 注册的类选项副作用在论文类型 `.def` 文件加载前归一化（参见 `cover-hook-option-timing.md`）。
4. 选定的论文类型 `.def` 文件使用已归一化的类选项布尔值注册封面/声明 hook 代码。
5. `\njusetup` 在导言区应用 `info`、`bib`、`image`、`abstract`、`theorem`、`math`、`header`、`footer` 等模块的配置。
6. 延迟设置 hooks 加载参考文献选项/资源、配置 PDF 元数据、在 `cover/begin` 期间将 logo 文件名从 prop 复制到 tl 变量、准备页面样式。
7. 用户命令/环境生成封面、摘要、特殊页面、定理环境、论文列表和符号页。

## 生成目标

| 文件 | 用途 |
|------|------|
| `njuthesis.cls` | 主文档类 |
| `njuthesis-undergraduate.def` | 本科特定页面/文本常量 |
| `njuthesis-graduate.def` | 研究生特定页面/文本常量 |
| `njuthesis-postdoctoral.def` | 博士后特定页面/文本常量 |
| `njuthesis-doc.cls` | 手册文档类 |

## 版式敏感子系统

- 本科、研究生、博士后、国家图书馆四种封面变体。
- 本科封面信息块有局部第二列间距调整（参见 `undergraduate-cover-second-column-spacing.md`）。
- 研究生普通封面有 Word 模板视觉匹配常量（参见 `graduate-cover-word-template-spacing.md`）。
- 声明页：本科生诚信承诺书、研究生原创性声明（出版授权书已于 v1.5.1 移除）、博士后原创性声明与研究使用授权书。
- 摘要页与关键词列表。
- 页面几何、页眉页脚、front matter 与 main matter 过渡。
- 目录/图目录/表目录格式。
- 参考文献加载与标题行为。
- 拉丁、CJK、数学字体选择。
