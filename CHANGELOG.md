# njuthesis 修订记录

本项目发生的变动均会记录于本文档。

本文档格式来自《[更新日志]》，本项目使用《[语义化版本]》标记版本号。

## [未发布]

## [1.4.2] - 2024-11-08

### 新增

- 图表标题区分单行多行设置
- 软性规定标题和图表本身的位置关系 -[#253]

### 修复

- 修复 `macoffice` 配置的变量命名问题

### 变动

- `tableofcontents/toc-entry` 不再会影响插图清单和表格清单 -[#245]

## [1.4.1] - 2024-04-22

### 新增

- 匹配新版盲审模板 - [#185]
  - 作者和导师姓名用占位符代替
  - 默认显示学校信息
  - 恢复显示摘要页的年级
  - 成果列表中仅显示期刊和年份
  - `anonymous` 选项不接受输入值
- 盲审模式可选择是否隐藏学校信息 - [#251]
  - 新增 `anonymous-mode/no-nju` 选项

### 修复

- 修复成果列表中文姓名加粗的问题 - [#192]
- 修复 LuaLaTeX 下华文中宋的载入问题
- 修复 LuaLaTeX 下的摘要页多余换行 - [#248]

## [1.4.0] - 2024-03-19

### 新增

- 增加 `macoffice` 字体配置 - [#164],[#169]
  - 感谢 [@liudongmiao]！

### 修复

- 修复定理类环境在共享计数器时的 `cleveref` 引用名问题 - [#234]
- 将部分 `hyperref` 默认设置项放在导言区前以便用户覆盖
- 修正 `tabularray` 默认标题间距
- 修复本科生诚信承诺书的换行问题
- 修复导师名和职称之间没有空格的问题 - [#243]
- 使用正确的变量类型 - [#240],[#243]
  - 感谢 [@muzimuzhi]！
- 匹配 l3doc 的修改 - [CTeX-org/ctex-kit#700], [CTeX-org/ctex-kit#703]
- `draft` 选项不接受输入值

### 杂项

- 跟进 2024 届本科毕业论文规定
- 美化 issue template 样式 - [#241]
  - 感谢 [@muzimuzhi]！

## [1.3.2] - 2023-12-05

### 变动

- 调整专业型学位封面的 `info/major` 项填写逻辑 - [#232]
  - 感谢 [@liudongmiao]！

### 修复

- 修复双导师命令问题 - [#230]

## [1.3.1] - 2023-11-14

### 新增

- 整合表格环境字体设置 - [#94]
- 可以手动指定华文中宋文件位置 - [#229]
- 匹配 LaTeX3 的 e 型展开修改 - [CTeX-org/ctex-kit#678]

### 修复

- 修复英文标题超长引发的页面元素混乱 - [#217]
- 修复英文标题手动换行与摘要页的冲突 - [#227]

### 杂项

- 将 CI 上传的 PDF 更换为模板格式文件

## [1.3.0] - 2023-06-06

### 新增

- 新增定理类环境共享计数器选项 `theorem/share-counter` - [#207]
- 自动补全研究生专业型学位封面上的专业信息 - [#208]
  - 增加 `info/major` 定义方式

### 修复

- 修复批量创建环境时缺少 `\crefname` 的问题 - [#206]
- 修复禁用 `unicode-math` 时仍会配置数学字体的问题 - [#216]
- 修复非研究生类型时调用 `nl-cover` 选项的错误
- 将本科生封面信息恢复至 v1.1 的宋体格式
- 修复研究生出版授权书的打勾机制 - [#223]

### 杂项

- 手册源码部分添加语法高亮
- 手册样式设置拆分为单独的 `njuthesis-doc.cls`
- 默认密级信息修改为“公开” - [#213]
- 使用 [`tl-depend-analysis`] 重构 CI 脚本
  - 感谢 [@stone-zeng]！

## [1.2.1] - 2023-05-03

### 修复

- 修复国家图书馆封面学位丢失的学位名称 - [#204]
  - 新增研究生中文学位名称选项 `info/degree` - [#200]
- 修复研究生封面上学号下划线长度不足的问题

### 杂项

- 提供紫色版本的校名校徽图片

## [1.2.0] - 2023-05-02

### 新增

- 跟进 2023 年研究生学位论文模板新设计 - [#204]
- 新增研究生英文学位名称选项 `info/degree*` - [#200]
- 新增研究生英文摘要条目内容下划线选项 `abstract/underline` - [#202]

### 修复

- 更正本科生模板封面和承诺书样式
- 盲审模式下隐藏年级和学校名称 - [#181]
- 修复章末参考文献表与成果列表的冲突问题 - [#191]

## [1.1.2] - 2023-01-15

### 修复

- 补回研究生英文摘要页的下划线 - [#166]
- 修复研究生封面上第二导师的显示问题 - [#172]
- 修复 `\njusetname` 的可选参数问题

### 变动

- 本科生模板封面校徽居中 - [#173]

### 杂项

- 跟进 2023 届本科毕业论文规定
- 跟进新版南大 TeX 网站

## [1.1.1] - 2022-12-04

### 修复

- 修复研究生封面上导师信息的居中问题 - [#165]
- 修复 macOS 下 Times New Roman 字体缺失字型的问题 - [#169]
  - 感谢 [@AlphaZTX]！
- 修复国家图书馆封面的编译死循环问题 - [#170]

### 杂项

- 手册中暂时撤去关于南大 TeX 网站的内容

## [1.1.0] - 2022-10-23

### 新增

- 盲审模式下不显示致谢
- 新增脚注圈码选项 `footnote/circled` 和 `footnote/circled*` - [#129]
- 新增脚注的悬挂缩进选项 `hang` - [#129]

### 修复

- 修复国家图书馆封面的编译错误
- 修复研究生英文封面的学位信息
- 更正盲审模式隐藏的个人信息类别
- 修复 `\le` 和 `\ge` 的定义

### 变动

- 脚注默认进行悬挂缩进

### 杂项

- 手册中以黄色突出选项

## [1.0.0] - 2022-08-07

### 新增

- 新增博士后出站报告模板
- 新增数学字体选项 `math-font`
- 新增默认字号选项 `zihao`
- 新增行距选项 `linespread`
- 新增最小化模式选项 `minimal`
- 新增禁用若干内置宏包的选项
- `\njusetup` 提供更多选项输入模式
- 可为目录中的章标题添加引导线 - [#66]
- 新增编号连接符设置 `label-sep` - [#134]
- 适配 `tabularray` 的表格样式设置 - [#134]
- 新增一系列数学符号选项 `math` - [#142]
- 可使用 `\njusetlength` 修改下划线的宽度和偏移 - [#155]
- 可使用 `\njusetformat` 修改本科摘要标签格式 - [#155]
- 为页面对象添加书签属性

### 修复

- 修正元素对象的底部间距设置

### 变动

- 调整 `type` 和 `degree` 文档类选项的定义 - [#117]
- 移除毕业设计封面
- `nlcover` 选项更名为 `nl-cover`
- `blind` 选项更名为 `anonymous`
- 调整定理类环境选项 `theorem`
- 摘要、目录、页眉页脚设置项更名
- 调整研究生模板的封面布局 - [#144]
- 移除研究生英文摘要的下划线
- 移除内置的 `mathtools`
- 内部变量与函数重新命名

### 杂项

- 删除手册中的基础教学内容
- 在手册中以不同颜色指示不同模块

## [0.20.0] - 2022-06-10

### 新增

- 日期设置项可以通过留空生成空白的年月日字样 - [#150]
- 自动处理大于四的评审委员会人数 - [#150]
- 可使用 `\njusetformat` 修改页眉页脚样式
- 可使用 `\njusetformat` 修改内置校名校徽颜色

### 修复

- 修复 0.19.0 版本中错误的研究生英文封面日期
- 修复 0.19.0 版本中错误的本科生目录条目样式
- 修复英文关键词列表不整齐的缩进间距
- 更正本科模板部分字样

## [0.19.0] - 2022-05-23

### 新增

- 可使用 `\njusetformat` 修改默认页面样式
- 对封面上的超宽文字进行压缩
  - 支持专硕封面的特殊标签格式 - [#147]
- 跟进新版本科生诚信承诺书样式
- 国家图书馆样式更新
  - 添加学位授予日期设置项 `info/confer-date` - [#150]
  - 添加底部日期设置项 `info/bottom-date`

### 修复

- 图表标题使用粗体 -[#139]
- 修复成果列表与章末参考文献表的冲突 -[#148]

### 变动

- 将国家图书馆封面的标题字样修改为“学位论文”
- 将国家图书馆封面的评审委员会人数分离为单独参数
- 更正研究生模板普通封面上学硕和专硕不同的专业名称字样

### 杂项
- 修正文档笔误 - [#137]
  - 感谢 [@note286]！

## [0.18.0] - 2022-05-01

### 新增

- 新增内置定理环境的若干设置项 - [#50]
- 新增脚注设置项 - [#129]
  - 编号可使用带圈数字
- 新增盲审模式 - [#130]

### 修复

- 正确生成出版授权书前后的空白页
- 删除出版授权书页的页眉 - [#130]
- 出版授权书内双导师姓名之间添加空格 - [#130]
- 设置4、5级标题的样式

### 变动

- 微调校名校徽尺寸

### 杂项

- 说明手册中补充数学符号格式说明

## [0.17.0] - 2022-04-09

### 新增

- 提供修改固定文本的接口 - [#111]
- 提供修改长度值的接口 - [#121]
- 提供修改默认样式的接口
- 提供研究生的学位论文出版授权书 - [#116]

### 优化

- 优化封面标题的断行方式 - [#121]
- PDF 书签中不显示额外空格

### 杂项

- 说明手册中补充扫描声明页的插入方法 - [#96]
- 说明手册中增加“额外定制”一节
- 说明手册中补充页眉说明 - [#119]
- 说明手册跟进 TeX Live 2022

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


[未发布]: https://github.com/nju-lug/NJUThesis/compare/v1.4.2...HEAD

[1.4.2]: https://github.com/nju-lug/NJUThesis/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/nju-lug/NJUThesis/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/nju-lug/NJUThesis/compare/v1.3.2...v1.4.0
[1.3.2]: https://github.com/nju-lug/NJUThesis/compare/v1.3.1...v1.3.2
[1.3.1]: https://github.com/nju-lug/NJUThesis/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/nju-lug/NJUThesis/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/nju-lug/NJUThesis/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/nju-lug/NJUThesis/compare/v1.1.2...v1.2.0
[1.1.2]: https://github.com/nju-lug/NJUThesis/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/nju-lug/NJUThesis/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/nju-lug/NJUThesis/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/nju-lug/NJUThesis/compare/v0.20.0...v1.0.0

[0.20.0]: https://github.com/nju-lug/NJUThesis/compare/v0.19.0...v0.20.0
[0.19.0]: https://github.com/nju-lug/NJUThesis/compare/v0.18.0...v0.19.0
[0.18.0]: https://github.com/nju-lug/NJUThesis/compare/v0.17.0...v0.18.0
[0.17.0]: https://github.com/nju-lug/NJUThesis/compare/v0.16.0...v0.17.0
[0.16.1]: https://github.com/nju-lug/NJUThesis/compare/v0.16.0...v0.16.1
[0.16.0]: https://github.com/nju-lug/NJUThesis/compare/v0.15.0...v0.16.0
[0.15.0]: https://github.com/nju-lug/NJUThesis/compare/v0.14.0...v0.15.0
[0.14.0]: https://github.com/nju-lug/NJUThesis/compare/v0.13.1...v0.14.0
[0.13.1]: https://github.com/nju-lug/NJUThesis/compare/v0.13.0...v0.13.1
[0.13.0]: https://github.com/nju-lug/NJUThesis/compare/v0.12.0...v0.13.0
[0.12.0]: https://github.com/nju-lug/NJUThesis/compare/v0.11.3...v0.12.0
[0.11.3]: https://github.com/nju-lug/NJUThesis/compare/v0.11.0...v0.11.3
[0.11.0]: https://github.com/nju-lug/NJUThesis/compare/v0.10.0...v0.11.0
[0.10.0]: https://github.com/nju-lug/NJUThesis/compare/v0.9.0...v0.10.0
[0.9.0]:  https://github.com/nju-lug/NJUThesis/compare/v0.8.4...v0.9.0
[0.8.4]:  https://github.com/nju-lug/NJUThesis/compare/v0.3.0...v0.8.4

[#14]:  https://github.com/nju-lug/NJUThesis/issues/14
[#44]:  https://github.com/nju-lug/NJUThesis/issues/44
[#46]:  https://github.com/nju-lug/NJUThesis/issues/46
[#50]:  https://github.com/nju-lug/NJUThesis/issues/50
[#52]:  https://github.com/nju-lug/NJUThesis/issues/52
[#60]:  https://github.com/nju-lug/NJUThesis/issues/60
[#61]:  https://github.com/nju-lug/NJUThesis/issues/61
[#64]:  https://github.com/nju-lug/NJUThesis/issues/64
[#66]:  https://github.com/nju-lug/NJUThesis/issues/66
[#71]:  https://github.com/nju-lug/NJUThesis/discussions/71
[#79]:  https://github.com/nju-lug/NJUThesis/issues/79
[#85]:  https://github.com/nju-lug/NJUThesis/discussions/85
[#89]:  https://github.com/nju-lug/NJUThesis/discussions/89
[#92]:  https://github.com/nju-lug/NJUThesis/issues/92
[#94]:  https://github.com/nju-lug/NJUThesis/discussions/94
[#96]:  https://github.com/nju-lug/NJUThesis/issues/96
[#98]:  https://github.com/nju-lug/NJUThesis/issues/98
[#99]:  https://github.com/nju-lug/NJUThesis/discussions/99
[#105]: https://github.com/nju-lug/NJUThesis/discussions/105
[#107]: https://github.com/nju-lug/NJUThesis/issues/107
[#111]: https://github.com/nju-lug/NJUThesis/issues/111
[#116]: https://github.com/nju-lug/NJUThesis/issues/116
[#117]: https://github.com/nju-lug/NJUThesis/issues/117
[#119]: https://github.com/nju-lug/NJUThesis/issues/119
[#121]: https://github.com/nju-lug/NJUThesis/issues/121
[#129]: https://github.com/nju-lug/NJUThesis/issues/129
[#130]: https://github.com/nju-lug/NJUThesis/issues/130
[#131]: https://github.com/nju-lug/NJUThesis/issues/131
[#134]: https://github.com/nju-lug/NJUThesis/discussions/134
[#137]: https://github.com/nju-lug/NJUThesis/issues/137
[#139]: https://github.com/nju-lug/NJUThesis/discussions/139
[#142]: https://github.com/nju-lug/NJUThesis/issues/142
[#144]: https://github.com/nju-lug/NJUThesis/issues/144
[#147]: https://github.com/nju-lug/NJUThesis/discussions/147
[#148]: https://github.com/nju-lug/NJUThesis/issues/148
[#150]: https://github.com/nju-lug/NJUThesis/discussions/150
[#155]: https://github.com/nju-lug/NJUThesis/discussions/155
[#164]: https://github.com/nju-lug/NJUThesis/issues/164
[#165]: https://github.com/nju-lug/NJUThesis/discussions/165
[#166]: https://github.com/nju-lug/NJUThesis/discussions/166
[#169]: https://github.com/nju-lug/NJUThesis/issues/169
[#170]: https://github.com/nju-lug/NJUThesis/issues/170
[#172]: https://github.com/nju-lug/NJUThesis/issues/172
[#173]: https://github.com/nju-lug/NJUThesis/issues/173
[#181]: https://github.com/nju-lug/NJUThesis/issues/181
[#191]: https://github.com/nju-lug/NJUThesis/issues/191
[#192]: https://github.com/nju-lug/NJUThesis/discussions/192
[#200]: https://github.com/nju-lug/NJUThesis/discussions/200
[#202]: https://github.com/nju-lug/NJUThesis/discussions/202
[#204]: https://github.com/nju-lug/NJUThesis/issues/204
[#206]: https://github.com/nju-lug/NJUThesis/issues/206
[#207]: https://github.com/nju-lug/NJUThesis/issues/207
[#208]: https://github.com/nju-lug/NJUThesis/issues/208
[#213]: https://github.com/nju-lug/NJUThesis/issues/213
[#216]: https://github.com/nju-lug/NJUThesis/issues/216
[#217]: https://github.com/nju-lug/NJUThesis/issues/217
[#223]: https://github.com/nju-lug/NJUThesis/issues/223
[#227]: https://github.com/nju-lug/NJUThesis/issues/227
[#229]: https://github.com/nju-lug/NJUThesis/discussions/229
[#230]: https://github.com/nju-lug/NJUThesis/issues/230
[#232]: https://github.com/nju-lug/NJUThesis/issues/232
[#234]: https://github.com/nju-lug/NJUThesis/issues/234
[#243]: https://github.com/nju-lug/NJUThesis/issues/243
[#245]: https://github.com/nju-lug/NJUThesis/discussions/245
[#248]: https://github.com/nju-lug/NJUThesis/issues/248
[#251]: https://github.com/nju-lug/NJUThesis/discussions/251
[#253]: https://github.com/nju-lug/NJUThesis/pull/253

[CTeX-org/ctex-kit#678]: https://github.com/CTeX-org/ctex-kit/pull/678
[CTeX-org/ctex-kit#700]: https://github.com/CTeX-org/ctex-kit/pull/700
[CTeX-org/ctex-kit#703]: https://github.com/CTeX-org/ctex-kit/pull/703

[更新日志]: https://keepachangelog.com/zh-CN/1.0.0/
[语义化版本]: https://semver.org/lang/zh-CN/
[南大 TeX]: https://tex.nju.edu.cn/
[NJU Thesis 2021]: https://github.com/FengChendian/NJUThesis2021
[`tl-depend-analysis`]: https://github.com/stone-zeng/tl-depend-analysis/

[@zepinglee]: https://github.com/zepinglee
[@hushidong]: https://github.com/hushidong
[@zhoujian9410]: https://github.com/zhoujian9410
[@note286]: https://github.com/note286
[@AlphaZTX]: https://github.com/AlphaZTX
[@stone-zeng]: https://github.com/stone-zeng
[@liudongmiao]: https://github.com/liudongmiao
[@muzimuzhi]: https://github.com/muzimuzhi
