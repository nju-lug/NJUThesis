# 决策：为新 l3kernel 接口添加发布兼容包装

## 背景

- `njuthesis` v1.5.0 在项目不需要更新内核的情况下，应仍可用于 TeX Live 2026 之前的版本。
- v1.5.0 工作中使用的一些 l3kernel 接口比 `source/njuthesis.dtx` 检查的最低 expl3 日期更新。
- `\box_underline:Nnn` 在某些发行版中的引入早于当前最低日期，因此 dtx 已使用内部包装 `\@@_box_underline:Nnn`。
- `\vbox_center:n` 于 2026-02-17 添加到 `l3box`。直接使用会在 pre-TeX Live 2026 安装上中断编译，即使类的其余部分可以编译。

## 决策

- 除非有意同时提高所需 expl3 日期，否则不直接调用新引入的 l3kernel 接口。
- 在 `source/njuthesis.dtx` 的共享辅助代码附近为此类接口添加局部内部包装。
- 使用 `\cs_if_exist:NTF` 测试后优先使用原生接口。
- 仅针对类所需的精确行为提供窄范围的回退实现。

## 理由

- 保持公开发行版在预期的 TeX Live 范围内可用。
- 避免为一个小的辅助函数提高全局 expl3 要求。
- 兼容代码在 `\@@_box_underline:Nnn` 等既有包装器旁边可发现。
- 论文类型 `.def` 文件不直接依赖比主类兼容层更新的内核特性。

## 实现注意事项

- `\vbox_center:n` 兼容包装应命名为 `\@@_vbox_center:n`。
- 封面代码应直接调用 `\@@_vbox_center:n`，而非 `\vbox_center:n`。
- 回退应镜像 l3kernel 行为：将内容设置到临时垂直盒子中，计算 `height + depth`，使用 TeX 奇进偶舍规则对该总高度取半，然后将剩余高度设为 depth。
- 添加另一个兼容包装时，在 `\changes` 条目中记录上游接口日期，并注明为何不提高全局 expl3 要求。
