%%
%% This is file `njuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% njuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2021 by Nanjing University Linux User Group <nju.lug@yaoge123.cn>
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.3 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through XeTeX.
%% 
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
 \GetIdInfo  $Id: njuthesis.dtx 0.9.0 2021-09-15 12:00:00 +0800  NJU LUG <nju.lug@yaoge123.cn> $
  {Thesis template for Nanjing University}
\ProvidesExplClass{\ExplFileName}{\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\LoadClass[
  a4paper,
  twoside,
  UTF8,
  scheme=chinese,
  linespread=1.625,
  fontset=none,
  zihao=-4
  ]{ctexbook}[2018/04/01]
\RequirePackage{l3keys2e}
\tl_new:N \l__nju_info_degree_tl
\tl_new:N \l__nju_info_type_tl
\keys_define:nn { nju }
{
  nlcover           .bool_set:N   =   \nju_nl_cover,
  nlcover           .initial:n    =   false,
}
\keys_define:nn { nju }
{
  degree            .choices:nn   =
  { ug, mg, mg, phd }
  { \tl_set_eq:NN \l__nju_info_degree_tl \l_keys_choice_tl },
  type              .choices:nn   =
  { thesis, design }
  { \tl_set_eq:NN \l__nju_info_type_tl   \l_keys_choice_tl },
}
\keys_define:nn { nju }
{
  info.meta:nn = { nju / info } { #1 }
}
\keys_define:nn { nju / info }
{
  TitleA            .tl_set:N     =   \l__nju_info_title_a_tl,
  TitleB            .tl_set:N     =   \l__nju_info_title_b_tl,
  TitleC            .tl_set:N     =   \l__nju_info_title_c_tl,
  Title*            .tl_set:N     =   \l__nju_info_title_en_tl,
}
\keys_define:nn { nju / info }
{
  Grade             .tl_set:N     =   \l__nju_info_grade_tl,
  StudentID         .tl_set:N     =   \l__nju_info_id_tl,
  StudentName       .tl_set:N     =   \l__nju_info_author_tl,
  StudentName*      .tl_set:N     =   \l__nju_info_author_en_tl,
}
\keys_define:nn { nju / info }
{
  Department        .tl_set:N     =   \l__nju_info_dept_tl,
  Department*       .tl_set:N     =   \l__nju_info_dept_en_tl,
  Major             .tl_set:N     =   \l__nju_major_tl,
  Major*            .tl_set:N     =   \l__nju_major_en_tl,
  Field             .tl_set:N     =   \l__nju_field_tl,
  Field*            .tl_set:N     =   \l__nju_field_en_tl,
}
\keys_define:nn { nju / info }
{
  SupervisorA       .tl_set:N     =   \l__nju_info_supv_a_tl,
  SupervisorA*      .tl_set:N     =   \l__nju_info_supv_a_en_tl,
  SupervisorATitle  .tl_set:N     =   \l__nju_info_supv_a_title_tl,
  SupervisorATitle* .tl_set:N     =   \l__nju_info_supv_a_title_en_tl,
}
\keys_define:nn { nju / info }
{
  SupervisorB       .tl_set:N     =   \l__nju_info_supv_b_tl,
  SupervisorB*      .tl_set:N     =   \l__nju_info_supv_b_en_tl,
  SupervisorBTitle  .tl_set:N     =   \l__nju_info_supv_b_title_tl,
  SupervisorBTitle* .tl_set:N     =   \l__nju_info_supv_b_title_en_tl,
}
\keys_define:nn { nju / info }
{
  SubmitDate        .tl_set:N     =   \l__nju_submit_date_tl,
}
\keys_define:nn { nju / info }
{
  DefendDate        .tl_set:N     =   \l__nju_defend_date_tl,
  ReviewerChairman  .tl_set:N     =   \l__nju_info_chairman_tl,
  ReviewerA         .tl_set:N     =   \l__nju_info_reviewer_a_tl,
  ReviewerB         .tl_set:N     =   \l__nju_info_reviewer_b_tl,
  ReviewerC         .tl_set:N     =   \l__nju_info_reviewer_c_tl,
  ReviewerD         .tl_set:N     =   \l__nju_info_reviewer_d_tl,
}
\keys_define:nn { nju / info }
{
  Classification    .tl_set:N     =   \l__nju_info_classif_tl,
  SecurityLevel     .tl_set:N     =   \l__nju_info_seclv_tl,
  UDC               .tl_set:N     =   \l__nju_info_udc_tl,
  SupervisorContact .tl_set:N     =   \l__nju_info_supv_cont_tl,
}
\NewDocumentCommand \njusetup { m }
{ \keys_set:nn { nju } { #1 } }
\RequirePackage[
    top=2.5cm,
    bottom=2.5cm,
    left=3.2cm,
    right=3.2cm
]{geometry}
\RequirePackage{xparse}
\RequirePackage{titletoc} % 修改目录内标题格式
\RequirePackage[hyphens]{url} % generate better linebreaks in the url
\RequirePackage{dashundergaps}
\RequirePackage{setspace}
\RequirePackage{lastpage}
\RequirePackage{emptypage} % 清除空白页的页码
\RequirePackage{listings} % 代码环境
\RequirePackage{enumitem} % 用于修改列表环境
\RequirePackage{caption}
\RequirePackage{floatrow} % 用于图表等页面元素的定位
\RequirePackage{booktabs} % 用于绘制三线表
\RequirePackage{multirow} % Cells occupying multiple rows in tables
\RequirePackage{multicol} % Multiple columns in dictionary
\RequirePackage{siunitx} % 用于书写单位符号
\RequirePackage[version=4]{mhchem} % 用于绘制分子式
\RequirePackage{hologo}

\sys_if_engine_xetex:T
{
    \RequirePackage{microtype}

    % 加中文下划线，不能用于lualatex
    \RequirePackage{xeCJKfntef}
    \cs_new:Npn \nju_underline:n #1 {\CJKunderline{#1}}
}
\sys_if_engine_luatex:T{
    % 加中文下划线
    \RequirePackage{lua-ul}
    \cs_new:Npn \nju_underline:n #1 {\underLine{#1}}

    % emoji支持
    % \RequirePackage{emoji}
    % \setemojifont{Segoe~UI~Emoji} % windows
    % \setemojifont{Apple~Color~Emoji} % macos
    % \setemojifont{Noto~Color~Emoji}
    % For windows.
    % Shipped with the best `grinning-face-with-sweat' support.
}
\RequirePackage{blindtext}
\RequirePackage{zhlipsum}
\RequirePackage{amsmath} % Must be loaded before unicode-math
\RequirePackage{amsthm} % Mathematical environments
\RequirePackage{mathtools} % Mathematical tools to use with amsmath
\RequirePackage{thmtools} % Theorem styles
\RequirePackage[
    warnings-off={% 消除与mathtools合用产生的警告
        mathtools-colon,
        mathtools-overbracket}
        ]{unicode-math} % Math fonts in xetex or luatex
\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
\graphicspath{{figure/}} % 图片路径
\RequirePackage{wrapfig} % Wrap text around figures
\RequirePackage[hidelinks,bookmarksnumbered=true]{hyperref}
\RequirePackage[capitalise,nameinlink,noabbrev]{cleveref}
\RequirePackage{fontspec}
\tl_new:N \g__nju_latin_fontset_tl
\tl_new:N \g__nju_cjk_fontset_tl
\keys_define:nn { nju }
{
  customlatinfont   .choices:nn   =
  { gyre, macos, windows, null }
  { \tl_set_eq:NN \g__nju_latin_fontset_tl \l_keys_choice_tl },
  customchinesefont .choices:nn   =
  { fandol, founder, macos, noto, windows, null }
  { \tl_set_eq:NN \g__nju_cjk_fontset_tl   \l_keys_choice_tl },
}
\ProcessKeysOptions { nju }
\bool_new:N \g__nju_load_system_fontset_tl
\tl_if_empty:NTF \g__nju_latin_fontset_tl
  { \bool_gset_true:N \g__nju_load_system_fontset_tl }
{
  \tl_if_empty:NT \g__nju_cjk_fontset_tl
    { \bool_gset_true:N \g__nju_load_system_fontset_tl }
}
\bool_if:NT \g__nju_load_system_fontset_tl
{
  % 检测是否是 Windows
  \sys_if_platform_windows:TF
  {
    \tl_set:Nn \g__nju_latin_fontset_tl { windows }
    \tl_set:Nn \g__nju_cjk_fontset_tl   { windows }
  }
  {
    % 检测是否是 macOS
    \ctex_if_platform_macos:TF
    {
      \tl_set:Nn \g__nju_latin_fontset_tl { macos }
      \tl_set:Nn \g__nju_cjk_fontset_tl   { macos }
    }
    % 其余系统一律使用自由字体
    {
      \tl_set:Nn \g__nju_latin_fontset_tl { gyre }
      \tl_set:Nn \g__nju_cjk_fontset_tl { fandol }
    }
  }
}
\cs_new_protected:Npn \__nju_load_latin_font_windows:
{
  \setmainfont{Times~New~Roman}
  \setsansfont{Arial}
  \setmonofont{Courier~New}[Scale=MatchLowercase]
}
\cs_new_protected:Npn \__nju_load_latin_font_macos:
{
\setmainfont{Times~New~Roman}
\setsansfont{Arial}
\setmonofont{Menlo}[Scale=MatchLowercase]
}
\cs_new_protected:Npn \__nju_load_latin_font_gyre:
{
\setmainfont{texgyretermes}[
  Extension=.otf,
  UprightFont=*-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic]
\setsansfont{texgyreheros}[
  Extension=.otf,
  UprightFont=*-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic]
\setmonofont{texgyrecursor}[
  Extension=.otf,
  UprightFont=*-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic,
  Scale=MatchLowercase,
  Ligatures=CommonOff]
}
\cs_new_protected:Npn \__nju_load_cjk_font_windows:
{
  \setCJKmainfont{SimSun}[
    AutoFakeBold=2.17,
    ItalicFont=KaiTi]
  \setCJKsansfont{SimHei}
  \setCJKmonofont{FangSong}
  \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.17]
  \setCJKfamilyfont{zhhei}{SimHei}
  \setCJKfamilyfont{zhfs}{FangSong}
  \setCJKfamilyfont{zhkai}{KaiTi}[AutoFakeBold=2.17]
  \setCJKfamilyfont{zhnewhei}{Microsoft~YaHei}[
    BoldFont=Microsoft~YaHei~Bold]
}
\cs_new_protected:Npn \__nju_load_cjk_font_macos:
{
\msg_redirect_name:nnn {fontspec} {no-script} {info}
\setCJKmainfont{Songti~SC~Light}[
  BoldFont=Songti~SC~Bold,
  ItalicFont=Kaiti~SC,
  BoldItalicFont=Kaiti~SC~Bold]
\setCJKsansfont{Heiti~SC~Light}[BoldFont=Heiti~SC~Medium]
\setCJKmonofont{STFangsong}
\setCJKfamilyfont{zhsong}{Songti~SC~Light}[BoldFont=Songti~SC~Bold]
\setCJKfamilyfont{zhhei}{Heiti~SC~Light}[BoldFont=Heiti~SC~Medium]
\setCJKfamilyfont{zhfs}{STFangsong}
\setCJKfamilyfont{zhkai}{Kaiti~SC}
  [
    BoldFont=Kaiti~SC~Bold,
    % 参考CTeX手册第9节 LuaLATEX 下的中文支持方式
    % AlternateFont =
    %   {
    %   {⟨character range1⟩} {⟨alternate font name1⟩}
    %   {⟨alternate font features2⟩} ,
    %   ......
    %   }
  ]
\setCJKfamilyfont{zhnewhei}{PingFang~SC}
}
\cs_new_protected:Npn \__nju_load_cjk_font_fandol:
{
\msg_redirect_name:nnn {fontspec} {no-script} {info}
\setCJKmainfont{FandolSong-Regular}[
  Extension=.otf,
  BoldFont=FandolSong-Bold,
  ItalicFont=FandolKai-Regular]
\setCJKsansfont{FandolHei-Regular}[
  Extension=.otf,
  BoldFont=FandolHei-Bold]
\setCJKmonofont{FandolFang-Regular}[Extension=.otf]
\setCJKfamilyfont{zhsong}{FandolSong-Regular}[
  Extension=.otf,
  BoldFont=FandolSong-Bold]
\setCJKfamilyfont{zhhei}{FandolHei-Regular}[
  Extension=.otf,
  BoldFont=FandolHei-Bold]
\setCJKfamilyfont{zhfs}{FandolFang-Regular}[Extension=.otf]
\setCJKfamilyfont{zhkai}{FandolKai-Regular}[
  Extension=.otf,
  AutoFakeBold=2.17]
}
\cs_new_protected:Npn \__nju_load_cjk_font_founder:
{
\setCJKmainfont{FZSSK}[% 方正书宋
  Extension=.ttf,
  BoldFont=FZXBSK,% 方正小标宋
  ItalicFont=FZKTK]% 方正楷体
\setCJKsansfont{FZXH1K}[% 方正细黑一
  Extension=.ttf,
  BoldFont=FZHTK]% FZHTK 方正黑体
\setCJKmonofont{FZFSK}[Extension=.ttf]% 方正仿宋
\setCJKfamilyfont{zhsong}
  {FZSSK}[
    Extension=.ttf,
    BoldFont=FZXBSK]
\setCJKfamilyfont{zhhei}
  {FZHTK}[
    Extension=.ttf,
    AutoFakeBold=2.17]
\setCJKfamilyfont{zhfs}
  {FZFSK}[Extension=.ttf]
\setCJKfamilyfont{zhkai}
  {FZKTK}[Extension=.ttf]
\setCJKfamilyfont{zhnewhei}
  {FZYouHK_508R}[% 方正悠黑508R
    Extension=.ttf,
    BoldFont=FZYouHK_511M]% 方正悠黑511M
}
\cs_new_protected:Npn \__nju_load_cjk_font_noto:
{
\setCJKmainfont[
  UprightFont=NotoSerifCJKsc-Regular,
  BoldFont=NotoSerifCJKsc-Bold,
  ItalicFont=NotoSerifCJKsc-Regular,
  BoldItalicFont=NotoSerifCJKsc-Bold,
  ItalicFeatures=FakeSlant,
  BoldItalicFeatures=FakeSlant]{Noto~Serif~CJK~SC}

\setCJKsansfont[
  UprightFont=NotoSansCJKsc-Regular,
  BoldFont=NotoSansCJKsc-Bold,
  ItalicFont=NotoSansCJKsc-Regular,
  BoldItalicFont=NotoSansCJKsc-Bold,
  ItalicFeatures=FakeSlant,
  BoldItalicFeatures=FakeSlant]{Noto~Sans~CJK~SC}

\setCJKmonofont[
  UprightFont=NotoSansMonoCJKsc-Regular,
  BoldFont=NotoSansMonoCJKsc-Bold,
  ItalicFont=NotoSansMonoCJKsc-Regular,
  BoldItalicFont=NotoSansMonoCJKsc-Bold,
  ItalicFeatures=FakeSlant,
  BoldItalicFeatures=FakeSlant]{Noto~Sans~Mono~SC}

\setCJKfamilyfont{zhsong}{Noto~Serif~CJK~SC}
\setCJKfamilyfont{zhhei}{Noto~Sans~CJK~SC}
\setCJKfamilyfont{zhfs}{方正仿宋简体}[AutoFakeBold=2.17]
\setCJKfamilyfont{zhkai}{方正楷体简体}[AutoFakeBold=2.17]
}
\cs_new_protected:Npn \__nju_load_font:
{
  \use:c { __nju_load_latin_font_ \g__nju_latin_fontset_tl : }
  \use:c { __nju_load_cjk_font_   \g__nju_cjk_fontset_tl   : }

  \NewDocumentCommand\songti{}{\CJKfamily{zhsong}}
  \NewDocumentCommand\heiti{}{\CJKfamily{zhhei}}
  \NewDocumentCommand\fangsong{}{\CJKfamily{zhfs}}
  \NewDocumentCommand\kaishu{}{\CJKfamily{zhkai}}
}
\__nju_load_font:
\setmathfont{XITSMath-Regular}[
  BoldFont = XITSMath-Bold,
  Extension = .otf]
\RequirePackage{fancyhdr} % 调整页眉页脚
\fancypagestyle{njuplain}{%
   \fancyhead{}
   \fancyfoot[C]{\zihao{5}\thepage} % 页脚居中 五号新罗马体数字
}
\fancypagestyle{njuheadings}{%
   \fancyhead{}
   \fancyfoot[C]{\zihao{5}\thepage}
}
\str_if_eq:NNTF {\l__nju_info_degree_tl} { ug }
{
  % the header line
  \tl_set:Nn \headrulewidth {0pt}
  % the footer line
  \tl_set:Nn \footrulewidth {0pt}

  \AtBeginDocument{\pagestyle{njuplain}} % 本科无页眉页脚
}
{
  % the header line
  \tl_set:Nn \headrulewidth {1pt}
  % the footer line
  \tl_set:Nn \footrulewidth {0pt}

  % \AtBeginDocument{\pagestyle{njuplain}} % 无页眉页脚
  \AtBeginDocument{\pagestyle{headings}} % 研究生有页眉页脚
}
\ctexset{
    contentsname = 目录,
    listfigurename = 插图清单,
    listtablename = 表格清单,
    chapter/format = \zihao{4}\heiti\centering,
    chapter/beforeskip = 10pt,
    chapter/afterskip = 60pt,
    section/format = \zihao{4}\heiti\raggedright,
    subsection/format = \zihao{4}\heiti\raggedright,
    subsubsection/format = \zihao{4}\heiti\raggedright
}

\titlecontents{chapter}% 标题级别
                [5em]% 标题左间距
                {\heiti\zihao{4}\vspace{10pt}}% 标题格式
                {\contentslabel{4em}}% 标题标志
                {\hspace*{-4em}}% 无序号标题
                {~\titlerule*[0.6pc]{$.$}~\contentspage}% 指引线与页码

                \titlecontents{section}
                [5em]
                {\zihao{-4}\vspace{0pt}}
                {\contentslabel{2.5em}}
                {\hspace*{-4em}}
                {~\titlerule*[0.6pc]{$.$}~\contentspage}

\titlecontents{subsection}
                [8em]
                {\zihao{-4}\vspace{0pt}}
                {\contentslabel{3em}}
                {\hspace*{-4em}}
                {~\titlerule*[0.6pc]{$.$}~\contentspage}
\cs_set:Npn \CTEX@addtocline #1#2
{
  \addcontentsline { toc } {#1}
  { \use:c { CTEX@#1@tocline } {#1} {#2} }
}
\cs_new:Npn \nju_tocpagestyle:nnn #1 #2 #3
{
  \newpage
  \hspace{0pt}
  \vskip 10pt
  \begin{center}
    \mbox{\songti\bf\zihao{3}{#1}} % 目录页面标题
    \phantomsection
    \addcontentsline{toc}{chapter}{#2} % 插入目录
  \end{center}
  \vskip 40pt
  \@starttoc{#3}%
  \cleardoublepage
}
\tl_set:Nn \tableofcontents
{
  \nju_tocpagestyle:nnn {目\hspace{2em}录}{\contentsname}{toc}
}
\tl_set:Nn \listoffigures
{
  \nju_tocpagestyle:nnn {\listfigurename}{\listfigurename}{lof}
}
\tl_set:Nn \listoftables
{
  \nju_tocpagestyle:nnn {\listtablename}{\listtablename}{lot}
}
\NewDocumentEnvironment{preface}{}
{%
  \chapter*{前言}
  \addcontentsline{toc}{chapter}{前言}
}{}
\NewDocumentEnvironment{acknowledgement}{}
{%
  \chapter*{致谢}
  \addcontentsline{toc}{chapter}{致谢}
}{}
\RequirePackage[
    style=gb7714-2015,
    %style=numeric-comp,
    %citestyle=authortitle-icomp,
    % citestyle=numeric-comp,
    %bibstyle=authoryear,
    % bibstyle=numeric,
    sorting=none,
    %sorting=nyt,
    %sortcites=true,
    %autocite=footnote,
    backend=biber, % Compile the bibliography with biber
    hyperref=true,
    backref=false,
    citecounter=true,
    pagetracker=true,
    citetracker=true,
    ibidtracker=context,
    autopunct=true,
    autocite=plain,
    % gbpub=false,         % Uncomment if you do NOT want '[S.l. : s.n.]'
                           % in reference entries, GitHub Issue (#47)
    % gbnamefmt=lowercase, % Uncomment if you do NOT want uppercase author
                           % names in reference entries, GitHub Issue (#23)
]{biblatex}
\AtEveryBibitem{
\clearfield{abstract}
\clearfield{issn}
\clearfield{isbn}
\clearfield{archivePrefix}
\clearfield{arxivId}
\clearfield{pmid}
\clearfield{eprint}
\ifentrytype{online}{}{\ifentrytype{misc}{}{\clearfield{url}}}
}
\crefdefaultlabelformat{#2#1#3\,} % 默认在名称后面添加空格

\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefformat{equation}{公式~#2#1#3~} % 删除公式编号的括号

\crefformat{chapter}{第#2#1#3章}
\crefformat{section}{第~#2#1#3~节}
\crefformat{subsection}{第~#2#1#3~小节}
\crefformat{subsubsection}{第~#2#1#3~小节}
\crefname{appendix}{附录}{附录}

\floatsetup[lstlisting]{ % Captions for lstlistings
capposition=above,%
margins=centering,%
floatwidth=\textwidth%
}
\floatsetup[figure]{ % Captions for figures
capposition=bottom,%
margins=centering,%
floatwidth=\textwidth%
}
\floatsetup[table]{ % Captions for tables
capposition=above,%
margins=centering,%
floatwidth=\textwidth%
}
\lstset{
basicstyle=\ttfamily\linespread{1}\small\selectfont,
    keywordstyle=\bfseries,% use bold style for keywords
    commentstyle=\rmfamily\itshape,% use italic style for comments
    stringstyle=\ttfamily,% 字符串风格
    flexiblecolumns,% ?
    numbers=left,% left-aligned numbering
    showspaces=false,% hide markers for spaces
    showstringspaces=false,
    captionpos=t,% place the caption at the top
breaklines=true,
xleftmargin=2em,xrightmargin=2em,% set the width of the code environment
}
\lstdefinestyle{LaTeX}{
  language=TeX,
  morekeywords={
    begin, caption, label, mathrm, frac,
    toprule, midrule, bottomrule, includegraphics}
}
\DeclareCaptionFont{songticap}{\zihao{5}\bf\songti}
\captionsetup{
    font=small,%
    labelfont=songticap,
textfont=songticap,
strut=no,%
hypcap=true, % Links point to the top of the figure
aboveskip=6pt, % Increase the space between the figure and the caption
belowskip=6pt, % Increase the space between the caption and the table
}
\renewcommand{\labelitemi}{\tiny$\blacktriangleright$}
\renewcommand{\labelitemii}{\textbullet}

\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
\setlist[description]{noitemsep}
\declaretheoremstyle[
     %spaceabove=.5\thm@preskip,
     %spacebelow=.5\thm@postskip,
     headfont=\bf\songti,%\scshape,
     notefont=\songti,% notebraces={ (}{)},
     bodyfont=\songti,
     %headformat={\NAME\space\NUMBER\space\NOTE},
     headpunct={},
     %postheadspace={.5em plus .1em minus .1em},
     %prefoothook={\hfill\qedsymbol}
    ]{njuthm}

\theoremstyle{njuthm}
\let\oldproofname=\proofname
\renewcommand*{\proofname}{\rm\bf\songti{\oldproofname}} % 修改证明环境标题
\declaretheorem[
name=算法,
style=njuthm,
refname={算法,算法},
Refname={算法,算法},
]{algorithm}
\declaretheorem[
name=假设,
style=njuthm,
refname={假设,假设},
Refname={假设,假设},
]{assumption}
\declaretheorem[
name=公理,
style=njuthm,
refname={公理,公理},
Refname={公理,公理},
]{axiom}
\declaretheorem[
name=结论,
style=njuthm,
refname={结论,结论},
Refname={结论,结论},
]{conclusion}
\declaretheorem[
name=条件,
style=njuthm,
refname={条件,条件},
Refname={条件,条件},
]{condition}
\declaretheorem[
name=推论,
style=njuthm,
refname={推论,推论},
Refname={推论,推论},
]{corollary}
\declaretheorem[
name=定义,
style=njuthm,
refname={定义,定义},
Refname={定义,定义},
]{definition}
\declaretheorem[
     name=例,
     style=njuthm,
     refname={例,例},
     Refname={例,例},
     % numberwithin=section,
]{example}
\declaretheorem[
name=引理,
style=njuthm,
refname={引理,引理},
Refname={引理,引理},
]{lemma}
\declaretheorem[
name=性质,
style=njuthm,
refname={性质,性质},
Refname={性质,性质},
]{property}
\declaretheorem[
name=命题,
style=njuthm,
refname={命题,命题},
Refname={命题,命题},
]{proposition}
\declaretheorem[
name=注解,
style=njuthm,
refname={注解,注解},
Refname={注解,注解},
]{remark}
\declaretheorem[
name=定理,
style=njuthm,
refname={定理,定理},
Refname={定理,定理},
numberwithin=section,
]{theorem}
\tl_const:Nn \l__nju_info_title_tl
{
  \l__nju_info_title_a_tl
  \l__nju_info_title_b_tl
  \l__nju_info_title_c_tl
}
\tl_if_empty:NTF \l__nju_info_supv_b_tl
{
  \tl_const:Nn \l__nju_info_supv_full_tl
  {
     \l__nju_info_supv_a_tl\hspace{.5em}
     \l__nju_info_supv_a_title_tl
  }
  \tl_const:Nn \l__nju_info_supv_full_tl_en
  {
    \l__nju_info_supv_a_en_tl\hspace{.5em}
    \l__nju_info_supv_a_title_en_tl
  }
}
{
  \tl_const:Nn \l__nju_info_supv_full_tl
  {
    \l__nju_info_supv_a_tl\hspace{.5em}
    \l__nju_info_supv_a_title_tl\hspace{1em}
    \l__nju_info_supv_b_tl\hspace{.5em}
    \l__nju_info_supv_b_title_tl
  }
  \tl_const:Nn \l__nju_info_supv_full_tl_en
  {
    \l__nju_info_supv_a_en_tl\hspace{.5em}
    \l__nju_info_supv_a_title_en_tl\hspace{1em}
    \l__nju_info_supv_b_en_tl\hspace{.5em}
    \l__nju_info_supv_b_title_en_tl
  }
}
\str_if_eq:NNTF {\l__nju_info_degree_tl} { ug }
{
  % 本科
  \tl_const:Nn \l__nju_name_diploma_tl { 本\hfill 科\hfill }
  \tl_const:Nn \c__nju_name_title_tl { 题\hfill 目 }

  \tl_const:Nn \c__nju_cover_uline_len_a_tl { 250pt }
  \tl_const:Nn \c__nju_cover_uline_len_b_tl { 90pt }
  \tl_const:Nn \c__nju_cover_uline_font_tl { \songti }
  \tl_const:Nn \c__nju_cover_uline_style_tl { \bf }
  \tl_const:Nn \c__nju_cover_uline_bskip_tl {}

  \tl_const:Nn \c__nju_cover_box_len_tl { 4.2em }

  % 本科强制不打印国家图书馆封面
  \bool_set_false:N \nju_nl_cover
}
{
  % 本科以外都是研究生
  \tl_const:Nn \l__nju_name_diploma_tl { 研\hfill 究\hfill 生\hfill }
  \tl_const:Nn \c__nju_name_title_tl { 论\hfill 文\hfill 题\hfill 目 }

  \tl_const:Nn \c__nju_cover_uline_len_a_tl { 250pt }
  \tl_const:Nn \c__nju_cover_uline_len_b_tl { 14em }
  \tl_const:Nn \c__nju_cover_uline_font_tl { \kaishu }
  \tl_const:Nn \c__nju_cover_uline_style_tl {}
  \tl_const:Nn \c__nju_cover_uline_bskip_tl { \hspace{1em} }

  \tl_const:Nn \c__nju_cover_box_len_tl { 6em }

  % 研究生学位分类
  \str_case_e:nn { \l__nju_info_degree_tl }
  {
    { mg } { \tl_const:Nn \c__nju_name_degree_tl { 硕士 } }
    { mf } { \tl_const:Nn \c__nju_name_degree_tl { 硕士专业 } }
    { phd } { \tl_const:Nn \c__nju_name_degree_tl { 博士 } }
  }
}
\cs_new:Npn \__nju_cover_uline_a:n #1
{
  \uline{\makebox[\c__nju_cover_uline_len_a_tl]
    {\rm\c__nju_cover_uline_font_tl #1 }}
}
\cs_new:Npn \__nju_cover_uline_b:n #1
{
  \uline{\makebox[\c__nju_cover_uline_len_b_tl]
    {\rm\c__nju_cover_uline_font_tl #1 }}
}
\cs_new:Npn \__nju_cover_uline_nl:nn #1 #2
{
  \uline{\makebox[#1]
    {\rm\c__nju_cover_uline_font_tl #2 }}
}
\cs_new:Npn \__nju_cover_box:n #1
{
  \makebox[\c__nju_cover_box_len_tl][s]{
    #1\c__nju_cover_uline_bskip_tl}
}
\str_if_eq:NNTF { \l__nju_info_type_tl } { thesis }
{
  \tl_const:Nn \l__nju_info_type_tl_name
    { \l__nju_name_diploma_tl 毕\hfill 业\hfill 论\hfill 文 }
}
{
  \tl_const:Nn \l__nju_info_type_tl_name
    { \l__nju_name_diploma_tl 毕\hfill 业\hfill 设\hfill 计 }
}
\cs_new_protected:Npn \__nju_cover_title_breakline:
{
  \__nju_cover_box:n {\c__nju_name_title_tl}
  & \__nju_cover_uline_a:n
  { \c__nju_cover_uline_style_tl \l__nju_info_title_a_tl } \\
  % 如果某行标题空则不输出接下来的若干行
  \tl_if_empty:NF \l__nju_info_title_b_tl
  {
    \tl_if_empty:NTF \l__nju_info_title_c_tl
      {
        & \__nju_cover_uline_a:n
        {\c__nju_cover_uline_style_tl \l__nju_info_title_b_tl } \\
      }
      {
        & \__nju_cover_uline_a:n
        { \c__nju_cover_uline_style_tl \l__nju_info_title_b_tl } \\
        & \__nju_cover_uline_a:n
        { \c__nju_cover_uline_style_tl \l__nju_info_title_c_tl } \\
      }
  }
}
\cs_new_protected:Npn \__nju_print_covertab:
{%
  \str_if_eq:NNTF { \l__nju_info_degree_tl } { ug }
  {
    \begin{tabular}{p{4.2em}c}
      \__nju_cover_box:n {院\hfill 系}
      & \__nju_cover_uline_a:n  {\l__nju_info_dept_tl} \\
      \__nju_cover_box:n {专\hfill 业}
      & \__nju_cover_uline_a:n  {\l__nju_major_tl} \\
      \__nju_cover_title_breakline:
    \end{tabular}\\

    \begin{tabular}{p{4.2em}cp{4.2em}c}
      \__nju_cover_box:n {年\hfill 级}
      & \__nju_cover_uline_b:n {\l__nju_info_grade_tl}
      & \__nju_cover_box:n {学\hfill 号}
      & \__nju_cover_uline_b:n {\l__nju_info_id_tl}\\
    \end{tabular}\\

    \begin{tabular}{p{4.2em}c}
      \__nju_cover_box:n {学\hfill 生\hfill 姓\hfill 名}
      & \__nju_cover_uline_a:n  {\l__nju_info_author_tl}
    \end{tabular}\\
    \begin{tabular}{p{4.2em}cp{4.2em}c}
      \__nju_cover_box:n {导\hfill 师}
      & \__nju_cover_uline_b:n {\l__nju_info_supv_a_tl}
      & \__nju_cover_box:n {职\hfill 称}
      & \__nju_cover_uline_b:n {\l__nju_info_supv_a_title_tl}\\

      % 第二导师
      \tl_if_empty:NF \l__nju_info_supv_b_tl
      {
        \__nju_cover_box:n {第\hfill 二\hfill 导\hfill 师}
        & \__nju_cover_uline_b:n {\l__nju_info_supv_b_tl}
        & \__nju_cover_box:n {职\hfill 称}
        & \__nju_cover_uline_b:n {\l__nju_info_supv_b_title_tl}\\
      }
    \end{tabular}\\

    \begin{tabular}{p{4.2em}c}
      \__nju_cover_box:n {提\hfill 交\hfill 日\hfill 期}
      & \__nju_cover_uline_a:n  {\l__nju_submit_date_tl}\\
    \end{tabular}
  }
  {
    \begin{tabular}{p{6em}c}
      \__nju_cover_title_breakline:
      \__nju_cover_box:n {作\hfill 者\hfill 姓\hfill 名}
      & \__nju_cover_uline_a:n  {\l__nju_info_author_tl}\\
      \__nju_cover_box:n {专\hfill 业\hfill 名\hfill 称}
      & \__nju_cover_uline_a:n  {\l__nju_major_tl}\\
      \__nju_cover_box:n {研\hfill 究\hfill 方\hfill 向}
      & \__nju_cover_uline_a:n  {\l__nju_field_tl}\\
      \__nju_cover_box:n {指\hfill 导\hfill 教\hfill 师}
      & \__nju_cover_uline_a:n  {\l__nju_info_supv_full_tl}\\
    \end{tabular}
  }
}
\tl_new:N \nju_printcover_nl % 国家图书馆封面
\tl_new:N \nju_printcover_ug % 本科封面
\tl_new:N \nju_printcover_g % 研究生封面
\bool_if:NT \nju_nl_cover
{
  \tl_set:Nn \nju_printcover_nl
  {
    \thispagestyle{empty}
    \pdfbookmark[0]{国家图书馆封面}{nl}
    {
      % 顶端
      \hspace{0mm}
      \vskip -20mm \hskip -15mm
      \songti\zihao{-4}
      \makebox[40pt][l]{分类号}
      \__nju_cover_uline_b:n {\l__nju_info_classif_tl}
      \hfill
      \makebox[40pt][l]{密级}
      \__nju_cover_uline_b:n {\l__nju_info_seclv_tl}
      \vskip 10pt \hskip -15mm
      \makebox[40pt][l]{UDC}
      \__nju_cover_uline_b:n {\l__nju_info_udc_tl}
    }

    % 中部
    \vskip\stretch{2}
    \begin{center}
      \def\ULthickness{1pt}
      {\kaishu\zihao{-0} 学\hspace{0.5em}位\hspace{0.5em}论\hspace{0.5em}文}
      {
        \kaishu\zihao{1}
        \vskip \stretch{1}
        \__nju_cover_uline_b:n {\l__nju_info_title_a_tl}\\
        \__nju_cover_uline_b:n {\l__nju_info_title_b_tl}\\
        \__nju_cover_uline_b:n {\l__nju_info_title_c_tl}\\
      }
      \vskip \stretch{1}
      {\kaishu\zihao{4}（题名和副题名）}
      \vskip \stretch{1} \vskip 5mm
      {\kaishu\zihao{1}\uline{\makebox{\l__nju_info_author_tl}}}
      \vskip \stretch{1}
      {\kaishu\zihao{4}（作者姓名）}
    \end{center}

    % 底部
    \vskip\stretch{1}
    {
      \kaishu\zihao{4}
      \noindent 指导教师姓名、职务、职称、学位、单位名称及地址%
      \__nju_cover_uline_nl:nn {94pt}{\l__nju_info_supv_a_tl}\par
      \noindent\__nju_cover_uline_nl:nn {\textwidth}{%
      \l__nju_info_supv_cont_tl}\par
      \noindent 申请学位级别%
      \__nju_cover_uline_nl:nn {9em}{\c__nju_name_degree_tl}%
      \noindent 专业名称%
      \uline{\hfill\l__nju_major_tl\hfill}\par% 需要调整下划线长度
      \noindent 论文提交日期%
      \__nju_cover_uline_nl:nn {9em}{\l__nju_submit_date_tl}%
      论文答辩日期%
      \uline{\hfill\l__nju_defend_date_tl\hfill}\par% 需要调整下划线长度
      \noindent 学位授予单位和日期\uline{\hfill}\par
      \noindent\hfill 答辩委员会主席：%
      \__nju_cover_uline_nl:nn {9em}{\l__nju_info_chairman_tl}\par
      \noindent\hfill 评阅人：%
      \__nju_cover_uline_nl:nn {9em}{\l__nju_info_reviewer_a_tl}\par
      \noindent\hfill\__nju_cover_uline_nl:nn {9em}{\l__nju_info_reviewer_b_tl}\par
      \noindent\hfill\__nju_cover_uline_nl:nn {9em}{\l__nju_info_reviewer_c_tl}\par
      \noindent\hfill\__nju_cover_uline_nl:nn {9em}{\l__nju_info_reviewer_d_tl}\par

      \begin{center}
        \kaishu\zihao{3}\hspace{2em} 年\hspace{1em} 月\hspace{1em} 日
      \end{center}
      \vskip -10mm
      }
    \cleardoublepage
  }
}
\tl_set:Nn \nju_printcover_ug
{
  \thispagestyle{empty}
  \pagenumbering{Roman}
  % Start
  \pdfbookmark{封面}{封面} % 将封面插入pdf书签
  \begin{spacing}{1.25}
  \vskip 0mm
  \hspace{-10mm}
  \includegraphics[height=3cm]{njulogo}\smallskip
  \begin{center}
    \includegraphics[height=3.35cm]{njuname}
    \vskip 10mm
    {\zihao{1}\makebox[9em][s]{\bf{\songti\l__nju_info_type_tl_name}}}
    \vfill
    \vskip\stretch{0}
    {\bgroup
    \kaishu\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    % 绘制信息框
    \__nju_print_covertab:
    \egroup}
    \vfill
  \end{center}
  \end{spacing}
  \cleardoublepage
  % \vfill
  % \newpage
}
\tl_set:Nn \nju_printcover_g
{
  \thispagestyle{empty}
  \pagenumbering{Roman}
  % Start
  \pdfbookmark{封面}{封面} % 将封面插入pdf书签
  \begin{spacing}{1.25}
  \begin{center}
    \hspace{0pt} \vskip 5mm
    \includegraphics[height=1.9cm]{njulogo}
    \vskip 10mm
    \includegraphics[height=2cm]{njuname-large}
    \vskip 15mm
    {\zihao{1}\makebox[10em][s]{\bf{\kaishu\l__nju_info_type_tl_name}}}
    \vskip 5mm
    {\zihao{1}\bf{\kaishu{（申请\c__nju_name_degree_tl 学位）}}}
    \par\vfill
    \vskip\stretch{0}
    {\bgroup
    \bf\kaishu\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \vskip 10mm
    % 绘制信息框
    \__nju_print_covertab:
    \egroup}
    \vfill
    \vskip 10mm
    \bf\kaishu\zihao{4}\l__nju_submit_date_tl
    \vskip 15mm
  \end{center}
  \end{spacing}

  \newpage % 封面背面
  \thispagestyle{empty}
  \begin{spacing}{1.625}
    % TODO: 等待调整格式
    \hspace{0pt} \vfill
    {\bgroup
    \kaishu\zihao{3}
    \makebox[6em][s]{\bf\kaishu 学\hfill 号}：\MakeUppercase{\l__nju_info_id_tl}
    \par
    \makebox[6em][s]{\bf\kaishu 论文答辩日期}：\l__nju_defend_date_tl
    \par
    \makebox[6em][s]{\bf\kaishu 指\hfill 导\hfill 教\hfill 师}：\hspace{50mm}（签字）
    \par
    \egroup}
    \vskip 15mm
  \end{spacing}
  \cleardoublepage
}
\tl_set:Nn \maketitle
{%
  \str_if_eq:NNTF { \l__nju_info_degree_tl } { ug }
  {
    \nju_printcover_nl % 国家图书馆封面
    \nju_printcover_ug % 本科封面
  }
  {
    \nju_printcover_nl % 国家图书馆封面
    \nju_printcover_g % 研究生封面
  }
}
\str_if_eq:NNTF {\l__nju_info_degree_tl} { ug }
{
  % 本科摘要环境
  \NewDocumentEnvironment{abstract} {}
  {%
    % \pagestyle{plain}
    % \pagenumbering{Roman}
    % \phantomsection\addcontentsline{toc}{chapter}{中文摘要} % 将摘要插入目录和pdf书签
    \pdfbookmark[0]{中文摘要}{中文摘要} % 将摘要插入pdf书签，与上一行不可共存
    \begin{center}
      \kaishu\zihao{-2}{\textbf{\uuline{
        南京大学本科生毕业论文（设计、作品）中文摘要}}}
    \end{center}
    {\bgroup
      \kaishu\zihao{-4}
      \tl_set:Nn \tabcolsep {0pt}
      \tl_set:Nn \arraystretch {0.8}
      \noindent
      题目： \l__nju_info_title_tl \\
      院系： \l__nju_info_dept_tl \\
      专业： \l__nju_major_tl \\
      本科生姓名： \l__nju_info_author_tl \\
      指导教师（姓名、职称）：\l__nju_info_supv_full_tl \\
      摘要：
      \egroup
    }
    \kaishu\zihao{-4}\par%
  }{%
  \newpage
  }

  % 中文关键词
  \NewDocumentCommand \keywords {m} {%
    \par\vspace{2ex}\noindent%
    {\kaishu\zihao{-4}\makebox[4em][s]{关键词{：}}}~{#1}%
  }

  % 英文摘要
  \NewDocumentEnvironment{englishabstract} {}
  {%
    \pagestyle{plain}
    % \phantomsection\addcontentsline{toc}{chapter}{英文摘要} % 将摘要插入目录和pdf书签
    \pdfbookmark[0]{英文摘要}{英文摘要} % 将摘要插入pdf书签，与上一行不可共存
    \begin{center}
        \kaishu\zihao{-2}{\textbf{\uuline{
          南京大学本科生毕业论文（设计、作品）英文摘要}}}
    \end{center}
    {
      \bgroup
      THESIS: ~~\l__nju_info_title_en_tl \\
      DEPARTMENT: ~~\l__nju_info_dept_en_tl \\
      SPECIALIZATION: ~~\l__nju_major_en_tl \\
      UNDERGRADUATE:~~\l__nju_info_author_en_tl \\
      MENTOR:~~\l__nju_info_supv_full_tl_en \\
      ABSTRACT:
      \egroup
    }
    \zihao{-4}\par%
  }{%
  \cleardoublepage
  \newpage
  }

  % 英文关键词
  \NewDocumentCommand \englishkeywords {m} {%
    \par\vspace{2ex}\noindent%
    {KEYWORDS{:}}~~{#1}%
  }
}
{
  % 研究生摘要环境
  \NewDocumentEnvironment{abstract} {}
  {%
    \pagestyle{plain}
    \pagenumbering{Roman}
    % \phantomsection\addcontentsline{toc}{chapter}{中文摘要} % 将摘要插入目录和pdf书签
    \pdfbookmark[0]{中文摘要}{中文摘要} % 将摘要插入pdf书签，与上一行不可共存
    \begin{center}
      \kaishu\zihao{-2}{\textbf{\uuline{
        南京大学研究生毕业论文中文摘要首页用纸}}}
    \end{center}

    \bgroup
    \kaishu\zihao{4}
    \tl_set:Nn \tabcolsep {0pt}
    \tl_set:Nn \arraystretch {0.8}
    \noindent
    毕业论文题目：\hspace{0.5em}\nju_underline:n {\l__nju_info_title_tl\hfill}\\
    \uline{\makebox[9em]{\l__nju_major_tl}}专业
    \uline{\makebox[4em]{\l__nju_info_grade_tl}}级
    \str_if_eq:NNTF {\l__nju_info_degree_tl} { phd } {博}{硕}
    士生姓名：\uline{\hfill\l__nju_info_author_tl\hfill} \\
    指导教师（姓名、职称）：\uline{\hfill\l__nju_info_supv_full_tl\hfill}\par
    \egroup

    \kaishu\zihao{4}\par%
  }{%
  \newpage
  }

  % 中文关键词
  \NewDocumentCommand \keywords {m} {%
    \par\vspace{2ex}\noindent%
    {\kaishu\zihao{4}\makebox[4em][s]{关键词{：}}}~{#1}%
  }

  % 英文摘要
  \NewDocumentEnvironment{englishabstract} {}
  {%
    \pagestyle{plain}
    % \phantomsection\addcontentsline{toc}{chapter}{英文摘要} % 将摘要插入目录和pdf书签
    \pdfbookmark[0]{英文摘要}{英文摘要} % 将摘要插入pdf书签，与上一行不可共存
    \begin{center}
        \kaishu\zihao{-2}{\textbf{\uuline{
          南京大学研究生毕业论文英文摘要首页用纸}}}
    \end{center}
    {
      \bgroup
      \zihao{4}
      THESIS: ~~\l__nju_info_title_en_tl \\
      SPECIALIZATION: ~~\l__nju_major_en_tl \\
      POSTGRADUATE:~~\l__nju_info_author_en_tl \\
      MENTOR:~~\l__nju_info_supv_full_tl_en\par
      \egroup
    }
    \zihao{4}\par%
  }{%
  \cleardoublepage
  \newpage
  }

  % 英文关键词
  \NewDocumentCommand \englishkeywords {m} {%
    \par\vspace{2ex}\noindent%
    {KEYWORDS{:}}~~{#1}%
  }
}
\endinput
%%
%% End of file `njuthesis.cls'.
