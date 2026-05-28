# Issue #314 国家图书馆封面标题断行修复

## Task

- 修复 #314：国家图书馆封面标题断行异常。
- 根因：`\@@_cover_title_nl:` 使用原始 `\vbox:n` 手动设置 `\tex_hsize:D` 限制标题宽度，但未调用 `\@parboxrestore` 重置段落参数，导致断行位置错误。
- 修复：改用已有的 `\@@_box_paragraph:nn` 辅助函数（v1.5.0 引入，位于第 3289 行），该函数通过 `\vbox_top:n` 包裹 `\@parboxrestore` 并保留 `\tex_prevdepth:D`，正确处理段落参数。

## Expected vs Actual

- Expected：国家图书馆封面标题在 15em 宽度内正确断行。
- Actual：原始 `\vbox:n` 缺少 `\@parboxrestore`，段落参数未重置，导致断行行为不可预期。

## Root Cause

- `\@@_box_paragraph:nn` 在 v1.5.0 引入，通用封面标题代码 `\@@_cover_entry_title:NNNN`（第 3616 行）已经使用它，但 `\@@_cover_title_nl:` 是旧代码路径，未被更新。
- 旧代码的另一缺陷：`\l_@@_fmt_covertitle_tl`（封面标题格式 token list）未被包含在标题内容中。

## What Changed

- `\@@_cover_title_nl:` 现调用 `\@@_box_paragraph:nn { 15 em } { \l_@@_fmt_covertitle_tl \@@_print_ulined_title: }`，与 `\@@_cover_entry_title:NNNN` 使用模式一致。
- 移除了旧的 `\mode_leave_vertical:` + 原始 `\vbox:n` 块。

## Lesson

- 当引入共享辅助函数替代原始 TeX 原语时，应审计所有已有调用点是否有相同模式。NL 封面标题是在不同封面变体（`cover-nl`）中的孤立调用点，因不在通用封面路径中而被遗漏。
