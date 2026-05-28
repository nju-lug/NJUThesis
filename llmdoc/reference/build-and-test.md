# 构建与测试

## 构建工具

- 通过 `build.lua` 使用 `l3build`。
- `module = "njuthesis"`。
- 源文件位于 `source/`，主源为 `njuthesis.dtx`。Logo PDF（`nju-emblem-*.pdf`、`nju-name-*.pdf`）同样列为源文件，并在 `build.lua` 中声明为 `binaryfiles`。
- 安装目标为生成的 `.cls`、`.def` 和 logo PDF。
- 手册排版使用 XeLaTeX，解包使用 XeTeX。
- check 引擎为 `xetex` 和 `luatex`。

## 常用命令

- `l3build unpack` — 仅解包生成 cls/def 文件。
- `l3build install` — 解包并安装到本地 TeX 树，供本地测试。
- `l3build check -e xetex <test-name>` — 运行指定回归测试。
- `l3build ctan` — 创建 CTAN 发布包（内部会先运行 `l3build check`）。

## 本地检查

- 编辑类或接口后，先 `l3build install` 再编译测试文件。
- 对 l3keys、选项解析等可通过日志检查的行为，以 `.lvt`/`.tlg` 对添加 `l3build` 回归测试到 `test/`。
- 涉及版式、参考文献、类选项、字体、封面、摘要、声明页的修改，至少编译 `test/` 下对应的变体文件。
- 发布/打包变更需检查 `.github/workflows/release.yml`，确认 CTAN 和用户 zip 内容物正确。

## 编译引擎

- 用户文档应能在 XeLaTeX 或 LuaLaTeX 下编译。
- README 推荐 `latexmk -xelatex` 编译示例模板。
- CI 当前编译选定的 XeLaTeX 测试；LuaLaTeX 测试虽存在但在 `.github/workflows/build.yml` 中被注释。

## 回归测试

测试文件完整清单参见 `reference/file-map.md`。

## CI 构建模型

- 构建 CI 在 `master` 分支的 push 和 PR 时触发。
- 从 CTAN 镜像安装 TeX Live，安装 `xetex` 和 `l3build`。
- 通过 `scripts/download.sh` 和 `scripts/main.py` 计算并安装依赖闭包。
- 先运行 `l3build check -e xetex`（基于日志的回归测试），再编译文档测试文件。
- 上传 `build/unpacked/` 下的生成文件作为 CI 产物。

## 发布模型

- 发布 CI 在 `v*` tag 时触发。
- 安装额外字体并从源码安装最新 `ctex`。
- 运行 `l3build ctan` 生成 CTAN zip 和手册 PDF。
- **注意**：`l3build ctan` 内部调用 `l3build check`，因此发布流程的依赖闭包必须包含完整 `njuthesis.cls` 编译期依赖。发布流程的 `scripts/main.py` 不得排除 `njuthesis.cls`（构建流程排除 `njuthesis-doc.cls` 是可以的，但发布流程排除 `njuthesis.cls` 会导致 `l3build check` 静默失败）。
- 将 `template/` 和 `build/unpacked/` 内容移入发布暂存区，生成用户 zip。

## 失败诊断

- 构建和发布流程在失败时（`if: failure()`）通过 `actions/upload-artifact@v7` 上传 `build/test`（发布流程额外上传 `build/test-testfiles`），保存编译日志和 PDF 供调试，无需本地复现。
- 排查构建失败时，依次检查：TeX Live 安装 → `l3build install` → 依赖安装 → 测试编译。
- 如果包依赖发生变化，检查 `scripts/file_parser.py`、`scripts/main.py` 和 workflow 中的 `PACKAGES` 种子。

## 依赖分析

- `scripts/file_parser.py` 从 TeX/Lua 文件中提取文档类、宏包、字体和 Lua 模块依赖。
- `scripts/main.py` 使用下载的 tlpdb 数据和递归依赖 JSON 将文件映射到 TeX Live 包。
- CI 传递额外的包种子以覆盖已知需求。
- `--exclude` 标志从依赖闭包计算中排除文件。

## 注意事项

- 不要依赖 `build/` 或 `mythesis/` 为最新状态，除非刚在当前流程中重新生成。
