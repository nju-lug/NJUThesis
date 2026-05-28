# 常用开发任务

关于命名空间、引擎兼容、版式变更等规则，参见 `reference/coding-conventions.md`。关于构建命令和测试流程，参见 `reference/build-and-test.md`。

## 编辑前

1. 阅读 `llmdoc/startup.md`。
2. 确认目标是源文件、示例、测试、打包还是生成输出。
3. 类行为变更优先修改 `source/njuthesis.dtx`。

## 编辑类行为

1. 在 `source/njuthesis.dtx` 中定位相关手册和实现区段。
2. 修改公开选项、命令或环境时，同步更新用户文档和实现。
3. 测试前先 `l3build install` 重新生成/安装。
4. 编译 `test/` 下最接近的变体文件。

## 编辑 `\njusetup` 或模块键值

1. 以 `source/njuthesis.dtx` 为规范来源。
2. 修改模块转发时保留盲审模式键值过滤。顶层 `nju` 下的模块键值应通过内部过滤 setter 路由嵌套值，而不是直接通过原始 l3keys 元展开。
3. 根据类选项状态一次性定义内部 setter。在选项处理后构建排除组 clist，然后在 clist 为空时将 `\@@_keys_set:nn` 别名为 `\keys_set:nn`，或定义为在需要筛选组时调用 `\keys_set_exclude_groups:nnn`。避免将选项条件逻辑放在 setter 体内，除非后续行为变更需要运行时切换。
4. 同时测试紧凑模块语法（`\njusetup[info]{...}`）和完整路径语法（`\njusetup[abstract/title-style]{...}`）。

## 编辑特性依赖设置键值

1. 当禁用可选特性宏包时，如果已有设置文件可能包含这些键值，保留用户层键值定义。
2. 为应在类选项下变为惰性的键值分配 l3keys 组。例如，需要 njuthesis 管理的 `unicode-math` 配置的数学键值应属于 `unicode-math` 组，并在 `unicode-math = false` 时被过滤。
3. 在选项状态初始化期间将组名添加到全局排除组 clist，而非在每次 `\njusetup` 调用时添加。
4. 对数学选项行为，在 `\begin{document}` 之后断言可观测的 TeX 层行为，因为字体加载和数学命令重写延迟到 begin-document hook。优先检查符号命令含义和活动数学字体族，而非仅检查内部选项布尔值。将广泛的字体族覆盖放在单独的字体聚焦回归测试中。

## 编辑公开示例

1. 更新 `template/njuthesis-sample.tex` 中的文档结构示例。
2. 更新 `template/njuthesis-setup.def` 中的 `\njusetup` 配置示例。
3. 保持示例注释与当前支持的选项和 README 指引一致。

## 排查构建失败

1. 检查失败发生在 TeX Live 设置、`l3build install`、依赖安装还是测试编译阶段。
2. 如果包依赖变更，检查 `scripts/file_parser.py`、`scripts/main.py` 和 workflow `PACKAGES` 种子。
3. 如果生成文件过期，从 dtx 重新生成，而非编辑生成输出。

## 发布/打包变更

1. 阅读 `.github/workflows/release.yml`。
2. 确认 `l3build ctan` 仍生成预期的 CTAN zip 和手册。
3. 确认用户 zip 仍包含示例文件、生成类/定义文件、视觉资产、`LICENSE`、`CHANGELOG.md` 和 `README.md`。
