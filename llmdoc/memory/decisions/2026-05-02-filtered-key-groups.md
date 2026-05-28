# 决策：`\njusetup` 使用分组键值过滤

## 背景

- `\njusetup` 应在特性宏包被类选项禁用时仍保持为稳定接口。
- `anonymous` 模式已需要分组键值过滤。
- `unicode-math = false` 应表示 njuthesis 不执行数学配置，但 `nju / math` 键值仍应存在以便默认设置文件可继续解析。

## 决策

- 保留特性依赖键值的定义。
- 为应在模式或特性开关下被忽略的键值分配 l3keys 组。
- 维护一个全局 clist（当前变量名为 `\g_@@_keys_excl_clist`），记录 `\@@_keys_set:nn` 应排除的组名。
- 在类选项处理后一次性构建该 clist，然后一次性定义 `\@@_keys_set:nn`：
  - 若 clist 为空，将 `\@@_keys_set:nn` 别名为 `\keys_set:nn`；
  - 若 clist 非空，将 `\@@_keys_set:nn` 定义为调用 `\@@_keys_set_exclude_groups:nnn` 并传入已存储的 clist。

## 理由

- 在 `\@@_keys_set:nn` 中逐次调用做布尔检查是不必要的，因为相关类选项在用户设置接口定义之前已固定。
- 随着更多过滤组的加入，单个 clist 比分散的嵌套条件分支更易扩展。
- 保留键值定义在禁用特性行为的同时保持了设置文件的兼容性。

## 实现注意事项

- `\g_@@_keys_excl_clist` 与其他早期变量一起声明，但在 `\@@_keys_set:nn` 附近填充，使过滤行为在一处即可阅读。
- 用直接的选项状态检查添加组名：`\bool_if:NT \g_@@_opt_anon_bool { \clist_gput_right:Nn ... { anonymous } }`。
- 对 `unicode-math = false`，添加 `unicode-math` 组，并在相关数学键值上标记 `.groups:n = { unicode-math }`。
- 在 `\@@_keys_set:nn` 定义后不要修改 clist。若未来特性需要运行时切换，应重新审视此决策。
- 数学选项效果的回归测试应在 `\begin{document}` 之后断言可观测的 TeX 层行为，因为数学字体加载和延迟命令重写在 begin-document hook 中执行。
