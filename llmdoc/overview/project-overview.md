# 项目概览

`njuthesis` 是南京大学本科、硕士、博士和博士后论文的 LaTeX 文档类。

文档类以编码学校排版要求和相关国标为目标，同时提供用户层键值接口。主体实现用 LaTeX3 编写，与用户手册共存于同一个 dtx 文件中。

完整的目录和文件清单参见 `reference/file-map.md`。

## 用户路径

1. 安装当前 TeX 发行版。
2. 使用发布版用户 zip 或 NJU 在线 TeX 平台。
3. 编辑 `njuthesis-sample.tex` 和 `njuthesis-setup.def`。
4. 用 XeLaTeX 或 LuaLaTeX 编译，通常通过 `latexmk -xelatex`。

## 维护者路径

1. 编辑 `source/njuthesis.dtx`。
2. 用 `l3build` 解包/安装/检查。
3. 保持示例和测试与用户层变更对齐。
4. 由 CI 从规范源打包生成产物。

## 技术栈

- LaTeX3（expl3）编程层
- `ctexbook` 文档类基类
- `l3keys` 键值接口
- `xtemplate` 页面/元素原型系统
- LaTeX hooks 机制
- docstrip 文档/代码分离
- l3build 构建/测试/发布
