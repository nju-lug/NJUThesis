# biblatex 载入与补丁时序

## 目标

`njuthesis` 默认管理参考文献方案，使用 `biblatex` 和 `biblatex-gb7714-2015`。当前设计同时支持两条路径：

1. 普通用户不手动载入 `biblatex`，模板在导言区末尾自动载入。
2. 需要补丁的用户在 `\njusetup[bib]{...}` 后手动 `\usepackage{biblatex}`，模板设置仍自动接入，用户随后可以写自己的补丁。

`biblatex=false` 是完全退出 njuthesis 参考文献集成的开关：不注册相关 hooks，不定义临时 `\addbibresource`，不自动载入 `biblatex`。

## 内部数据流

- `\g_@@_blx_style_clist`：保存 `bib/style` 转换得到的加载期样式选项，如 `style = gb7714-2015ay`。
- `\g_@@_blx_option_clist`：保存 `bib/option` 中可在 `biblatex` 载入后执行的选项。
- `\g_@@_blx_resource_clist`：保存 `bib/resource` 和临时 `\addbibresource` 收集到的资源文件列表。

`bib/resource` 接受 clist；真实 `\addbibresource` 只接受单个文件名。因此 post setup 中必须 map：

```tex
\clist_map_inline:Nn \g_@@_blx_resource_clist { \addbibresource {##1} }
```

不要把 `bib/resource` 实现成对真实 `\addbibresource` 的一对一转发。

## Hook 时序

当 `biblatex=true` 时，类加载期注册三个 LaTeX 内核 hooks：

- `package / biblatex / before`：执行 `\@@_blx_pre_setup:`。该阶段释放模板临时定义的 `\addbibresource`，并用 `\PassOptionsToPackage` 传入 `\g_@@_blx_style_clist`。
- `package / biblatex / after`：执行 `\@@_blx_post_setup:`。该阶段用 `\ExecuteBibliographyOptions` 执行 `\g_@@_blx_option_clist`，设置默认 bibliography heading，并导入资源文件。
- `env / document / before`：后备执行 `\RequirePackage { biblatex }`。如果用户已手动载入 `biblatex`，LaTeX 的包加载机制不会重复读包。

`package/<pkg>/before` 和 `package/<pkg>/after` 是 one-time package hooks，适合挂接用户手动载入或模板后备载入这两种路径。不要回退到 `file/biblatex.sty/before|after`，后者是更底层的文件读取 hook，语义不如 package hook 精确。

## 用户补丁边界

推荐用户顺序：

```tex
\njusetup[bib]{...}
\usepackage{biblatex}
% 用户补丁
```

这让模板先收集并传递样式、选项和资源，再让用户在 `biblatex` 已可用后定制 driver、field format 或字体等细节。

如果用户必须提前写补丁，建议使用：

```tex
\AddToHook{package/biblatex/after}{...}
```

不要承诺在 `biblatex` 已经加载后再调用 `\njusetup[bib]{...}` 仍能完整实时生效；当前实现的清晰边界是 `\njusetup[bib]` 先于手动 `\usepackage{biblatex}`。
