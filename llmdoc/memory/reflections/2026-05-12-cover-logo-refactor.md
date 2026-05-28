# 反思：校徽 Logo 机制重构

## Task

- 用捆绑 PDF 资产替代基于 `njuvisual` 的过程式 logo 绘图。
- 将 `image/nju-emblem` 和 `image/nju-name` 从自由格式文件路径重新设计为 `.choice:` 键值，分 `black`、`purple` 和自定义（`unknown`）分支。
- 添加 `nju-logo-color` 便捷键值，一键设置两种颜色。
- 通过 `cover / begin` hook（替代 `\ctex_at_end_preamble:n`）注入内部 logo 命令生成。
- 将 logo PDF 文件从原示例素材位置移动到 `source/`，并在 `build.lua` 中声明为 `binaryfiles`。

## What Changed

- 移除了 `\@@_emblem:N` / `\@@_name:N` 包装器（委托给用户层 `\njuemblem` / `\njuname`）。替换为四层内部命令族：`:Nn`（基础 — `\includegraphics`）、`:cv`（csname→值变体）、`:n`（后缀→dim 便利）、`:`（默认后缀的零参数简写）。
- `\@@_new_img_cmd:nn`（用户层 `\NewDocumentCommand` per logo）替换为 `\@@_logo_file_update:nn`（填充 prop list）和 `\@@_new_logo_cs:nn` 式在类加载时生成的内部命令。
- 盲审清除：`\cs_gset_eq:NN \@@_logo_emblem:n \use_none:n` 替代了普通封面调用点的 `\RenewDocumentCommand \njuemblem { o m m } {}`。直接基础辅助调用（如本科固定声明页校徽）须单独检查；盲审模式禁用声明页。
- 移除了 `emblem color` / `name color` 格式默认值（随着 njuvisual 移除而变为死代码）。
- 移除了 `missing-image` 消息（死代码 — 无回退触发器保留）。

## Lesson

- 将命令生成循环和键值定义循环在视觉上分开。当前代码在用户界面小节之前关闭命令循环，为键值打开新循环，这比依赖跨 doc 区段的长循环更易阅读。
