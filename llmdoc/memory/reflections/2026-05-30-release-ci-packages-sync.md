---
name: release-ci-packages-sync
description: release.yml PACKAGES 种子未与 build.yml 同步导致 l3build ctan 缺包失败
metadata:
  type: reflection
---

## 问题

commit `5195689` 新增 `test/option-usage.lvt`，通过类默认加载 `cleveref`。`build.yml` 的 `PACKAGES` 已含 `cleveref`，但 `release.yml` 没有。`l3build ctan` 内部调用 `l3build check`，运行全部 `.lvt` 测试，release CI 缺 `cleveref.sty` 而报错。

## 根因

两个 workflow 各自维护独立的 `PACKAGES` 环境变量，没有共享机制。新增测试依赖时只更新了 `build.yml`。

## 修复

将 `release.yml` 的 `PACKAGES` 与 `build.yml` 取并集。

## 教训

添加测试文件或类新增间接依赖时，必须同时检查 `build.yml` 和 `release.yml` 的 `PACKAGES` 列表。
