# NJU Thesis

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

## TODO

- [x] 主要代码转为Latex3，使用expl3宏包
- [ ] 基于CTex宏集重构所有页面以符合学校论文要求
- [x] Github Action自动化构建预览PDF
- [ ] 完善文档
- [ ] CTAN发布宏包
  