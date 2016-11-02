\NeedsTeXFormat{LaTeX2e}[1995/12/01] % Sorry, wir brauchen LaTeX2e!
\ProvidesClass{thesis}[2004/03/16 Masterarbeit]

%% Options
% Optionen:
% draft - Läßt Titelseite, Inhaltsverzeichnis, Index, etc. weg.
%         Dafür muß allerdings die Unterstützung in der LaTeX Hauptdatei
%         vorhanden sein (\ifnotdraft{\include{bla...}}).
% noapp - Lässt den Appendix weg
\DeclareOption{draft}{\let\@draft\@empty}
\DeclareOption{noapp}{\let\@noapp\@empty}
%% Modifications
\let\@draft\@undefined %no draft
\let\@noapp\@undefined %no appendix
\DeclareOption{oneside}{\PassOptionsToClass{oneside}{book}}
\ProcessOptions

\LoadClass[a4paper,12pt,final]{book} % diese Klasse basiert auf ``book''

%% New Commands
\newcommand{\ifnotdraft}[1]{\ifx\@draft\@undefined #1 \fi}
\newcommand{\ifnotdraftelse}[2]{\ifx\@draft\@undefined #1 \else #2 \fi}

\newcommand{\ifnoapp}[1]{\ifx\@noapp\@undefined #1 \fi}
\newcommand{\ifnoappelse}[2]{\ifx\@noapp\@undefined #1 \else #2 \fi}


%\newenvironment{jmeitemize}{%
  %\renewcommand{\labelitemi}{$\cdot$}%
%  \renewcommand{\parsep}{1cm}
%  \begin{itemize}}{\end{itemize}}



%% Zusätzliche Befehle
%% pagestyle fuer Titelseite:
\def\titlehead#1{\def\@titlehead{#1}}
\def\titlefoot#1{\def\@titlefoot{#1}}
\def\@titlehead{}
\def\@titlefoot{}

\def\ps@title{%
\headheight 15mm
\footskip   0cm
\addtolength{\textheight}{-15mm}
\let\@mkboth\@gobbletwo%
  \def\@oddhead{\vbox{\hbox to\textwidth{\@titlehead}
                \vskip 1.5mm
                }}
  \def\@oddfoot{\vbox{
                \hbox to\textwidth{\@titlefoot}}}
  \let\@evenhead\@oddhead
  \let\@evenfoot\@oddfoot
}

\renewenvironment{titlepage}
{%
  \let\oldheadheight\headheight
  \let\oldfootskip\footskip
  \let\oldtextheight\textheight

   \cleardoublepage
   \if@twocolumn
      \@restonecoltrue\onecolumn
   \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{title}%
    \setcounter{page}\@ne
}%
{\if@restonecol\twocolumn \else \newpage \fi
 \if@twoside\else
    \setcounter{page}\@ne
 \fi
 \let\headheight\oldheadheight
 \let\textheight\oldtextheight
 \let\footskip\oldfootskip
}

%% Simulab Marke

\newcommand{\SIMXS}{%
\mbox{{\textsf{%
\raisebox{-1pt}{{\normalsize S}}%
\hspace{-1.5pt}{\texttt {\footnotesize i}}%
\hspace{-2pt}\raisebox{1pt}{\scriptsize{M}}%
\hspace{-1pt}{\footnotesize u}%
\hspace{-1pt}\raisebox{-1pt}{{\footnotesize{L}}}%
\hspace{-4pt}\raisebox{1pt}{\scriptsize{a}}%
\hspace{-1pt}\raisebox{0pt}{\scriptsize{B}}%
}}}}

\newcommand{\SIMS}{%
\mbox{{\textsf{%
\raisebox{-1pt}{{\large S}}%
\hspace{-1.5pt}{\texttt {\small i}}%
\hspace{-2pt}\raisebox{1pt}{\footnotesize{M}}%
\hspace{-1pt}{\normalsize u}%
\hspace{-1pt}\raisebox{-1pt}{{\normalsize{L}}}%
\hspace{-4pt}\raisebox{1pt}{\small{a}}%
\hspace{-1pt}\raisebox{0pt}{\small{B}}%
}}}}

\newcommand{\SIM}{%
\mbox{{\textsf{%
\raisebox{-1pt}{{\Large S}}%
\hspace{-1.5pt}{\texttt {\normalsize i}}%
\hspace{-2pt}\raisebox{1pt}{\small{M}}%
\hspace{-1pt}{\large u}%
\hspace{-1pt}\raisebox{-1pt}{{\large L}}%
\hspace{-4pt}\raisebox{1pt}{\normalsize{a}}%
\hspace{-1pt}\raisebox{0pt}{\normalsize{B}}%
}}}}

\newcommand{\SIML}{%
\mbox{{\textsf{%
\raisebox{-1pt}{{\LARGE S}}%
\hspace{-1.5pt}{\texttt {\large i}}%
\hspace{-2pt}\raisebox{1pt}{\normalsize{M}}%
\hspace{-1pt}{\Large u}%
\hspace{-1pt}\raisebox{-1pt}{{\Large L}}%
\hspace{-4pt}\raisebox{1pt}{\large{a}}%
\hspace{-1pt}\raisebox{0pt}{\large{B}}%
}}}}

\newcommand{\SIMXL}{%
\mbox{{\textsf{%
\raisebox{-1pt}{{\huge S}}%
\hspace{-1.5pt}{\texttt {\Large i}}%
\hspace{-2pt}\raisebox{1pt}{\large{M}}%
\hspace{-1pt}{\LARGE u}%
\hspace{-1pt}\raisebox{-1pt}{{\LARGE L}}%
\hspace{-4pt}\raisebox{1pt}{\Large{a}}%
\hspace{-1pt}\raisebox{0pt}{\Large{B}}%
}}}}

\newcommand{\SIMXXL}{%
\mbox{{\textsf{%
\raisebox{-1pt}{{\Huge S}}%
\hspace{-1.5pt}{\texttt {\LARGE i}}%
\hspace{-2pt}\raisebox{1pt}{\Large{M}}%
\hspace{-1pt}{\huge u}%
\hspace{-1pt}\raisebox{-1pt}{{\huge L}}%
\hspace{-4pt}\raisebox{1pt}{\LARGE{a}}%
\hspace{-1pt}\raisebox{0pt}{\LARGE{B}}%
}}}}

\newcommand{\SIMBXS}{%
{\bf \SIMXS}}

\newcommand{\SIMBS}{%
{\bf \SIMS}}

\newcommand{\SIMB}{%
{\bf \SIM}}

\newcommand{\SIMBL}{%
{\bf \SIML}}

\newcommand{\SIMBXL}{%
{\bf \SIMXL}}

\newcommand{\SIMBXXL}{%
{\bf \SIMXXL}}
