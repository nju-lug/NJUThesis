# NJU Thesis: 南京大学学位论文 LaTeX 模板

[![njuthesis](https://img.shields.io/badge/njuthesis-latex-blue)](https://git.nju.edu.cn/nju-lug/nju-latex-templates)
[![overleaf](https://img.shields.io/badge/overleaf-supported-brightgreen)](https://tex.nju.edu.cn)
![build status](https://github.com/nju-lug/NJUThesis/actions/workflows/build.yml/badge.svg)
[![CTAN](https://img.shields.io/ctan/v/njuthesis.svg)](https://www.ctan.org/pkg/njuthesis)
[![GitHub release](https://img.shields.io/github/release/nju-lug/NJUThesis/all.svg)](https://github.com/nju-lug/NJUThesis/releases/latest)

> 此项目是基于 [NJU thesis 2021](https://github.com/FengChendian/NJUThesis2021) 的重构版本，目前本科生及研究生版本**已经重构完成**。
> 然而，研究生院并未提供完善的规定，部分格式来自于本科生院。**如果院系另有要求，请提交 issue**。

本模板基于本科生院的论文撰写规范制作，同时参考研究生院提供的硕士、博士学位材料包，用于生成符合南京大学排版要求和相应的国家规范、行业标准的学位论文，力求通过 LaTeX3 语法实现清晰的实现逻辑、较高的可定制性以及友好的用户接口。目前 [`njuthesis`](https://ctan.org/pkg/njuthesis) 文档类已发布在 CTAN。

## 快速开始

请首先阅读[用户手册](http://mirrors.ctan.org/macros/unicodetex/latex/njuthesis/njuthesis.pdf)，其中详尽阐述了模板的特性和使用方法。

对于普通用户，首要推荐使用下述的**南大TeX编译方法**。

### 南大 TeX 编译

[南大 TeX](https://tex.nju.edu.cn) 是 [eScience 中心](https://sci.nju.edu.cn)为南大在校师生提供的在线 TeX 编译平台，已*安装有本模板的最新版*。在*2022年春节更新*后，只需在**创建新项目**菜单中选择**论文模板**即可开始写作。

### 本地编译

请使用包管理器安装 `njuthesis` 和 `njuvisual` 的最新版。

新手同学不妨直接使用以下流程：

1. [从南大镜像站下载](https://mirror.nju.edu.cn/download/app/TeX%20%E6%8E%92%E7%89%88%E7%B3%BB%E7%BB%9F)并安装最新的 TeX 发行版，并更新所有宏包
2. 下载包含[模板全部文件](https://github.com/nju-lug/NJUThesis/releases/latest)的压缩包 `njuthesis-user-v*.zip`
3. 根据需要更改 `njuthesis-sample.tex` 文件中的内容
4. 在模板根目录下运行 `latexmk -xelatex` 运行编译，得到对应的 PDF 文件

### 典型结构

```
\documentclass{njuthesis}
\njusetup{}
\begin{document}
\maketitle
\tableofcontents
\mainmatter
\chapter{欢迎}
使用 \LaTeX{}！
\printbibliography
\end{document}
```

## 常见问题

请参见[本项目 Wiki](https://github.com/nju-lug/NJUThesis/wiki)。

## 贡献

如果你发现了模板的问题，欢迎在 GitHub 中提交 [issue](https://github.com/nju-lug/NJUThesis/issues) 或者 [PR](https://github.com/nju-lug/NJUThesis/pulls)。

## 许可

本模板的发布遵守 [LaTeX Project Public License（版本 1.3c 或更高）](https://www.latex-project.org/lppl/lppl-1-3c/)。

