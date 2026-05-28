# 盲审模式机制

`anonymous` 类选项和 `anonymous-mode/no-nju` 设置键如何去除盲审敏感内容。

## anonymous 类选项

`anonymous` 是类选项。选项解析期间设置 `\g_@@_opt_anon_bool`。若选项激活，类将字面组名 `anonymous` 添加到 `\g_@@_keys_excl_clist`；`\njusetup` 通过项目包装器路由到 `l3keys`，使分组键值可被过滤。

这防止后续用户设置文件重新引入盲审中应隐藏的字段。

## 声明页

盲审模式始终禁用声明页。由于封面 hook 重构后声明页在论文类型 `.def` 文件加载时注册到 hooks 中，必须在 `.def` 加载前清除 `decl-page`——具体时序约束和代码参见 `cover-hook-option-timing.md`。

本科声明页的直接紫色校徽不会造成盲审泄露：当盲审模式清除 `decl-page` 后，声明页根本不会注册到封面 body 中。

## 个人信息

`anonymous` 激活时，类用匿名占位符替换选定的作者和导师字段：

```tex
author        = \@@_name:n { anonymous a },
author*       = \@@_name:n { anonymous a },
supervisor    = { \@@_name:n { anonymous a }, \@@_name:n { anonymous b } },
supervisor*   = { \@@_name:n { anonymous c } \@@_quad: \@@_name:n { anonymous a } },
supervisor-ii = ,
supervisor-ii* =
```

其他元数据键值通过 `memory/decisions/2026-05-02-filtered-key-groups.md` 中描述的分组键值过滤机制保护。

## 论文列表与致谢

盲审模式重定向输出命令，而非要求每个调用点手动分支：

- `\@@_paperlist:nn` 变为 `\@@_paperlist_anon:nn`
- `\@@_acknowledgement:n` 变为 `\@@_acknowledgement_anon:n`
- PDF 作者元数据被清除

这使盲审行为集中管理。

## anonymous-mode/no-nju 隐藏学校信息

`anonymous-mode/no-nju` 是设置键而非类选项。仅当两个布尔值同时为 true 时生效：

```tex
\bool_lazy_and:nnT
  { \g_@@_opt_anon_bool } { \g_@@_opt_nonju_bool }
  { ... }
```

在导言区结束时，类清除学校名称和代码，并抑制 logo 辅助命令：

```tex
\tl_clear:N  \l_@@_name_nju_tl
\tl_clear:N  \l_@@_name_nju_en_tl
\tl_gclear:N \g_@@_info_code_tl
\cs_gset_eq:NN \@@_logo_emblem:n \use_none:n
\cs_gset_eq:NN \@@_logo_name:n   \use_none:n
```

重定义 `:n` 便利层足以覆盖普通封面 logo 调用点，因为 `\@@_logo_emblem:` 和 `\@@_logo_name:` 都通过 `:n` 分发。

## 维护注意事项

- 在 `\njusetup` 包装路径中保持盲审过滤。原始 `\keys_set:nn` 调用绕过分组过滤，仅应在有意如此时使用。
- 若未来页面直接使用 `\@@_logo_emblem:Nn`，需检查该页面是否可能在盲审模式下存在。直接基础辅助命令不受 `anonymous-mode/no-nju` 影响；当前本科声明页用法安全，因为盲审模式禁用声明页。
