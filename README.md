# NJU Thesis

[![njuthesis](https://img.shields.io/badge/njuthesis-latex-blue)](https://git.nju.edu.cn/nju-lug/nju-latex-templates)
[![overleaf](https://img.shields.io/badge/overleaf-supported-brightgreen)](https://tex.nju.edu.cn)
![build status](https://github.com/nju-lug/NJUThesisUndergraduate/actions/workflows/build.yml/badge.svg)

> 此项目是基于[NJU thesis 2021](https://github.com/FengChendian/NJUThesis2021)的重构版本，目前**正在重构中**。

原来的[NJU thesis 2021](https://github.com/FengChendian/NJUThesis2021)模板太过古老并且不支持硕士、博士论文，目前难以维护，因此为了模板的可持续发展，现在将对该项目进行重构，项目将被挂载于[NJU-LUG](https://github.com/nju-lug)组织仓库下。

相关文档请参见[本项目wiki](https://github.com/nju-lug/NJUThesisUndergraduate/wiki)。

## 快速开始

### 本地编译

1. 安装TexLive或者MikTex最新版
2. 下载[模板全部文件](https://github.com/nju-lug/NJUThesisUndergraduate/archive/refs/heads/master.zip)
3. 根据需要更改`njuthesis.tex`文件中的内容
4. 在模板根目录下运行`latexmk -xelatex`编译文件，得到对应的PDF

#### **关于本地编译**

- 模板支持`latexmk`、`XeLaTex`、`LuaLaTex`三种编译方式
- 如果使用`latexmk`，请务必使用完整的命令`latexmk -xelatex`以免产生不必要的问题
- 如果使用`XeLaTex`或`LuaLaTex`，需要按照`XeLaTex/LuaLaTex` -> `biber` -> `XeLaTex/LuaLaTex` -> `XeLaTex/LuaLaTex`的顺序编译四次
- 仓库中.vscode附带一份VScode的Latex WorkShop的配置文件，可根据需要使用

### 南大Tex编译

1. 下载[模板全部文件](https://github.com/nju-lug/NJUThesisUndergraduate/archive/refs/heads/master.zip)
2. 解压后将所有文件按照原目录结构上传至南大Tex（GitHub相关文件可不上传），上传后`njuthesis.tex`、`njuthesis.cls`等文件应在根目录，目录结构如下所示：

    ```bash
    │  njuthesis.bib
    │  njuthesis.cls
    │  njuthesis.tex
    │
    ├─figure
    │      njulogo-eps-converted-to.pdf
    │      njulogo.eps
    │      njuname-eps-converted-to.pdf
    │      njuname.eps
    │
    └─profile
        │  format.tex
        │  packages.tex
        │  profile.cls
        │
        └─format
                abstract.tex
                caption.tex
                cover.tex
                font.tex
                page.tex
    ```

3. 在南大Tex项目内页面左上角的`Menu`中，将编译器改为`LuaLatex`
4. 编写tex文件

### 其他

请参见[使用说明](https://github.com/nju-lug/NJUThesisUndergraduate/wiki/%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E)。

## 常见问题

请参见[常见问题](https://github.com/nju-lug/NJUThesisUndergraduate/wiki/%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)。

## TODO

- [x] 主要代码转为Latex3，使用expl3宏包
- [x] 基于CTex宏集重构所有页面以符合学校论文要求
- [x] Github Action自动化构建预览PDF
- [x] 完善文档
- [ ] CTAN发布宏包
  