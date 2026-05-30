---
name: fontset-win-default
description: 示例模板默认 fontset=win，因学校提交要求对齐 Word 版本
metadata:
  type: decision
---

## 决策

示例模板 `template/njuthesis-sample.tex` 默认设置 `fontset = win`。

## 背景

- 学校学位论文提交要求与 Word 版本排版一致，Windows 字体（SimSun、SimHei、Times New Roman 等）是事实标准。
- 当前自动检测逻辑按平台选择字体：Windows→win，macOS+Office→macoffice，macOS→mac，其他→fandol。
- Overleaf（Ubuntu）自动检测到 fandol，用户无感知地使用了非标准字体，排版结果与 Word 不一致。
- 自动检测的初衷是"让代码能跑起来"，而非"满足学校要求"。

## 方案

**当前只做示例模板默认修改**，不改 cls 自动检测逻辑。

- 在 `\documentclass` 选项中显式设置 `fontset = win`。
- 注释说明改为提示：学校要求使用 Windows 字体，如在无 Windows 字体的系统上编译需额外安装或改用其他 fontset。

## 未来可选方向（未实施）

- cls 自动检测改为字体可用性优先（探测 SimSun 等关键字体是否存在），而非纯平台检测。
- 两条路组合：模板显式声明 + cls 智能兜底。
