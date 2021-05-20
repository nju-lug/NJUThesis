\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{njuthesis}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=njuthesis,
    prefix=
}
%
% \PassOptionsToPackage{AutoFakeBold=2.17}{xeCJK}
\LoadClass[a4paper,UTF8,scheme=chinese,linespread=1.625, zihao=-4]{ctexbook}[2018/04/01]

% 输入配置文件
\input{profile/profile.cls}
% \input{profile/packages.tex}
\input{njuthesis.cfg}


\DeclareStringOption[thesis]{Type}
\DeclareStringOption{Department}
\DeclareStringOption{Major}
\DeclareStringOption{Title}
\DeclareStringOption{Grade}
\DeclareStringOption{StudentID}
\DeclareStringOption{StudentName}
\DeclareStringOption{Supervisor}
\DeclareStringOption{SupervisorTitle}
\DeclareStringOption{SubmitDate}

\ProcessKeyvalOptions*

\ifthenelse{\equal{\Type}{thesis}}
{
  \newcommand{\typename}{本科毕业论文}
}
{
  \newcommand{\typename}{本科毕业设计}
}




% \input{njuthesis.cfg}