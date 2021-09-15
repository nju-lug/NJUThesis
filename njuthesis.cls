%%
%% This is file `njuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% njuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2021 by Nanjing University Linux User Group <my@yaoge123.com>
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
 \GetIdInfo  $Id: njuthesis.dtx 0.9.0 2020-09-15 12:00:00 +0800  NJU LUG <my@yaoge123.com> $
  {Thesis template for Nanjing University}
\ProvidesExplClass{\ExplFileName}{\ExplFileDate}{\ExplFileVersion}{\ExplFileDescription}
\LoadClass[
  a4paper,
  twoside,
  UTF8,
  scheme=chinese,
  linespread=1.625,% laTex默认1.2行距，word默认行距是1.3，要求1.5倍word行距，故1.5/1.2*1.3 = 1.625
  fontset=none,
  zihao=-4
  ]{ctexbook}[2018/04/01]
\RequirePackage{l3keys2e}
\keys_define:nn { nju }
{
  titlelength       .int_set:N    =   \nju_titlelength,
  titlelength       .initial:n    =   1,
  secondmentor      .bool_set:N   =   \nju_second_mentor,
  secondmentor      .initial:n    =   false,
  nlcover           .bool_set:N   =   \nju_nl_cover,
  nlcover           .initial:n    =   false,
  degree            .tl_set:N     =   \nju_degree,
  degree            .initial:n    =   ug,
  type              .tl_set:N     =   \nju_type,
  type              .initial:n    =   thesis,
  systemfont        .bool_set:N   =   \nju_systemfont,
  systemfont        .initial:n    =   true,
  customlatinfont   .tl_set:N     =   \nju_customlatinfont,
  customlatinfont   .initial:n    =   windows,
  customchinesefont .tl_set:N     =   \nju_customchinesefont,
  customchinesefont .initial:n    =   windows,
  info              .meta:nn      =   { nju / info } { #1 }
}
\keys_define:nn { nju / info }
{
  % 题目
  TitleA            .tl_set:N     =   \nju_title_a,
  TitleB            .tl_set:N     =   \nju_title_b,
  TitleC            .tl_set:N     =   \nju_title_c,
  TitleEN           .tl_set:N     =   \nju_title_en,
  % 年级学号姓名
  Grade             .tl_set:N     =   \nju_grade,
  StudentID         .tl_set:N     =   \nju_student_id,
  StudentName       .tl_set:N     =   \nju_student_name,
  StudentNameEN     .tl_set:N     =   \nju_student_name_en,
  % 院系专业方向
  Department        .tl_set:N     =   \nju_department,
  DepartmentEN      .tl_set:N     =   \nju_department_en,
  Major             .tl_set:N     =   \nju_major,
  MajorEN           .tl_set:N     =   \nju_major_en,
  Field             .tl_set:N     =   \nju_field,
  FieldEN           .tl_set:N     =   \nju_field_en,
  MentorA           .tl_set:N     =   \nju_mentor_a,
  MentorAEN         .tl_set:N     =   \nju_mentor_a_en,
  MentorATitle      .tl_set:N     =   \nju_mentor_a_title,
  MentorATitleEN    .tl_set:N     =   \nju_mentor_a_title_en,
  MentorB           .tl_set:N     =   \nju_mentor_b,
  MentorBEN         .tl_set:N     =   \nju_mentor_b_en,
  MentorBTitle      .tl_set:N     =   \nju_mentor_b_title,
  MentorBTitleEN    .tl_set:N     =   \nju_mentor_b_title_en,
  SubmitDate        .tl_set:N     =   \nju_submit_date,
  DefendDate        .tl_set:N     =   \nju_defend_date,
  ReviewerChairman  .tl_set:N     =   \nju_reviewer_chairman,
  ReviewerA         .tl_set:N     =   \nju_reviewer_a,
  ReviewerB         .tl_set:N     =   \nju_reviewer_b,
  ReviewerC         .tl_set:N     =   \nju_reviewer_c,
  ReviewerD         .tl_set:N     =   \nju_reviewer_d,
  % 国家图书馆封面相关
  Classification    .tl_set:N     =   \nju_classification,
  SecurityLevel     .tl_set:N     =   \nju_securitylevel,
  UDC               .tl_set:N     =   \nju_udc,
  MentorInfo        .tl_set:N     =   \nju_mentor_info,
}
\NewDocumentCommand \njusetup { m }
{ \keys_set:nn { nju } { #1 } }
\ProcessKeysOptions { nju }
\RequirePackage{fontspec}
\RequirePackage[
    top=2.5cm,
    bottom=2.5cm,
    left=3.2cm,
    right=3.2cm
]{geometry}
\RequirePackage{xparse}
\RequirePackage{titletoc} % 修改目录内标题格式
\RequirePackage{fancyhdr} % 调整页眉页脚
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
\NewDocumentCommand\set_latin_fontset_windows{}{
  \setmainfont{Times~New~Roman}
  \setsansfont{Arial}
  \setmonofont{Courier~New}[Scale=MatchLowercase]
}
\NewDocumentCommand\set_latin_fontset_macos{}{
  \setmainfont{Times~New~Roman}
  \setsansfont{Arial}
  \setmonofont{Menlo}[Scale=MatchLowercase]
}
\NewDocumentCommand\set_latin_fontset_gyre{}{
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
\NewDocumentCommand\set_chinese_fontset_windows{}{
  \setCJKmainfont{SimSun}[
    AutoFakeBold=2.17,
    ItalicFont=KaiTi]
  \setCJKsansfont{SimHei}
  \setCJKmonofont{FangSong}
  \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.17]
  \setCJKfamilyfont{zhhei}{SimHei}
  \setCJKfamilyfont{zhfs}{FangSong}
  \setCJKfamilyfont{zhkai}{KaiTi}[AutoFakeBold=2.17]
  \setCJKfamilyfont{zhnewhei}{Microsoft~YaHei}[BoldFont=Microsoft~YaHei~Bold]
}
\NewDocumentCommand\set_chinese_fontset_macos{}{
  \msg_redirect_name:nnn {fontspec} {no-script} {info} % 移除 does not contain script "CJK" 警告
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
\NewDocumentCommand\set_chinese_fontset_fandol{}{
  \msg_redirect_name:nnn {fontspec} {no-script} {info} % 移除 does not contain script "CJK" 警告
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
\NewDocumentCommand\set_chinese_fontset_founder{}{
  % FZSSK 方正书宋（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/151 免费商用
  % FZXBSK 方正小标宋（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/164 设计师非商免费
  % FZKTK 方正楷体（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/137 免费商用
  \setCJKmainfont{FZSSK}[
    Extension=.ttf,
    BoldFont=FZXBSK,
    ItalicFont=FZKTK]
  % FZXH1K 方正细黑一（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/161 设计师非商免费
  % FZHTK 方正黑体（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/131 免费商用
  \setCJKsansfont{FZXH1K}[
    Extension=.ttf,
    BoldFont=FZHTK]
  % FZFSK 方正仿宋（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/128
  \setCJKmonofont{FZFSK}[Extension=.ttf]

  \setCJKfamilyfont{zhsong}{FZSSK}[
    Extension=.ttf,
    BoldFont=FZXBSK]
  \setCJKfamilyfont{zhhei}{FZHTK}[
    Extension=.ttf,
    AutoFakeBold=2.17]
  \setCJKfamilyfont{zhfs}{FZFSK}[Extension=.ttf]
  \setCJKfamilyfont{zhkai}{FZKTK}[Extension=.ttf]
  % FZYouHK_508R 方正悠黑508R（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/244 设计师非商免费
  % FZYouHK_511M 方正悠黑511M（简繁扩展） http://www.foundertype.com/index.php/FontInfo/index/id/244 设计师非商免费
  \setCJKfamilyfont{zhnewhei}{FZYouHK_508R}[
    Extension=.ttf,
    BoldFont=FZYouHK_511M]
}
\NewDocumentCommand\set_chinese_fontset_noto{}{
  % 思源宋体 https://www.google.com/get/noto/#serif-hans
  \setCJKmainfont[
    UprightFont=NotoSerifCJKsc-Regular,
    BoldFont=NotoSerifCJKsc-Bold,
    ItalicFont=NotoSerifCJKsc-Regular,
    BoldItalicFont=NotoSerifCJKsc-Bold,
    ItalicFeatures=FakeSlant,
    BoldItalicFeatures=FakeSlant]{Noto~Serif~CJK~SC}

  % 思源黑体 https://www.google.com/get/noto/#sans-hans
  \setCJKsansfont[
    UprightFont=NotoSansCJKsc-Regular,
    BoldFont=NotoSansCJKsc-Bold,
    ItalicFont=NotoSansCJKsc-Regular,
    BoldItalicFont=NotoSansCJKsc-Bold,
    ItalicFeatures=FakeSlant,
    BoldItalicFeatures=FakeSlant]{Noto~Sans~CJK~SC}

  % 包含于上述思源黑体
  \setCJKmonofont[
    UprightFont=NotoSansMonoCJKsc-Regular,
    BoldFont=NotoSansMonoCJKsc-Bold,
    ItalicFont=NotoSansMonoCJKsc-Regular,
    BoldItalicFont=NotoSansMonoCJKsc-Bold,
    ItalicFeatures=FakeSlant,
    BoldItalicFeatures=FakeSlant]{Noto~Sans~Mono~SC}

  \setCJKfamilyfont{zhsong}{Noto~Serif~CJK~SC}
  \setCJKfamilyfont{zhhei}{Noto~Sans~CJK~SC}

  % 方正楷体、方正仿宋为免费商用字体，且支持CJK字符集
  % 方正仿宋 http://www.foundertype.com/index.php/FontInfo/index/id/128.html
  % 方正楷体 http://www.foundertype.com/index.php/FontInfo/index/id/137.html
  \setCJKfamilyfont{zhfs}{方正仿宋简体}[AutoFakeBold=2.17]
  \setCJKfamilyfont{zhkai}{方正楷体简体}[AutoFakeBold=2.17]
}
\bool_if:NTF \nju_systemfont
{
  % 检测是否是 Windows
  \sys_if_platform_windows:TF
  {
    \set_latin_fontset_windows
    \set_chinese_fontset_windows
  }
  {
    % 检测是否是 macOS
    \ctex_if_platform_macos:TF
    {
      \set_latin_fontset_macos
      \set_chinese_fontset_macos
    }
    % 其余系统一律使用自由字体
    {
      \set_latin_fontset_gyre
      \set_chinese_fontset_fandol
    }
  }
}
{
  % 如果用户需要自定义字体
  % 此处需要使用\str_case_e而不是\str_case使宏展开为字符串
  \str_case_e:nn { \nju_customlatinfont }
  {
    { windows } { \set_latin_fontset_windows }
    { macos } { \set_latin_fontset_macos }
    { gyre } { \set_latin_fontset_gyre }
    { null } {}
  }
  \str_case_e:nn { \nju_customchinesefont }
  {
    { windows } { \set_chinese_fontset_windows }
    { macos } { \set_chinese_fontset_macos }
    { gyre } { \set_chinese_fontset_gyre }
    { founder } { \set_chinese_fontset_founder }
    { noto } { \set_chinese_fontset_noto }
    { null } {}
  }
}
\setmathfont{XITSMath-Regular}[
  BoldFont = XITSMath-Bold,
  Extension = .otf]
\NewDocumentCommand\songti{}{\CJKfamily{zhsong}}
\NewDocumentCommand\heiti{}{\CJKfamily{zhhei}}
\NewDocumentCommand\fangsong{}{\CJKfamily{zhfs}}
\NewDocumentCommand\kaishu{}{\CJKfamily{zhkai}}
\fancypagestyle{njuplain}{%
   \fancyhead{}
   \fancyfoot[C]{\zihao{5}\thepage} % 页脚居中 五号新罗马体数字
}
\fancypagestyle{njuheadings}{%
   \fancyhead{}
   \fancyfoot[C]{\zihao{5}\thepage}
}
\str_if_eq:NNTF {\nju_degree} { ug }
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
\newenvironment{preface}
{%
  \chapter*{前言}
  \addcontentsline{toc}{chapter}{前言}
}{}
\newenvironment{acknowledgement}
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
    % gbpub=false,         % Uncomment if you do NOT want '[S.l. : s.n.]' in reference entries, GitHub Issue (#47)
    % gbnamefmt=lowercase, % Uncomment if you do NOT want uppercase author names in reference entries, GitHub Issue (#23)
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
  morekeywords={begin, caption, label, mathrm, frac, toprule, midrule, bottomrule, includegraphics}
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
\tl_const:Nn \nju_title {\nju_title_a \nju_title_b \nju_title_c}
\bool_if:NTF \nju_second_mentor
{
  \tl_const:Nn \nju_mentor_full
  {
    \nju_mentor_a\ \nju_mentor_a_title
    \ \ \nju_mentor_b\ \nju_mentor_b_title
  }
  \tl_const:Nn \nju_mentor_full_en
  {
    \nju_mentor_a_en\ \nju_mentor_a_title_en
    \ \ \nju_mentor_b_en\ \nju_mentor_b_title_en
  }
}
{
  \tl_const:Nn \nju_mentor_full
  {
    \nju_mentor_a\ \nju_mentor_a_title
  }
  \tl_const:Nn \nju_mentor_full_en
  {
    \nju_mentor_a_en\ \nju_mentor_a_title_en
  }
}
\str_if_eq:NNTF {\nju_degree} { ug }
{
  % 本科
  \tl_const:Nn \nju_degree_name {本\hfill 科\hfill }

  % 本科强制不打印国家图书馆封面
  \bool_set_false:N \nju_nl_cover

  % 封面下划线
  \cs_new:Npn \nju_cover_underline_ug:nn #1 #2
  {
    \uline{\makebox[#1]{\rm\songti#2}}
  }

  % 封面表格边框
  \cs_new:Npn \nju_coverbox_ug:n #1
  {
    \makebox[4.2em][s]{#1}
  }
}
{
  % 本科以外都是研究生
  \tl_const:Nn \nju_degree_name {研\hfill 究\hfill 生\hfill }

  % 封面下划线
  \cs_new:Npn \nju_cover_underline_g:n #1
  {
    \uline{\makebox[250pt]{\rm\kaishu#1}}
  }

  % 国家图书馆封面下划线
  \cs_new:Npn \nju_cover_underline_nl:nn #1 #2
  {
    \uline{\makebox[#1]{#2}}
  }

  % 封面表格边框
  \cs_new:Npn \nju_coverbox_g:n #1
  {
    \makebox[6em][s]{#1\hspace{1em}}
  }

  % 研究生学位分类
  \str_case_e:nn { \nju_degree }
  {
    { mg } { \tl_const:Nn \nju_degree_title {硕士} }
    { mf } { \tl_const:Nn \nju_degree_title {硕士专业} }
    { phd } { \tl_const:Nn \nju_degree_title {博士} }
  }
}
\str_if_eq:NNTF {\nju_type} {thesis}
{
  \tl_const:Nn \nju_type_name
    { \nju_degree_name 毕\hfill 业\hfill 论\hfill 文 }
}
{
  \tl_const:Nn \nju_type_name
    { \nju_degree_name 毕\hfill 业\hfill 设\hfill 计 }
}
\tl_new:N \nju_printcoverinfo_ug
\tl_set:Nn \nju_printcoverinfo_ug
{
  \begin{tabular}{p{4.2em}c}
    \nju_coverbox_ug:n {院\hfill 系}
    & \nju_cover_underline_ug:nn {250pt}{\nju_department}\\
    \nju_coverbox_ug:n {专\hfill 业}
    & \nju_cover_underline_ug:nn {250pt}{\nju_major}\\

    % 标题换行
    \int_case:nn { \nju_titlelength }
      {
        { 1 } {
          \nju_coverbox_ug:n {题\hfill 目}
          & \nju_cover_underline_ug:nn {250pt}{\bf{\nju_title_a}} \\ }
        { 2 } {
          \nju_coverbox_ug:n {题\hfill 目}
          & \nju_cover_underline_ug:nn {250pt}{\bf{\nju_title_a}} \\
          & \nju_cover_underline_ug:nn {250pt}{\bf{\nju_title_b}} \\ }
        { 3 } {
          \nju_coverbox_ug:n {题\hfill 目}
          & \nju_cover_underline_ug:nn {250pt}{\bf{\nju_title_a}} \\
          & \nju_cover_underline_ug:nn {250pt}{\bf{\nju_title_b}} \\
          & \nju_cover_underline_ug:nn {250pt}{\bf{\nju_title_c}} \\}
      }
  \end{tabular}\\

  \begin{tabular}{p{4.2em}cp{4.2em}c}
    \nju_coverbox_ug:n {年\hfill 级}
    & \nju_cover_underline_ug:nn {90pt}{\nju_grade}
    & \nju_coverbox_ug:n {学\hfill 号}
    & \nju_cover_underline_ug:nn {90pt}{\nju_student_id}\\
  \end{tabular}\\

  \begin{tabular}{p{4.2em}c}
    \nju_coverbox_ug:n {学\hfill 生\hfill 姓\hfill 名}
    & \nju_cover_underline_ug:nn {250pt}{\nju_student_name}
  \end{tabular}\\
  \begin{tabular}{p{4.2em}cp{4.2em}c}
    \nju_coverbox_ug:n {导\hfill 师}
    & \nju_cover_underline_ug:nn {90pt}{\nju_mentor_a}
    & \nju_coverbox_ug:n {职\hfill 称}
    & \nju_cover_underline_ug:nn {90pt}{\nju_mentor_a_title}\\

    % 第二导师
    \bool_if:NT \nju_second_mentor
    {
      \nju_coverbox_ug:n {第\hfill 二\hfill 导\hfill 师}
      & \nju_cover_underline_ug:nn {90pt}{\nju_mentor_b}
      & \nju_coverbox_ug:n {职\hfill 称}
      & \nju_cover_underline_ug:nn {90pt}{\nju_mentor_b_title}\\
    }
  \end{tabular}\\

  \begin{tabular}{p{4.2em}c}
    \nju_coverbox_ug:n {提\hfill 交\hfill 日\hfill 期}
    & \nju_cover_underline_ug:nn {250pt}{\nju_submit_date}\\
  \end{tabular}
}
\tl_new:N \nju_printcoverinfo_g
\tl_set:Nn \nju_printcoverinfo_g
{
  \begin{tabular}{p{6em}c}
    % 标题换行
    \int_case:nn {\nju_titlelength}
      {
        { 1 } {
          \nju_coverbox_g:n {论\hfill 文\hfill 题\hfill 目}
          & \nju_cover_underline_g:n {\nju_title_a} \\ }
        { 2 } {
          \nju_coverbox_g:n {论\hfill 文\hfill 题\hfill 目}
          & \nju_cover_underline_g:n {\nju_title_a} \\
          & \nju_cover_underline_g:n {\nju_title_b} \\ }
        { 3 } {
          \nju_coverbox_g:n {论\hfill 文\hfill 题\hfill 目}
          & \nju_cover_underline_g:n {\nju_title_a} \\
          & \nju_cover_underline_g:n {\nju_title_b} \\
          & \nju_cover_underline_g:n {\nju_title_c} \\}
      }

    \nju_coverbox_g:n {作\hfill 者\hfill 姓\hfill 名}
    & \nju_cover_underline_g:n {\nju_student_name}\\
    \nju_coverbox_g:n {专\hfill 业\hfill 名\hfill 称}
    & \nju_cover_underline_g:n {\nju_major}\\
    \nju_coverbox_g:n {研\hfill 究\hfill 方\hfill 向}
    & \nju_cover_underline_g:n {\nju_field}\\
    \nju_coverbox_g:n {指\hfill 导\hfill 教\hfill 师}
    & \nju_cover_underline_g:n {\nju_mentor_full}\\
  \end{tabular}
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
      \nju_cover_underline_nl:nn {150pt}{\nju_classification}
      \hfill
      \makebox[40pt][l]{密级}
      \nju_cover_underline_nl:nn {150pt}{\nju_securitylevel}
      \vskip 10pt \hskip -15mm
      \makebox[40pt][l]{UDC}
      \nju_cover_underline_nl:nn {150pt}{\nju_udc}
    }

    % 中部
    \vskip\stretch{2}
    \begin{center}
      \def\ULthickness{1pt}
      {\kaishu\zihao{-0} 学\hspace{0.5em}位\hspace{0.5em}论\hspace{0.5em}文}
      {
        \kaishu\zihao{1}
        \vskip \stretch{1}
        \nju_cover_underline_nl:nn {14em}{\nju_title_a}\\
        \nju_cover_underline_nl:nn {14em}{\nju_title_b}\\
        \nju_cover_underline_nl:nn {14em}{\nju_title_c}\\
      }
      \vskip \stretch{1}
      {\kaishu\zihao{4}（题名和副题名）}
      \vskip \stretch{1} \vskip 5mm
      {\kaishu\zihao{1}\uline{\makebox{\nju_student_name}}}
      \vskip \stretch{1}
      {\kaishu\zihao{4}（作者姓名）}
    \end{center}

    % 底部
    \vskip\stretch{1}
    {
      \kaishu\zihao{4}
      \noindent 指导教师姓名、职务、职称、学位、单位名称及地址%
      \nju_cover_underline_nl:nn {94pt}{\nju_mentor_a}\par
      \noindent\nju_cover_underline_nl:nn {\textwidth}{%
      \nju_mentor_info}\par
      \noindent 申请学位级别%
      \nju_cover_underline_nl:nn {9em}{\nju_degree_title}%
      \noindent 专业名称%
      \uline{\hfill\nju_major\hfill}\par% 需要调整下划线长度
      \noindent 论文提交日期%
      \nju_cover_underline_nl:nn {9em}{\nju_submit_date}%
      论文答辩日期%
      \uline{\hfill\nju_defend_date\hfill}\par% 需要调整下划线长度
      \noindent 学位授予单位和日期\uline{\hfill}\par
      \noindent\hfill 答辩委员会主席：%
      \nju_cover_underline_nl:nn {9em}{\nju_reviewer_chairman}\par
      \noindent\hfill 评阅人：%
      \nju_cover_underline_nl:nn {9em}{\nju_reviewer_a}\par
      \noindent\hfill\nju_cover_underline_nl:nn {9em}{\nju_reviewer_b}\par
      \noindent\hfill\nju_cover_underline_nl:nn {9em}{\nju_reviewer_c}\par
      \noindent\hfill\nju_cover_underline_nl:nn {9em}{\nju_reviewer_d}\par

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
    {\zihao{1}\makebox[9em][s]{\bf{\songti\nju_type_name}}}
    \vfill
    \vskip\stretch{0}
    {\bgroup
    \kaishu\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \nju_printcoverinfo_ug % 绘制信息框
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
    {\zihao{1}\makebox[10em][s]{\bf{\kaishu\nju_type_name}}}
    \vskip 5mm
    {\zihao{1}\bf{\kaishu{（申请\nju_degree_title 学位）}}}
    \par\vfill
    \vskip\stretch{0}
    {\bgroup
    \bf\kaishu\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \vskip 10mm
    \nju_printcoverinfo_g % 绘制信息框
    \egroup}
    \vfill
    \vskip 10mm
    \bf\kaishu\zihao{4}\nju_submit_date
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
    \makebox[6em][s]{\bf\kaishu 学\hfill 号}：\MakeUppercase{\nju_student_id}
    \par
    \makebox[6em][s]{\bf\kaishu 论文答辩日期}：\nju_defend_date
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
  \str_if_eq:NNTF { \nju_degree } { ug }
  {
    \nju_printcover_nl % 国家图书馆封面
    \nju_printcover_ug % 本科封面
  }
  {
    \nju_printcover_nl % 国家图书馆封面
    \nju_printcover_g % 研究生封面
  }
}
\str_if_eq:NNTF {\nju_degree} { ug }
{
  % 本科摘要环境
  \NewDocumentEnvironment{abstract} {}
  {%
    % \pagestyle{plain}
    % \pagenumbering{Roman}
    % \phantomsection\addcontentsline{toc}{chapter}{中文摘要} % 将摘要插入目录和pdf书签
    \pdfbookmark[0]{中文摘要}{中文摘要} % 将摘要插入pdf书签，与上一行不可共存
    \begin{center}
      \kaishu\zihao{-2}{\textbf{\uuline{南京大学本科生毕业论文（设计、作品）中文摘要}}}
    \end{center}
    {\bgroup
      \kaishu\zihao{-4}
      \tl_set:Nn \tabcolsep {0pt}
      \tl_set:Nn \arraystretch {0.8}
      \noindent
      题目： \nju_title \\
      院系： \nju_department \\
      专业： \nju_major \\
      本科生姓名： \nju_student_name \\
      指导教师（姓名、职称）：\nju_mentor_full \\
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
        \kaishu\zihao{-2}{\textbf{\uuline{南京大学本科生毕业论文（设计、作品）英文摘要}}}
    \end{center}
    {
      \bgroup
      THESIS: ~~\nju_title_en \\
      DEPARTMENT: ~~\nju_department_en \\
      SPECIALIZATION: ~~\nju_major_en \\
      UNDERGRADUATE:~~\nju_student_name_en \\
      MENTOR:~~\nju_mentor_full_en \\
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
      \kaishu\zihao{-2}{\textbf{\uuline{南京大学研究生毕业论文中文摘要首页用纸}}}
    \end{center}

    \bgroup
    \kaishu\zihao{4}
    \tl_set:Nn \tabcolsep {0pt}
    \tl_set:Nn \arraystretch {0.8}
    \noindent
    毕业论文题目：\hspace{0.5em}\nju_underline:n {\nju_title\hfill}\\
    \uline{\makebox[9em]{\nju_major}}专业\uline{\makebox[4em]{\nju_grade}}级
    \str_if_eq:NNTF {\nju_degree} { phd } {博}{硕}
    士生姓名：\uline{\hfill\nju_student_name\hfill} \\
    指导教师（姓名、职称）：\uline{\hfill\nju_mentor_full\hfill}\par
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
        \kaishu\zihao{-2}{\textbf{\uuline{南京大学研究生毕业论文英文摘要首页用纸}}}
    \end{center}
    {
      \bgroup
      \zihao{4}
      THESIS: ~~\nju_title_en \\
      SPECIALIZATION: ~~\nju_major_en \\
      POSTGRADUATE:~~\nju_student_name_en \\
      MENTOR:~~\nju_mentor_full_en\par
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
