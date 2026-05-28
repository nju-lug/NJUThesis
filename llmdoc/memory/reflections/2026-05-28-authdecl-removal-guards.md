# 反思：删除 authdecl 代码时的 guard 与死代码判定问题

## 背景

v1.5.1 移除研究生学位论文出版授权书（`authdecl-g`），需从 `source/njuthesis.dtx` 中删除页面定义、元素实例、辅助函数和语言字符串。

## 问题

1. **guard 边界错位**。删除操作分多次小编辑进行，部分编辑未精确对齐 `%<*def-g>` / `%</def-g>` guard 边界，产生重复的 `\end{macrocode}` / `\begin{macrocode}` 对，语言字符串区域代码块结构被破坏。

2. **误判死代码**。将 `info/secret-level` 标记为 `[deprecated]`，但该键值仍被研究生普通封面使用。`\g_@@_info_secretlv_tl` 的直接引用仅出现在定义处，但其值通过封面绘制链路间接消费，仅靠 grep 直接引用不足以判定。

3. **过度保守**。`info/email` 仅被授权书使用且从未进入用户手册，本可直接删除，却选择了保留 + `[deprecated]` 的方案。

## 根因

代理在编辑 dtx 时缺少三个关键检查：
- 删除前不画 guard 范围地图
- 多次小编辑替换累积结构误差
- 仅 grep token list 变量的直接引用，不追踪键值 → hook → 模板的间接消费链

相关规范已写入 `reference/coding-conventions.md` 的"dtx 编辑规范"小节。
