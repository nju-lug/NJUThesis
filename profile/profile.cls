\ExplSyntaxOn

\cs_new_protected:Npn \profile_input #1 {
    \input{profile/#1}
}

\profile_input{command.tex}
\profile_input{packages.tex}
\profile_input{format.tex}

\ExplSyntaxOff