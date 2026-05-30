# 反思：为 `nju / option` 全体键添加 `.usage:n = load`

## 背景

用户反映有人通过 `\njusetup` 误设文档类选项（如 `\njusetup { option / math-font = ... }`），导致不可控后果。`\njusetup` 底层为 `\keys_set:nn { nju }`（general 使用模式），与 `\ProcessKeysOptions`（load 使用模式）路径不同。`math-font` 已先行试点 `.usage:n = load`。

## 所做工作

- 为 `nju / option` 下全部静态类选项以及批量生成的可选宏包类选项标记 `.usage:n = load`。
- 在类选项吸收完成后，使用 `\prop_map_inline:Nn \l_keys_usage_load_prop` 批量 undefine 用户层 `nju` 路径下的 load-only key，确保 `\njusetup { option / ... }` 不会误改类选项。
- 调整了 `fontset` handler 和 `minimal` handler，避免在类选项 handler 内部再次解析同一 option namespace。匿名 `decl-page` 派生归一化发生在类选项吸收完成之后、批量 undefine 用户层路径之前，可保留 `\keys_set:nn { nju / option }`。
- 将三处调用改为直接操作内部变量（`\tl_gset:Nn`、`\bool_gset_false:N`）。
- 新增 `test/option-usage.lvt` 回归测试，验证类选项正常工作，并覆盖 `\njusetup` 误用静态类选项与批量生成类选项都不会改动内部状态。

## 关键教训

- `.usage:n = load` 在当前依赖中主要记录 usage 元数据，不会单独阻止 `\keys_set:nn`；真正阻止 `\njusetup` 误设的是根据 `\l_keys_usage_load_prop` 批量 undefine 用户层路径。
- `\l_keys_usage_load_prop` 中 `nju / option` 的值保存为相对用户层根路径的 key（如 `option/type`、`option/math-font`），因此批量 undefine 应作用在 `nju` 模块，而不是逐项手写 `nju / option` 子模块键。
- 类选项的 handler 如需要跨键设置状态，必须直接操作内部 token list / boolean / integer 变量，不能走键值转发。
- 此约束应写入编码约定和开发指南，防止后续开发者按旧模式新增需要转发的 handler。

## 影响范围

修改了 `minimal`、`fontset`、可选宏包类选项 helper 和基于 `\l_keys_usage_load_prop` 的用户层路径 undefine；匿名 `decl-page` 派生归一化保持原有 `\keys_set:nn { nju / option }` 写法。
