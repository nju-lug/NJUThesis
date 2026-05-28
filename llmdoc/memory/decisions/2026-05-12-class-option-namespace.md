# 决策：类选项放在 `nju / option` 下

## 背景

- `\njusetup` 使用公开顶层 `nju` 命名空间，承载 `info`、`image`、`bib`、`math`、`anonymous-mode` 等用户配置模块。
- 文档类选项处理早于普通用户设置，可能影响宏包加载、选定的论文类型 `.def` 文件和封面 hook 注册。
- 封面 hook 重构使部分选项派生决策变为加载顺序敏感——特别是 `anonymous` 强制 `decl-page = false` 必须在 `.def` 加载前执行。

## 决策

- 将文档类选项键值定义在内部命名空间 `nju / option` 下。
- 通过以下命令处理类选项：

```tex
\ProcessKeysOptions { nju / option }
```

- 保持公开 `nju` 命名空间用于 `\njusetup` 模块转发和用户设置键值。

## 理由

- 分离类选项和设置模块避免了类选项 `type` 与模块键值 `theorem/type` 等命名冲突。
- 使类选项阶段显式化：选项解析 → 派生效果归一化 → 加载论文类型 `.def` 文件。
- 防止后续 `\njusetup` 式过滤或模块转发与必须在类加载期完成的宏包加载和 hook 注册决策混淆。

## 实现注意事项

- 类选项内部转发必须保持在 `nju / option` 内。例如 `minimal` 和 `fontset` 在转发到其他类选项时应调用 `\keys_set:nn { nju / option }`。
- 类选项归一化不要使用 `\@@_keys_set:nn`。该辅助函数面向公开 `\njusetup` 路径，可能过滤分组设置键值。
- 若类选项决定是否注册 hook 代码，在 `\ProcessKeysOptions { nju / option }` 之后且加载生成论文类型 `.def` 文件之前立即归一化。
- `config` 类选项指定的用户配置文件在选定 `.def` 文件之后加载，不应依赖它们来更改已控制宏包加载或封面 hook 注册的类选项决策。
