# 编码约定

## 源文件与生成文件

- 主源文件为 `source/njuthesis.dtx`。修改行为必须从 dtx 入手，不得直接编辑 `build/` 或 `mythesis/` 下的生成文件（`.cls`、`.def`）。
- 当生成文件与 dtx 行为不一致时，以 dtx 为准，重新生成生成文件。
- dtx 导言区包含文件列表元数据块和安装期 `\Msg` 块，两者均需列出所有源文件（含 logo PDF）。新增或重命名源文件时同步更新这两处。

## dtx 编辑规范

### guard 边界

- 编辑 `%<*guard>` / `%</guard>` 包围的代码前，先用 Grep 定位所有 guard 起止位，确认完整范围后再操作。
- 删除 guarded 代码时优先大片替换（一次性替换包含 guard 标记的整个区域），避免多次小编辑累积 guard 结构误差。
- 每次编辑后检查相邻的 `%    \end{macrocode}` / `%    \begin{macrocode}` 是否成对、无重复。

### 语言字符串区域

- 语言字符串、长度常量等用 `\clist_map_inline:nn` 组织的区域，删除某个 item 只需移除对应行，不需要调整 macrocode 块边界。
- 只有当整个 macrocode 块（包含注释头）都被删除时，才需要合并相邻块或移除空块。

### 死代码判定

- 删除或废弃一个变量/键值前，必须追踪完整的数据流消费链：定义 → key 赋值 → hook 注入 → 格式/元素模板 → `\@@_name:n` 或 `\@@_info:n` 间接展开。
- 仅 grep 到"定义处的引用在被删代码中"不足以判定死代码——值可能通过转发的键值或格式命令间接消费，这些路径不会在 grep 中显现为 token list 变量的直接引用。

## expl3 编码规范

- 遵循当前 `source/njuthesis.dtx` 中的 expl3 命名风格和 `@@` 内部命名空间模式。
- 优先使用 e-type 展开，避免不必要的 x-type。
- 使用现有的 hooks、`xtemplate` 页面/元素实例和内部辅助函数，避免引入新机制。

## 键值命名空间

- 用户层键值放在 `nju` 命名空间下，模块子路径如 `nju / info`、`nju / bib`、`nju / image`、`nju / abstract`、`nju / theorem`、`nju / math`。
- 文档类选项放在 `nju / option` 子路径下（参见 `memory/decisions/2026-05-12-class-option-namespace.md`）。
- 类选项之间的内部转发（如 `fontset`、`minimal`）也应在 `nju / option` 内进行，而非转发到公开的 `nju` 设置命名空间。

## 引擎兼容

- 保留 XeLaTeX 和 LuaLaTeX 双引擎支持，除非任务明确缩窄范围。
- 避免引入 pdfLaTeX 假设；文档类需要 Unicode TeX 引擎。

## 版式变更

- 封面、摘要、声明页、页眉页脚、目录格式属于项目关键行为，修改需谨慎。
- 研究生封面间距常量为 Word 模板视觉匹配值，不应泛化到本科或博士后封面。

## 文档与变更记录

- `CHANGELOG.md` 用简体中文编写，记录用户可见变更。
- `source/njuthesis.dtx` 中的文档正文用简体中文编写。
- 每次有意义的源码或手册变更，在 dtx 对应位置添加 `\changes{vX.Y.Z}{YYYY/MM/DD}{...}` 条目，版本号使用 `CHANGELOG.md` 中的完整语义化版本号（如 `v1.5.0` 而非 `v1.5`）。
- llmdoc 知识文件用简体中文编写。

## 公开接口变更

- 公开接口变更需同步更新 dtx 手册章节，必要时反映到 `template/njuthesis-sample.tex` 或 `template/njuthesis-setup.def`。
- 禁止编辑生成文件作为主要修复手段。

## 废弃标记

- 废弃的公开键值在 dtx 手册中用 `\begin{function}[deprecated]{...}` 标记；实现代码中对应 `\begin{macro}[deprecated]{...}`。
- 废弃项保留定义以维持向后兼容，下个大版本删除。
- `\changes` 条目记录废弃时间与原因。
