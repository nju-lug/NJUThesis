# njuthesis 修订记录

本项目发生的变动均会记录于本文档。

本文档格式来自《[更新日志]》，本项目使用《[语义化版本]》标记版本号。

## [未发布]

## [0.16.1] - 2022-03-27

### 修复

- 修复国家图书馆封面的“UDC”名称格式
- 修复研究生摘要标题的断行问题 - [#98], [#105], [#107]
  - 提供 `style/abstract-title` 设置项
- 为研究生摘要补上“摘要”小标题字样 - [#99]

## [0.16.0] - 2022-03-19

### 新增

- 将本科生和研究生模板定义分离为单独的 `.def` 文件 - [#46]
- 可以手动指定页眉页脚 - [#85]
  - 新增 `style/header` 等若干设置项

### 修复

- 研究生模板的目录、摘要等页面也显示页眉 - [#99]

### 变动

- 取消对 `njuvisual` 宏包的强制依赖
  - 简化自动安装脚本

### 杂项

- 说明手册中增加对 JabRef 软件的简介
  - 感谢 [@zhoujian9410]！
- 说明手册中增加数学字体样式说明 - [#89], [#92]
  - 感谢 [@zepinglee]！
- 说明手册中增加宏包依赖信息

## [0.15.0] - 2022-02-20

### 新增

- 新增符号表页面 `notation` - [#61]
- 可选择是否隐藏特定目录条目
  - 新增选项 `style/abstract-in-toc` - [#66]
  - 新增选项 `style/toc-in-toc`
- 可使用自定义的参考文献样式 - [#71]
  - 修改选项 `bib/style`
- 可传入自定义 `biblatex` 设置
  - 新增选项 `bib/option`
- 增加对章末参考文献表的支持 - [#79]
  - 感谢 [@hushidong]！

### 修复

- 修复了单面模式下的 `fancyhdr` 宏包警告
- 修复研究生封面上第二导师无法正确显示的问题 - [#64]

### 变动

- 为关键词列表添加悬挂缩进
- 研究生模板页眉样式及内容变动
  - 使用小号楷体
  - 双面模式下奇数页右侧为节名，偶数页左侧为章名
  - 单面模式下页眉同时显示章节名，特殊页面居中显示其名称
- 移除内部调用的宏包
  - `url`

### 优化

- 使用 `xtemplate` 重新绘制封面 - [#46]

### 杂项

- 使用 GitHub 表单重构 issue 模板
- 将使用问题引导至项目论坛

## [0.14.0] - 2022-01-16

### 新增

- 新增单双面模式 `oneside` 和 `twoside` 选项
- 新增参考文献设置项 `bib`
  - 提供设置文献表样式的 `bib/style` 选项 - [#44]
  - 提供导入多个文献源的 `bib/resource` 选项
- 新增外观样式设置项 `style`
  - 提供更改封面校徽图片的 `style/emblem-img` 选项
  - 提供更改封面校名图片的 `style/name-img` 选项
- 新增 Adobe 思源宋体 `cjk-font=source` 选项

### 变动

- 选项名称变更
  - 原创性声明页选项更名为 `decl-page`
- 导师姓名职称合并在 `info/supervisor` 填写 - [#60]
  - 感谢 [@zepinglee]！
- 标题选项 `info/title` 使用 `\\` 进行手动换行 - [#60]
  - 感谢 [@zepinglee]！
- 使用 ISO 格式统一标记提交日期 `info/submit-date`
  - 感谢 [@zepinglee]！
- 交付用户的压缩包更名为 `njuthesis-user-v*.zip`

### 移除

- 移除封面个人信息设置项
  - `info/supervisor-title`
  - `info/supervisor-title*`
  - `info/supervisor-ii-title`
  - `info/supervisor-ii-title*`
  - `info/submit-date*`
- 移除内部调用的宏包
  - `hologo`
  - `multirow`
  - `subcaption`
  - `wrapfig`

### 杂项

- 将本模板内嵌入[南大 TeX] 网站
- 编写修订记录
- 修改 GitHub issue 模板，添加行为准则
- 说明手册样式调整
  - 封面标题使用粗体

## [0.13.1] - 2021-12-15

<!-- 这个版本有新增功能，本应合并到 v0.14.0 -->

### 新增

- 新增草稿模式 `draft` 选项
- `orig-decl` 选项可绘制本科生诚信承诺书页面

### 变动

- 摘要格式更正

### 杂项

- 在 CTAN 发布压缩包中添加许可证文件
- 在手册中使用南大标准色作为超链接颜色

## [0.13.0] - 2021-12-13

### 修复

- 修正数学字体
- 修复页眉字符重叠的问题

### 变动

- 选项名称变更
  - 英文字体选项更名为 `latin-font`
  - 中文字体选项更名为 `cjk-font`
  - Windows 字库选项更名为 `win`
  - macOS 字库选项更名为 `mac`
- 导师信息选项名称变更为：
  - `info/supervisor`
  - `info/supervisor*`
  - `info/supervisor-title`
  - `info/supervisor-title*`
  - `info/supervisor-ii`
  - `info/supervisor-ii*`
  - `info/supervisor-ii-title`
  - `info/supervisor-ii-title*`

### 优化

- 使用 `ntheorem` 重新定制定理环境
- 使用 `ctex` 提供的命令重新定制目录样式
- 使用 LaTeX3 语法重构封面绘制命令 - [#52]
- 使用 LaTeX3 语法重构摘要绘制命令 - [#52]

### 移除

- 移除封面个人信息设置项
  - `info/titlea`
  - `info/titleb`
  - `info/titlec`
- 移除内部调用的宏包
  - `amsthm`
  - `listings`
  - `microtype`
  - `thmtools`
  - `tocloft`

## [0.12.0] - 2021-11-30

### 变动

- 将内置的 `njuvisual` 分离为独立宏包 - [#44]
- 隐式加载 `xparse` 包

### 杂项

- 仿照 `fduthesis` 重新组织仓库的目录结构

### 杂项

- 优化 GitHub Actions 脚本
- 新增自动安装脚本
- 手册封面添加校徽水印

## [0.11.3] - 2021-11-23

### 杂项

- 仓库中提供 TeXstudio 配置文件

## [0.11.1] - 2021-10-23

### 新增

- 对依赖的宏包进行版本检测

## [0.11.0] - 2021-10-01

### 新增

- 新增成果列表命令 `\njupaperlist`
- 将文档信息写入 PDF 元数据

### 变动

- 使用小写字母加连字符的形式重命名个人信息选项

## [0.10.0] - 2021-09-24

### 新增

- 将校名校徽图片内置化
  - 使用 `njuvisual.sty` 储存 Tikz 图形

### 修复

- 修复 LuaLaTeX 编译后 PDF 书签不正确的问题 - [#14]

### 变动

## [0.9.0] - 2021-09-15

### 新增

- 使用 DocStrip 合并项目源代码

### 变动

<!-- 以下版本较为陈旧，已被完全重构 -->

## 0.3.0 -> [0.8.4] - 2021-09-12

### 新增

- 以 [NJU Thesis 2021] 为基础构建了初步可用的模板。
  - 实现了本科生毕业论文或设计模板
  - 实现了研究生学位论文模板

### 杂项

- 通过 GitHub Actions 实现了自动测试和打包发布
- 模板上传至 CTAN


[unreleased]: https://github.com/nju-lug/NJUThesis/compare/v0.16.1...HEAD
[0.16.1]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.16.1
[0.16.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.16.0
[0.15.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.15.0
[0.14.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.14.0
[0.13.1]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.13.1
[0.13.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.13.0
[0.12.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.12.0
[0.11.3]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.11.3
[0.11.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.11.0
[0.10.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.10.0
[0.9.0]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.9.0
[0.8.4]: https://github.com/nju-lug/NJUThesis/releases/tag/v0.8.4

[#14]: https://github.com/nju-lug/NJUThesis/issues/14
[#44]: https://github.com/nju-lug/NJUThesis/issues/44
[#46]: https://github.com/nju-lug/NJUThesis/issues/46
[#52]: https://github.com/nju-lug/NJUThesis/issues/52
[#60]: https://github.com/nju-lug/NJUThesis/issues/60
[#61]: https://github.com/nju-lug/NJUThesis/issues/61
[#64]: https://github.com/nju-lug/NJUThesis/issues/64
[#66]: https://github.com/nju-lug/NJUThesis/issues/66
[#71]: https://github.com/nju-lug/NJUThesis/discussions/71
[#79]: https://github.com/nju-lug/NJUThesis/issues/79
[#85]: https://github.com/nju-lug/NJUThesis/discussions/85
[#89]: https://github.com/nju-lug/NJUThesis/discussions/89
[#92]: https://github.com/nju-lug/NJUThesis/issues/92
[#98]: https://github.com/nju-lug/NJUThesis/issues/98
[#99]: https://github.com/nju-lug/NJUThesis/discussions/99
[#105]: https://github.com/nju-lug/NJUThesis/discussions/105
[#107]: https://github.com/nju-lug/NJUThesis/issues/107

[更新日志]: https://keepachangelog.com/zh-CN/1.0.0/
[语义化版本]: https://semver.org/lang/zh-CN/
[南大 TeX]: https://tex.nju.edu.cn/
[NJU Thesis 2021]: https://github.com/FengChendian/NJUThesis2021

[@zepinglee]: https://github.com/zepinglee
[@hushidong]: https://github.com/hushidong
[@zhoujian9410]: https://github.com/zhoujian9410
