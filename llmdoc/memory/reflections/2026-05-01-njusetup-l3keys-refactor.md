# 反思：`\njusetup` l3keys 重构

## Task

- 将已弃用的 `\keys_set_filter:nnn` 替换为 `\keys_set_exclude_groups:nnn`，同时保留对旧内核的回退。
- 简化 `\njusetup` 可选参数处理，使模块名和完整嵌套键值路径都作为顶层 `nju` 赋值传递。
- 关联 Issue #281。

## Expected vs Actual

- Expected：`\njusetup[info]{...}` 应正确归一化，盲审过滤对嵌套模块同样生效。
- Actual：使用 `.meta:nn` 辅助函数展开会绕过分组过滤——它通过内部 setter 展开，不会对嵌套键值重新应用分组过滤。

## Root Cause

- 将 `\njusetup[info]{...}` 归一化为 `\keys_set:nn { nju } { info = {...} }` 仅当顶层 `info` 模块键值通过相同的匿名感知 setter 转发时才安全。
- `\keys_set_exclude_groups:nnn` 的组列表参数应接收字面组名。传递条件表达式作为该参数不会为 l3keys 过滤产生预期的 `anonymous` 组名——应在调用之前完成分支。
- 风格偏好：不将选项状态逻辑放在 `\@@_keys_set:nn` 命令体内。根据匿名选项状态一次性定义：匿名模式使用带字面 `anonymous` 组的 `\keys_set_exclude_groups:nnn`，正常模式别名为 `\keys_set:nn`。

## Promotion

- `guides/common-development-tasks.md` 现已记录此事，供后续 `\njusetup` 或模块键值编辑参考。
- `reference/user-interface.md` 现已记录归一化可选参数模型。
- `memory/decisions/2026-05-02-filtered-key-groups.md` 记录了将排除 l3keys 组收集到全局 clist 中并从该 clist 一次性定义 `\@@_keys_set:nn` 的后续决策。实现的简洁 clist 名为 `\g_@@_keys_excl_clist`。
