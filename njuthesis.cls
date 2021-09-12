\NeedsTeXFormat{LaTeX2e}
\ProvidesExplClass{njuthesis}{2021-09-12}{0.7.4}{NJU Thesis LaTeX Template}

% 通过类传递参数
\RequirePackage{l3keys2e}

\LoadClass[
  a4paper,
  twoside,
  UTF8,
  scheme=chinese,
  linespread=1.625,% laTex默认1.2行距，word默认行距是1.3，要求1.5倍word行距，故1.5/1.2*1.3 = 1.625
  fontset=none,
  zihao=-4
  ]{ctexbook}[2018/04/01]

% 定义模板键值
% 用于格式控制的键值
\keys_define:nn { nju }
{
  titlelength       .int_set:N    =   \nju_titlelength,
  titlelength       .initial:n    =   1,

  secondmentor      .bool_set:N   =   \nju_second_mentor,
  secondmentor      .initial:n    =   false,

  degree            .tl_set:N     =   \nju_degree,
  degree            .initial:n    =   UG,

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

  % 导师
  MentorA           .tl_set:N     =   \nju_mentor_a,
  MentorAEN         .tl_set:N     =   \nju_mentor_a_en,
  MentorATitle      .tl_set:N     =   \nju_mentor_a_title,
  MentorATitleEN    .tl_set:N     =   \nju_mentor_a_title_en,

  % 第二导师
  MentorB           .tl_set:N     =   \nju_mentor_b,
  MentorBEN         .tl_set:N     =   \nju_mentor_b_en,
  MentorBTitle      .tl_set:N     =   \nju_mentor_b_title,
  MentorBTitleEN    .tl_set:N     =   \nju_mentor_b_title_en,

  % 提交日期
  SubmitDate        .tl_set:N     =   \nju_submit_date,
  
  % 答辩
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

% 输入配置文件
\RequirePackage{profile/packages}
\RequirePackage{profile/font}
\RequirePackage{profile/page}
\RequirePackage{profile/reference}
\RequirePackage{profile/components}
\RequirePackage{profile/cover}
\RequirePackage{profile/abstract}
