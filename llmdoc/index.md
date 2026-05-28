# llmdoc 索引

## overview

- `llmdoc/overview/project-overview.md` — 项目范围与定位、用户与维护者路径、技术栈。目录和文件清单见 `reference/file-map.md`。

## architecture

- `llmdoc/architecture/document-class-architecture.md` — `njuthesis.dtx` 主干架构：expl3 类声明、`ctexbook` 基类、`l3keys` 选项系统、`xtemplate` 页面/元素实例、LaTeX hooks 封面生成流程、配置流时序（类选项解析→def 加载→`\njusetup`→延迟 hooks）、版式敏感子系统（本科/研究生/博士后/国家图书馆封面、声明页、摘要、目录、参考文献）。
- `llmdoc/architecture/cover-logo-mechanism.md` — 校名校徽颜色选择机制：`.def` 文件中的 `\c_@@_logo_color_tl` 默认值传递、`nju-logo-color` 便捷键与 `nju-emblem`/`nju-name` 分设 choice 键、prop→tl→`\includegraphics` 运行时流水线、内部四层命令族（`:Nn`/`:cv`/`:n`/`:`）、本科声明页固定紫色校徽的例外处理。
- `llmdoc/architecture/cover-hook-option-timing.md` — 封面 hook 选项时序：为何 `anonymous` 强制 `decl-page = false` 必须在论文类型 `.def` 加载前执行、`.def` 文件在类加载期注册封面/声明 hook 代码的时序约束、`\ProcessKeysOptions`→选项归一化→hook 声明→`.def` 加载→用户 config 加载的严格顺序。
- `llmdoc/architecture/anonymous-mode-mechanism.md` — 盲审模式机制：`anonymous` 类选项、`\g_@@_opt_anon_bool` 布尔门控、`\g_@@_keys_excl_clist` 分组键值过滤阻止 `\njusetup` 重入敏感字段、声明页清除时序（必须在 `.def` 加载前）、个人信息匿名化占位替换、论文列表/致谢输出命令重定向、`anonymous-mode/no-nju` 隐藏学校信息。
- `llmdoc/architecture/undergraduate-cover-second-column-spacing.md` — 本科封面第二列间距：为何本科封面信息块需要 `\l_@@_clabelwd_dim` 和 `\l_@@_clabelwdi_dim` 两套标签宽度（而非共享单一宽度）、双字段行辅助函数签名（`\@@_cover_entry:NNNNnn` 和 `\@@_cover_entry_supv:NNNNn`）、短下划线宽度计算公式、`-16 pt` 水平偏移与 `\vbox_center:n` 配合。
- `llmdoc/architecture/graduate-cover-word-template-spacing.md` — 研究生封面 Word 模板间距：为何研究生普通封面存在大量看似任意的局部间距常量（`-18 pt`、`0.923` 行距、`14.4 pt` 冒号盒等）、这些值是 Word 模板视觉匹配值而非通用排版系统、修改时必须以 Word 版本为对照而非"清理"数字、常量范围限定在研究生封面路径内不得泛化。
- `llmdoc/architecture/build-release-architecture.md` — 构建与发布架构的设计约束：CI 两阶段流水线（回归测试→文档编译）、`l3build ctan` 内部调用 `l3build check` 的隐藏耦合及由此产生的依赖闭包要求、`--exclude` 标志的发布/构建差异、失败产物上传策略。具体命令和操作清单见 `reference/build-and-test.md`。

## reference

- `llmdoc/reference/build-and-test.md` — `l3build` 构建命令速查、本地检查清单、编译引擎支持、CI 构建与发布模型、依赖分析脚本、失败诊断流程。测试文件清单见 `reference/file-map.md`。
- `llmdoc/reference/coding-conventions.md` — expl3 命名、`@@` 私有空间、e-type 优先、键值命名空间（`nju`/`nju / option`）、引擎兼容约束、版式变更注意事项、文档与变更记录语言约定。
- `llmdoc/reference/file-map.md` — 源文件、构建配置、模板/示例、测试、脚本、CI/CD、根目录文件、生成/二次文件的完整清单与信任层级。
- `llmdoc/reference/user-interface.md` — 类选项（`type`、`degree`、`nl-cover`、`anonymous` 等）、`\njusetup` 模块（`info`、`bib`、`image`、`abstract`、`math`、`theorem` 等）、主要文档命令和环境、自定义命令。

## guides

- `llmdoc/guides/common-development-tasks.md` — 编辑类行为、`\njusetup` 与模块键值、特性依赖设置键值、公开示例、构建失败排查、发布/打包变更的实用流程。

## memory

- `llmdoc/memory/decisions/2026-05-02-filtered-key-groups.md` — 决策：`\njusetup` 使用 `\keys_set_exclude_groups:nnn` 过滤盲审敏感键值组，而非每个键值单独判断。
- `llmdoc/memory/decisions/2026-05-12-class-option-namespace.md` — 决策：类选项统一放在 `nju / option` 子路径下，与用户层 `\njusetup` 的 `nju` 命名空间分离。
- `llmdoc/memory/decisions/2026-05-15-l3kernel-compatibility-wrappers.md` — 决策：新 l3kernel 接口使用条件兼容包装，保持对旧 TeX Live 的支持（如 `\vbox_center:n`）。
- `llmdoc/memory/reflections/2026-05-01-njusetup-l3keys-refactor.md` — 反思：`\njusetup` 从 `\keys_set_known:nnN` 迁移到过滤分组机制的过程与根因。
- `llmdoc/memory/reflections/2026-05-12-cover-logo-refactor.md` — 反思：从 `njuvisual` 过程式绘图迁移到捆绑 PDF 校徽资产、重构内部命令族、`cover/begin` hook 替代 `\ctex_at_end_preamble:n` 的过程。
- `llmdoc/memory/reflections/2026-05-14-ci-deps-and-debugging.md` — 反思：CI 依赖分析脚本中 `--exclude` 标志导致 `l3build ctan` 静默失败的根因、失败产物上传机制的建立。
- `llmdoc/memory/reflections/2026-05-28-nl-cover-linebreak-fix.md` — 反思：#314 国家图书馆封面标题断行修复——`\@@_cover_title_nl:` 中使用原始 `\vbox:n` 缺少 `\@parboxrestore` 导致断行错误；修复为改用已有 `\@@_box_paragraph:nn` 辅助函数，与其他封面标题路径保持一致。教训：引入共享辅助函数后应审计所有已有调用点。
- `llmdoc/memory/reflections/2026-05-28-authdecl-removal-guards.md` — 反思：v1.5.1 删除研究生出版授权书时，多次小编辑未精确对齐 `%</def-g>` guard 边界，导致重复的 macrocode 块标记。教训：删除 guarded 代码前应先画出 guard 范围地图，优先大片替换，每次编辑后验证相邻块边界。
