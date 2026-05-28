# 封面 Hook 选项时序

为何某些类选项副作用必须在论文类型 `.def` 文件加载前完成归一化。

## 背景

封面 hook 重构之前，声明页实际在封面生成命令执行时才决定。类中后续代码仍可在渲染前修改 `\g_@@_opt_decl_bool`，旧流程会观察到最终值。

重构后，生成的论文类型 `.def` 文件在类加载期将封面代码注册到 hooks 中：

- `cover/body` 接收主封面代码。
- 当 `decl-page` 为 true 时，`cover/body` 可能同时接收 `decl-i`。
- `cover/back` 可能接收 `decl-ii`（研究生授权页）。

代码一旦添加到 hook 中，之后修改决定注册与否的布尔值不会移除该 hook 代码。因此任何影响封面/声明 hook 代码是否注册的选项，必须在 `.def` 文件加载前确定。

## 当前加载顺序

关键执行顺序为：

1. 在 `nju / option` 下定义类选项键值。
2. 执行 `\ProcessKeysOptions { nju / option }`。
3. 应用影响早期决策的派生类选项归一化。当前示例为盲审模式强制 `decl-page = false`。
4. 声明语义封面 hooks。
5. 加载 `type` 选定的论文类型 `.def` 文件。
6. `.def` 文件执行论文类型设置，包括声明宏包加载和基于已最终确定的选项布尔值注册封面 hook。
7. 从 `config` 类选项加载用户配置文件。

**注意**：`source/njuthesis.dtx` 中的文档源码顺序可能误导——guarded `.def` 代码出现在相关类代码附近，但仅在生成的 `.def` 文件被加载时才执行。

## 盲审模式与声明页

盲审模式在类选项处理完毕后立即禁用声明页：

```tex
\ProcessKeysOptions { nju / option }

\bool_if:NT \g_@@_opt_anon_bool
  { \keys_set:nn { nju / option } { decl-page = false } }
```

这必须在加载 `njuthesis-undergraduate.def`、`njuthesis-graduate.def` 或 `njuthesis-postdoctoral.def` 之前执行；否则这些文件可能已经注册了声明页 hook 代码。

## 维护守则

- 将 hook 注册决策放在文档生成代码之外，除非 hook body 本身旨在渲染时分支。
- 类选项放在 `nju / option` 下；命名空间决策参见 `memory/decisions/2026-05-12-class-option-namespace.md`。
- 若类选项改变是否应注册 hook，在 `\ProcessKeysOptions` 之后且 `.def` 加载之前立即归一化。
- 若类选项内部转发到其他类选项，在 `nju / option` 内转发。转发到公开的 `nju` 设置命名空间将无法命中类选项键值。
- 用户配置文件在论文类型 `.def` 文件之后加载。不应使用它们来更改已控制宏包加载或封面 hook 注册的类选项。
