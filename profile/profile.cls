\ExplSyntaxOn

\cs_new_protected:Npn \profile_input #1 {
    \input{profile/#1}
}

\input{coverinfo.sty}
\profile_input{packages.sty}
\profile_input{format.sty}

\ExplSyntaxOff