\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{njuthesis}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=njuthesis,
    prefix=
}

\LoadClass[
  a4paper,
  twoside,
  UTF8,
  scheme=chinese,
  linespread=1.625,% laTex默认1.2行距，word默认行距是1.3，要求1.5倍word行距，故1.5/1.2*1.3 = 1.625
  fontset=none,
  zihao=-4
  ]{ctexbook}[2018/04/01]

\DeclareStringOption[1]{TitleLength}
\DeclareStringOption[UG]{Degree}
\DeclareStringOption[thesis]{Type}

\ProcessKeyvalOptions*\relax

% 输入配置文件
\RequirePackage{profile/packages}
\RequirePackage{profile/font}
\RequirePackage{profile/page}
\RequirePackage{profile/reference}
\RequirePackage{profile/components}
\RequirePackage{profile/cover}
\RequirePackage{profile/abstract}
