# 文件地图

## 源文件（规范来源）

- `source/njuthesis.dtx` — 规范源文件和用户手册。实现代码、手册正文、docstrip guard、文档类代码、生成的 def 文件区段和文档类均在此文件。
- `source/latexmkrc` — 文档编译的 latexmk 配置。
- `source/nju-emblem-black.pdf`、`source/nju-emblem-purple.pdf` — NJU 校徽 logo（黑/紫）。
- `source/nju-name-black.pdf`、`source/nju-name-purple.pdf` — NJU 校名 logo（黑/紫）。

## 构建配置

- `build.lua` — l3build 配置：解包、安装、检查、CTAN 打包。
- `test/config-biblatex.lua` — biblatex 专用 l3build 配置；使用 `test/biblatex` 下的 `.tex` 测试文件，复制同目录 `.bib` 支持文件，并在第一轮 LaTeX 后运行 Biber。

## 模板与示例

- `template/njuthesis-sample.tex` — 官方空白模板。
- `template/njuthesis-setup.def` — 官方空白配置文件。
- `template/njuthesis-sample.bib` — 示例参考文献。
- `examples/` — 非核心典型用法示例（定制附加页面、声明页处理等），属参考性质，非通用模板接口。

## 测试

- `test/test-xetex-undergraduate.tex` — 本科 XeLaTeX 变体。
- `test/test-xetex-graduate.tex` — 研究生 XeLaTeX 变体。
- `test/test-xetex-graduate-nlcover.tex` — 研究生国家图书馆封面。
- `test/test-luatex.tex` — LuaLaTeX 变体。
- `test/test.tex` — 共享测试正文。
- `test/chapters/` — 测试章节内容。
- `test/*.png`、`test/test.bib` — 测试素材和参考文献。
- `test/biblatex/biblatex-options.tex` — biblatex 选项/样式/资源的完整编译回归测试，编译后执行 `\printbibliography`。
- `test/biblatex/biblatex-options.bib` — `biblatex-options` 测试使用的独立参考文献数据库。
- `test/biblatex/biblatex-options.tlg` — `l3build save -c test/config-biblatex biblatex-options` 生成的对照输出。

## 脚本

- `scripts/download.sh` — 下载并校验 TeX Live 包数据库。
- `scripts/main.py` — 计算并安装依赖闭包。
- `scripts/file_parser.py` — 解析 TeX/Lua 依赖声明。
- `scripts/generate-img.*`、`scripts/generate-img.tex` — 图片生成辅助素材。

## CI/CD

- `.github/workflows/build.yml` — 构建/测试流程。
- `.github/workflows/release.yml` — tag 发布流程。
- `.github/workflows/texlive.profile` — TeX Live 安装 profile。
- `.github/ISSUE_TEMPLATE/` — issue 表单。
- `.github/CODE_OF_CONDUCT.md` — 行为准则。

## 根目录文件

- `README.md` — 中文项目说明和用户快速入门。
- `README-CTAN.md` — CTAN 英文说明。
- `CHANGELOG.md` — 发布历史和未发布变更。
- `LICENSE` — LPPL 许可证。
- `install-unix.sh`、`install-win.bat` — 创建本地示例工作区。
- `.editorconfig`、`.gitignore`、`.vscode/settings.json` — 编辑器/仓库配置。

## 生成/二次文件（非规范来源）

以下文件由 dtx 生成或在编译过程中产生，不应作为主要编辑目标：

- `build/` — l3build 输出。
- `mythesis/njuthesis.cls`、`mythesis/*.def` — 从 dtx 生成。
- `mythesis/*.aux`、`*.bbl`、`*.bcf`、`*.blg`、`*.fdb_latexmk`、`*.fls`、`*.log`、`*.out`、`*.run.xml`、`*.thm`、`*.toc`、`*.xdv`、`*.pdf` — 编译输出或示例工作区产物。
- `test/biblatex/*.aux`、`test/biblatex/*.bcf`、`test/biblatex/*.blg`、`test/biblatex/*.fdb_latexmk`、`test/biblatex/*.fls`、`test/biblatex/*.log`、`test/biblatex/*.out`、`test/biblatex/*.run.xml`、`test/biblatex/*.thm`、`test/biblatex/*.xdv` — biblatex 回归测试的本地编译产物，不是规范输入。
