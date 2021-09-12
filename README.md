# NJU Thesis

[![njuthesis](https://img.shields.io/badge/njuthesis-latex-blue)](https://git.nju.edu.cn/nju-lug/nju-latex-templates)
[![overleaf](https://img.shields.io/badge/overleaf-supported-brightgreen)](https://tex.nju.edu.cn)
![build status](https://github.com/nju-lug/NJUThesis/actions/workflows/build.yml/badge.svg)

> 此项目是基于[NJU thesis 2021](https://github.com/FengChendian/NJUThesis2021)的重构版本，目前本科生版本**已经基本重构完成**，硕博论文**正在**根据研究生院的文件重构，但研究生院的规定并不完善，因此部分格式可能会参考本科的，**如果院系另有要求，请自行修改或者提交issue**。

原来的[NJU thesis 2021](https://github.com/FengChendian/NJUThesis2021)模板太过古老并且不支持硕士、博士论文，目前难以维护，因此为了模板的可持续发展，现在将对该项目进行重构，项目挂载于[NJU-LUG](https://github.com/nju-lug)组织仓库下，目前已[发布在CTAN](https://ctan.org/pkg/njuthesis)。

相关文档请参见[本项目wiki](https://github.com/nju-lug/NJUThesis/wiki)。

## 快速开始

### 本地编译

1. 推荐[从南大镜像站下载](https://mirror.nju.edu.cn/download/app/TeX%20%E6%8E%92%E7%89%88%E7%B3%BB%E7%BB%9F)并安装TeXLive或者MiKTeX最新版
2. 下载[模板全部文件](https://github.com/nju-lug/NJUThesis/releases/latest)
3. 根据需要更改`njuthesis.tex`文件中的内容
4. 在模板根目录下运行`latexmk -xelatex`编译文件，得到对应的PDF

#### **关于本地编译**

- 模板支持`latexmk`、`xelatex`、`lualatex`三种编译方式
- 如果使用`latexmk`，请务必使用完整的命令`latexmk -xelatex`以免产生不必要的问题
- 如果使用`xelatex`或`lualatex`，需要按照`xelatex/lualatex` -> `biber` -> `xelatex/lualatex` -> `xelatex/lualatex`的顺序编译四次
- 仓库中`.vscode`附带一份VScode的LaTeX WorkShop的配置文件，可根据需要使用

### [南大TeX](https://tex.nju.edu.cn)编译

1. 下载[模板全部文件](https://github.com/nju-lug/NJUThesis/releases/latest)
2. 登录[南大TeX](https://tex.nju.edu.cn)，点击New Project -> Upload Project上传刚刚得到的zip文件，上传后`njuthesis.tex`、`njuthesis.cls`等文件应在根目录，目录结构如下所示：

    ```bash
    NJUThesis-master/
    │
    ├─figure/
    │   njulogo.pdf
    │   njuname.pdf
    │
    ├─profile/
    │   abstract.sty
    │   components.sty
    │   cover.sty
    │   font.sty
    │   packages.sty
    │   page.sty
    │   reference.sty
    │
    │ njuthesis.bib
    │ njuthesis.cls
    │ njuthesis.tex
    ```

3. 在南大TeX项目内页面左上角的`Menu`中，将编译器改为`XeLaTeX`
4. 编写tex文档

### 其他

更多内容请参见项目Wiki中的[使用说明](https://github.com/nju-lug/NJUThesis/wiki/%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E)。

你也可以下载[Release](https://github.com/nju-lug/NJUThesis/releases/latest)中附带的`njuthesis.pdf`，里面详尽阐述了模板的特性和使用方法。

## 常见问题

请参见[常见问题](https://github.com/nju-lug/NJUThesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)。

## 贡献

如果你发现了模板的问题，欢迎在Github中[提交issue](https://github.com/nju-lug/NJUThesis/issues)或者PR。

## 许可

本模板的发布遵守 LaTeX Project Public License（版本 1.3c 或更高）。
