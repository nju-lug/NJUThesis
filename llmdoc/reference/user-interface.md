# 用户界面参考

## 文档类

```tex
\documentclass{njuthesis}
```

支持的引擎：XeLaTeX、LuaLaTeX。

## 常用类选项

- `type = bachelor|master|doctor|postdoc`
- `degree = academic|professional`
- `nl-cover` — 生成国家图书馆封面
- `decl-page` — 生成声明页
- `draft` — 草稿模式
- `anonymous` — 盲审模式
- `minimal` — 最小模式，禁用特性包和数学字体加载
- `oneside`、`twoside` — 单/双面模式
- `latin-font = fandol|gyre|mac|macoffice|win|none`
- `cjk-font = fandol|founder|mac|macoffice|noto|source|win|none`
- `fontset = fandol|mac|macoffice|win|none`
- `math-font = asana|cambria|fira|garamond|lm|libertinus|newcm|stix|bonum|dejavu|pagella|schola|termes|xits|none`
- `font-path = <path>`
- `config = <file list>`

类选项在内部 `nju / option` 键值命名空间下解析，早于选定论文类型 `.def` 文件的加载。影响封面 hook 注册的选项（如 `anonymous` 禁用 `decl-page`）必须在此阶段生效；之后通过 `\njusetup` 或配置文件无法移除已添加的封面 hook 代码。

所有类选项均标记 `.usage:n = load`，只能通过 `\documentclass` 的选项列表设置。在 `\njusetup` 中使用（如 `\njusetup { option / math-font = ... }`）会被用户层 `nju` 路径中 undefine 后的 unknown-key 机制拒绝。

## 主设置命令

```tex
\njusetup{...}
\njusetup[info]{...}
\njusetup[bib/resource]{refs.bib}
```

可选参数被归一化为顶层 `nju` 键值赋值。模块形式如 `\njusetup[info]{...}` 依赖对应顶层模块键值转发到 `nju / info`；完整路径如 `\njusetup[info/title]{...}` 作为顶层嵌套键值传递。

## 重要设置模块

- `info` — 标题、作者、院系、专业、导师、日期、分类号、答辩委员会、学位名称、邮箱等元数据。
- `bib` — 参考文献样式、资源文件和 biblatex 选项。
- `image` — 图形路径和 NJU 校徽/校名选择。`nju-logo-color` 接受内置颜色 `black|purple` 并同时设置校徽和校名；`nju-emblem` 和 `nju-name` 也接受自定义文件路径。
- `abstract` — 摘要目录条目、下划线行为和标题样式。
- `tableofcontents`、`listoffigures`、`listoftables` — 目录条目行为。
- `math` — TeX/ISO/GB 数学样式和详细符号选择。
- `theorem` — 定理样式、字体、QED 符号、计数器、类型列表和内置环境生成。
- `footnote` — 脚注标记样式、带圈文本选项和悬挂缩进。
- `header`、`footer` — 页面样式内容位置。
- `anonymous-mode` — 盲审行为，如隐藏学校信息。

## 特性开关

- `unicode-math = false` 表示 njuthesis 不执行其自动数学配置。`nju / math` 设置键值仍应存在以便解析共享设置文件，但需要 njuthesis 管理的 `unicode-math` 行为的键值在此选项下被过滤和惰化。

## 主要文档命令和环境

- `\maketitle` — 生成配置的封面和声明页。
- `abstract` — 中文摘要。
- `abstract*` — 英文摘要。
- `\tableofcontents`、`\listoffigures`、`\listoftables`。
- `\mainmatter`、`\frontmatter` — 重定义的页面样式/页码过渡。
- `notation`、`notation*` — 符号表页面。
- `preface` — 前言页。
- `acknowledgement` — 致谢页，含盲审模式行为。
- `\njuchapter{...}` — 无编号章节，含目录/书签处理。
- `\njupaperlist[<title>]{<bib keys>}` — 学术成果列表。

## 自定义命令

- `\njusetformat{<name>}{<format>}`
- `\njusetlength{<name>}{<length>}`
- `\njusetlength*{<name>}{<skip>}`
- `\njusetname{...}`
- `\njusettext{...}`
