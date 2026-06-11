# Lessons Learned

Curated cross-task rules distilled from archived memory.

## LaTeX3 编辑纪律

### Guard 边界优先映射
**Rule**: 删除 guarded (`%<*tag>` / `%</tag>`) 代码前，先画出 guard 范围地图，优先大片替换，每次编辑后验证相邻块边界。
**Why**: v1.5.1 删除研究生出版授权书时，多次小编辑未精确对齐 `%</def-g>` 边界，导致重复 macrocode 块标记。
**Source**: `llmdoc/memory/reflections/2026-05-28-authdecl-removal-guards.md`

### 引入共享辅助函数后审计调用点
**Rule**: 引入或重命名共享辅助函数后，审计所有已有调用点是否应迁移。
**Why**: `\@@_box_paragraph:nn` 被引入后，`\@@_cover_title_nl:` 仍用原始 `\vbox:n` 缺少 `\@parboxrestore`，导致断行错误 (#314)。
**Source**: `llmdoc/memory/reflections/2026-05-28-nl-cover-linebreak-fix.md`

### 内部键值禁用作用域
**Rule**: 通过 `l3keys` 禁用用户层键值路径时，确保内部 `\keys_set:nn` 转发点不受影响。
**Why**: 为 `.usage:n = load` 选项批量 undefine 用户层路径时，内部转发点也被阻断。
**Source**: `llmdoc/memory/reflections/2026-05-30-option-usage-load.md`

### 分组过滤优于逐键过滤
**Rule**: 需要按条件排除一批键值时，使用 `l3keys` 分组机制而非逐个判断。
**Why**: `\njusetup` 盲审过滤从逐键迁移至 `\keys_set_exclude_groups:nnn`，可维护性显著提升。
**Source**: `llmdoc/memory/reflections/2026-05-01-njusetup-l3keys-refactor.md`

## 构建与 CI

### 内部工具标志耦合可致静默失败
**Rule**: 当构建工具内部调用另一个命令时，检查标志传递差异。
**Why**: `l3build ctan` 内部调用 `l3build check`，`--exclude` 标志在两者间语义不同，导致静默失败。
**Source**: `llmdoc/memory/reflections/2026-05-14-ci-deps-and-debugging.md`

### CI PACKAGES 种子双文件同步
**Rule**: 新增测试依赖时，必须同时更新 `build.yml` 和 `release.yml` 的 `PACKAGES` 环境变量。
**Why**: 两个 workflow 各自维护独立的 PACKAGES 列表，新增 `option-usage.lvt` 间接依赖 `cleveref` 后只更新了 `build.yml`，release CI 缺包失败。
**Source**: `llmdoc/memory/reflections/2026-05-30-release-ci-packages-sync.md`

## Hook 与执行时序

### Hook 时序选择
**Rule**: 区分 `\ctex_at_end_preamble:n`、`cover/begin` hook、`\@@_at_begin_document:n` 的执行顺序，按依赖关系选择。
**Why**: 从 `\ctex_at_end_preamble:n` 迁移到 `cover/begin` hook 时，需确认封面元素注册的时序约束。
**Source**: `llmdoc/memory/reflections/2026-05-12-cover-logo-refactor.md`

### 宏包时序用 package hook
**Rule**: 修改宏包载入前后行为时，优先使用 `package/<pkg>/before|after`，只有确实关心底层文件读取时才使用 file hook。
**Why**: biblatex 集成需要覆盖用户手动 `\usepackage{biblatex}` 和模板后备自动载入两条路径，package hook 的语义正好匹配；file hook 会把问题降到不必要的底层文件时序。
**Source**: `llmdoc/memory/reflections/2026-06-10-biblatex-hook-loading.md`

## 参考文献测试

### biblatex 行为用完整编译验证
**Rule**: 参考文献样式、选项、资源和输出变更应使用 `.tex + .bib + biber + \printbibliography` 的 l3build 测试保存 `.tlg`，不要只断言内部变量。
**Why**: biblatex 的可见行为跨越包加载、选项执行、Biber 数据处理和最终 bibliography 输出，内部状态断言容易漏掉用户实际看到的问题。
**Source**: `llmdoc/memory/reflections/2026-06-10-biblatex-hook-loading.md`

### citekey 参数不要带空格
**Rule**: biblatex 回归测试中 cite 命令写作 `\cite{key}`，避免 `\cite { key }` 或 `\cite{key }`。
**Why**: biblatex 会把参数中的尾随空格计入 citekey，导致 `.tlg` 出现误导性的 undefined citation 警告。
**Source**: `llmdoc/memory/reflections/2026-06-10-biblatex-hook-loading.md`
