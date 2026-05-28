# 校徽校名颜色机制

v1.5.0 用捆绑 PDF 校徽资产替代 `njuvisual` 过程式绘图后的颜色选择机制。本文仅涉及颜色/默认值选择；盲审行为参见 `anonymous-mode-mechanism.md`。

## 规范来源

- 实现：`source/njuthesis.dtx`，"校名校徽"节。
- 生成资产：`source/nju-emblem-black.pdf`、`source/nju-emblem-purple.pdf`、`source/nju-name-black.pdf`、`source/nju-name-purple.pdf`。
- 构建打包：`build.lua` 将 logo PDF 列为 source、install 和 binary 文件。

## 默认颜色传递

默认颜色不存储在生成的 `.def` 文件的 `l3keys` 键值中。`.def` 文件在 `njuthesis.cls` 早期加载，此时 `nju / image` 键值尚未定义，因此在那里定义或初始化 `nju-logo-color` 会依赖不存在的键值。

取而代之，每个论文类型 `.def` 声明一个常量：

```tex
%<def-u|def-p>\tl_const:Nn \c_@@_logo_color_tl { black  }
%<def-g>\tl_const:Nn \c_@@_logo_color_tl { purple }
```

之后当类定义 `nju-logo-color` 时消费该常量：

```tex
nju-logo-color .initial:V = \c_@@_logo_color_tl
```

这保留了历史 `.def` 加载顺序，同时让每种论文类型拥有自己的默认颜色。

## 用户层键值

`nju-logo-color` 是 `nju / image` 下的便捷键：

```tex
nju-logo-color .choices:nn = { black, purple }
  { \keys_set:nn { nju / image } { nju-emblem = #1, nju-name = #1 } }
```

仅接受内置颜色名 `black` 和 `purple`。

`nju-emblem` 和 `nju-name` 是两种 logo 类型各自生成的 choice 键：

| 选项 | 效果 |
|------|------|
| `black` | 使用 `nju-emblem-black.pdf` 或 `nju-name-black.pdf` |
| `purple` | 使用 `nju-emblem-purple.pdf` 或 `nju-name-purple.pdf` |
| 其他值 | 将值视为字面文件路径 |

两个文件需要使用相同内置颜色时用 `nju-logo-color`。需要分别设置颜色或使用自定义文件时用 `nju-emblem` 和 `nju-name`。

## 运行时流水线

```
默认常量或用户键值
  → choice handler 调用 \@@_logo_file_update:nn
  → \l_@@_logo_file_prop 存储 emblem/name 文件名
  → cover/begin hook 将 prop 条目复制到 tl 变量
  → 元素实例调用 \@@_logo_emblem: 或 \@@_logo_name:
  → \includegraphics 加载选定的 PDF
```

prop 到 tl 的分离是有意的。prop 在配置期由键值 handler 填充，tl 变量在 `cover/begin` hook 中于封面渲染前更新。xtemplate 元素内容只需读取 token list。

## 内部命令族

对每种 logo 类型（`emblem`、`name`），类创建以下辅助命令：

| 变体 | 角色 |
|------|------|
| `\@@_logo_<type>:Nn` | 基础包装：`\includegraphics[width=#1]{#2}` |
| `\@@_logo_<type>:cv` | 接受维度 csname 和文件名 tl csname 的变体 |
| `\@@_logo_<type>:n` | 通过后缀选择宽度变量并读取当前文件 tl |
| `\@@_logo_<type>:` | 使用默认宽度后缀的零参数形式 |

宽度后缀：

| 后缀 | 维度变量 | 典型用途 |
|------|----------|----------|
| 空 | `l_@@_emblemwd_dim` / `l_@@_namewd_dim` | 标准封面 |
| `i` | `l_@@_emblemwdi_dim` | 本科声明页校徽 |
| `ii` | `l_@@_emblemwdii_dim` | 研究生英文封面校徽 |

## 本科声明页例外

本科诚信声明页直接使用紫色校徽：

```tex
\@@_logo_emblem:Nn \l_@@_emblemwdi_dim { nju-emblem-purple.pdf }
```

该页面是固定声明表格，不受 `image/nju-logo-color` 控制。盲审模式在此外可能生效前已禁用声明页。
