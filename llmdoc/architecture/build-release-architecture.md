# 构建与发布架构

构建和发布流程以 `l3build` 为中心。本地通过 `build.lua` 配置解包、安装、检查和 CTAN 打包；CI 在两阶段（回归测试→文档编译）中运行，依赖闭包由 `scripts/file_parser.py` 和 `scripts/main.py` 通过 tlpdb 计算。

具体命令、本地检查清单和测试文件列表参见 `reference/build-and-test.md`，文件清单参见 `reference/file-map.md`。

## CI 流水线

```
push/PR → TeX Live 安装 → l3build install → 依赖闭包安装
       → l3build check (XeTeX 回归测试)
       → 编译文档测试文件 (test/)
       → 上传 build/unpacked/ 产物
```

发布流水线（`v*` tag）额外安装字体和最新 ctex，运行 `l3build ctan` 生成 CTAN zip 和手册 PDF，并从 `template/` + `build/unpacked/` 组装用户 zip。

## `l3build ctan` 隐藏耦合

`l3build ctan` 文档记载为打包命令，但其内部会先调用 `l3build check` 运行回归测试。这意味着发布流程的依赖闭包必须包含完整的 `njuthesis.cls` 编译期依赖，即使发布本身只输出解包产物和 PDF。

因此发布流程的 `scripts/main.py` **不得**排除 `njuthesis.cls`。（构建流程排除 `njuthesis-doc.cls` 是安全的——该文件仅用于手册排版。）

历史上曾因发布流程排除了 `njuthesis.cls`，导致 `l3build check` 因缺失依赖而静默失败，且无可检查的诊断产物。此约束是在该事故后确立的（参见 `memory/reflections/2026-05-14-ci-deps-and-debugging.md`）。

## 依赖分析

`scripts/file_parser.py` 从 TeX/Lua 文件中提取文档类、宏包、字体和 Lua 模块依赖。`scripts/main.py` 使用下载的 tlpdb 数据和递归依赖 JSON 将文件映射到 TeX Live 包。CI 通过 `PACKAGES` 种子变量传递额外的已知需求。

`--exclude` 标志从依赖闭包计算中排除文件：构建流程排除 `njuthesis-doc.cls`，发布流程不得排除 `njuthesis.cls`。

## 失败诊断

构建和发布流程在 `if: failure()` 时通过 `actions/upload-artifact@v7` 上传 `build/test`（发布流程额外上传 `build/test-testfiles`），保存编译日志和 PDF 供调试 CI 回归，无需本地复现。
