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


\DeclareStringOption[thesis]{Type}
\DeclareStringOption{Department}
\DeclareStringOption{Department_EN}
\DeclareStringOption{Major}
\DeclareStringOption{Major_EN}
\DeclareStringOption{Title}
\DeclareStringOption{Title_EN}
\DeclareStringOption{Grade}
\DeclareStringOption{StudentID}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentName_EN}
\DeclareStringOption{Mentor}
\DeclareStringOption{Mentor_EN}
\DeclareStringOption{MentorTitle}
\DeclareStringOption{MentorTitle_EN}
\DeclareStringOption{SubmitDate}
\DeclareStringOption[本科]{Degree}

\ProcessKeyvalOptions*

\ifthenelse{\equal{\Type}{thesis}}
{
  \NewDocumentCommand \typename {} {\Degree 毕业论文}
}
{
  \NewDocumentCommand \typename {} {\Degree 毕业设计}
}