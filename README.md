# NJU Thesis

[![njuthesis](https://img.shields.io/badge/njuthesis-latex-blue)](https://git.nju.edu.cn/nju-lug/nju-latex-templates)
[![overleaf](https://img.shields.io/badge/overleaf-supported-brightgreen)](https://tex.nju.edu.cn)
![build status](https://github.com/nju-lug/NJUThesis/actions/workflows/build.yml/badge.svg)
[![CTAN](https://img.shields.io/ctan/v/njuthesis.svg)](https://www.ctan.org/pkg/njuthesis)
[![GitHub release](https://img.shields.io/github/release/nju-lug/NJUThesis/all.svg)](https://github.com/nju-lug/NJUThesis/releases/latest)

> 此项目是基于[NJU thesis 2021](https://github.com/FengChendian/NJUThesis2021)的重构版本，目前本科生及研究生版本**已经基本重构完成**。
> 然而，研究生院并未提供完善的规定，部分格式来自于本科生院。**如果院系另有要求，请提交issue**。

原来的[NJU thesis 2021](https://github.com/FengChendian/NJUThesis2021)模板太过古老并且不支持硕士、博士论文，目前难以维护，因此为了模板的可持续发展，现在将对该项目进行重构，项目挂载于[NJU-LUG](https://github.com/nju-lug)组织仓库下，目前已[发布在CTAN](https://ctan.org/pkg/njuthesis)。

相关文档请参见[本项目wiki](https://github.com/nju-lug/NJUThesis/wiki)。

## 快速开始

请首先阅读 [Releases](https://github.com/nju-lug/NJUThesis/releases/latest) 中附带的 `njuthesis.pdf` ，这份说明文档详尽阐述了模板的特性和使用方法。

对于普通用户，推荐使用下述的**南大TeX编译方法**。

### 本地编译

1. [从南大镜像站下载](https://mirror.nju.edu.cn/download/app/TeX%20%E6%8E%92%E7%89%88%E7%B3%BB%E7%BB%9F)并安装最新的TeX发行版（推荐MiKTeX），并更新所有宏包
2. 下载包含[模板全部文件](https://github.com/nju-lug/NJUThesis/releases/latest)的压缩包`njuthesis.zip`
3. 根据需要更改`njuthesis-sample.tex`文件中的内容
4. 在模板根目录下运行`latexmk`运行编译，得到对应的PDF文件

#### 关于本地编译

- 模板支持`latexmk`、`xelatex`、`lualatex`三种编译方式
- 如果使用`latexmk`，请务必使用完整的命令`latexmk -xelatex`以免产生不必要的问题
- 如果使用`xelatex`或`lualatex`，需要按照`xelatex/lualatex` -> `biber` -> `xelatex/lualatex` -> `xelatex/lualatex`的顺序编译四次
- 仓库中`.vscode`附带一份VScode的LaTeX WorkShop的配置文件，可根据需要使用

### [南大TeX](https://tex.nju.edu.cn)编译

[南大TeX](https://tex.nju.edu.cn)是eScience中心为南大在校师生提供的在线LaTeX编译平台，已*预置本模板*。只需参考`njuthesis-sample.tex`新建文档，在项目内页面左上角的`Menu`中，将编译器改为`XeLaTeX`或`LuaLaTeX`即可编写论文，不必上传`.cls`等格式文件。

#### 上传模板的方法（不推荐）

如果希望对模板格式进行修改，或者南大TeX安装的版本未及时更新错误补丁，也可以自行上传本模板进行在线写作。

1. 下载包含[模板全部文件](https://github.com/nju-lug/NJUThesis/releases/latest)的压缩包`njuthesis.zip`
2. 登录[南大TeX](https://tex.nju.edu.cn)，点击New Project -> Upload Project上传刚刚得到的压缩包，上传后`njuthesis-sample.tex`、`njuthesis.cls`等文件应在根目录，0.10.0以后的目录结构如下所示：

    ```shell
    NJUThesis/
    │
    │ njuthesis-sample.bib
    │ njuthesis-sample.tex
    │ njuthesis.cls
    │ njuvisual.sty
    ```

3. 在南大TeX项目内页面左上角的`Menu`中，将编译器改为`XeLaTeX`或`LuaLaTeX`
4. 编写TeX文档

### 关于DocStrip文件

从0.9.0版以后，本模板以DocStrip(`.dtx`)格式进行维护。常规的`.cls`和`.sty`格式文件可从Releases页面下载或使用以下方法提取。我们只建议有经验的同学使用这一文件。

DocStrip格式合并了LaTeX源代码和说明文档，更有利于宏包的发布。要使用该文件，请在当前工作目录下打开终端：

- 输入`xetex njuthesis.dtx`以提取宏包内容
- 输入`latexmk njuthesis.dtx`以生成并查看内置的文档

请注意，由于文件重名原因，项目中的示例论文模板已被重命名为`njuthesis-sample.tex`。

## 常见问题

请参见[常见问题](https://github.com/nju-lug/NJUThesis/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)。

## 贡献

如果你发现了模板的问题，欢迎在 Github 中提交 [issue](https://github.com/nju-lug/NJUThesis/issues)或者 [PR](https://github.com/nju-lug/NJUThesis/pulls。

## 许可

本模板的发布遵守 [LaTeX Project Public License（版本 1.3c 或更高）](https://www.latex-project.org/lppl/lppl-1-3c/)。

