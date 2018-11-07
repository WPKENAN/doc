
\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{whucls}[2003/01/10 Derived from the `book' class]
\newif\ifPhD\PhDtrue


\DeclareOption{phd}{\PhDtrue}
\DeclareOption{master}{\PhDfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[openany,oneside]{book}[1996/10/31]
\RequirePackage{cctbase,ccmap,CCTfntef}[2003/01/10]
\RequirePackage{ifpdf}



\newcommand\midmatter{%
    \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}}
%------------------------ Page layout ----------------------------------
\usepackage[top=2.7truecm,bottom=2.9truecm,
            left=2.8truecm,right=2.5truecm,
            %includehead,%includefoot,
            dvipdfm]{geometry}    % ҳ������%


%
%----------------------- Redefine names----------------------------------
\renewcommand\contentsname{\ziju{2}Ŀ¼}
\renewcommand\listfigurename{��ͼĿ¼}
\renewcommand\listtablename{����Ŀ¼}
\renewcommand\indexname{����}
\renewcommand\figurename{\rm ͼ}
\renewcommand\tablename{\bf ��}
\renewcommand\partname{��\ccnospace{\CS\chnno{part}\CS}����}
\renewcommand\chaptername{��\ccnospace{\CS\chnno{chapter}\CS}��}
\renewcommand\appendixname{��¼\ccnospace{\CS\chnno{chapter}}}


\newtoks\displaytitle
\def\fenleihao#1{\def\@fenleihao{#1}}
%\newtoks\fenleihao      %��ͼ�����
\newtoks\bianhao         %ѧУ���
\newtoks\UDC             %������ʮ���Ʒ��෨UDC�������
\newtoks\miji            %�ܼ�
\newtoks\lunwenleixing   %��______ѧ˶ʿѧλ���ģ�
                         %��ͬ��ѧ������______ѧ˶ʿѧλ���ģ�
                         %�۹���˶ʿѧλ���ģ�
                         %��______ѧ��ʿѧλ���ģ�
                         %��ͬ��ѧ������______ѧ��ʿѧλ����
%\newtoks\xueweileixing  %˶ʿ����ʿ
\newtoks\zuozheleixing   %��ʿ����˶ʿ����������
\newtoks\zhuanye         %ѧ��רҵ
\newtoks\fangxiang       %�о�����
\newtoks\jiaoshi         %ָ����ʦ������ְ��




%===============================================ҳü����=====================================================%
\pagestyle{empty}
\def\ps@headings{%
%    \def\@evenhead{\pushziti{\zihao{5}\songti
%      \vbox{\hbox to\textwidth{\hfil {��\ ��\  ��\ ѧ\  ˶\ ʿ\  ѧ\ λ\ ��\ ��} \hfil}
%      \protect\vspace{2truemm}\relax
%      \hrule depth0pt height0.4truemm width\textwidth
%       \protect\vspace{0.4truemm}\relax
%      %\hrule depth0pt height0.4truemm width\textwidth
%    }}\popziti}
%    \def\@oddhead{\pushziti{\zihao{5}\songti
%      \vbox{\hbox to\textwidth{\hfil {��\ ��\  ��\ ѧ\  ˶\ ʿ\  ѧ\ λ\ ��\ ��} \hfil}
%      \protect\vspace{2truemm}\relax
%      \hrule depth0pt height0.4truemm width\textwidth
%      \protect\vspace{0.4truemm}\relax
%      %\hrule depth0pt height0.4truemm width\textwidth
%    }}\popziti}
     \def\@oddfoot{\pushziti{\zihao{5}\songti
      \vbox{\hbox to\textwidth{\hfil ��~\thepage~ҳ\hfil}
        \protect\vspace{0.8em}\relax
        %\hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}%
    \def\@evenfoot{\pushziti{\zihao{5}\songti
      \vbox{\hbox to\textwidth{\hfil ��~\thepage~ҳ\hfil}
        \protect\vspace{0.8em}\relax
       % \hrule depth0pt height0.4truemm width\textwidth
    }}\popziti}%

    \let\@mkboth\@gobbletwo
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {%                         !!!
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \chaptername \ \ %             !!!
          \fi
        \fi
        ##1}{}}
    }
\ps@headings
%%========================================����================================================================
\def\maketitle{%
  \null
  \thispagestyle{empty}%
  %\vspace*{-2cm}
  \begin{center}\leavevmode
    {\fangsong \zihao{4}%
    \begin{tabular}{lp{2cm}p{5cm}lp{2cm}l}
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{��\ ��\ ��}} & {}\hfill\raisebox{-0.5ex}[0pt]{\@fenleihao}\hfill{} &  & \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{��\ ��}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\miji}\hfill{} & \\ \cline{2-2}\cline{5-5}
      \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{U\ D\ C} } & {}\hfill\raisebox{-0.5ex}[0pt]{\the\UDC}\hfill{}      &  & \raisebox{-0.5ex}[0pt]{\makebox[1.5cm][s]{��\ ��}} & {}\hfill\raisebox{-0.5ex}[0pt]{\the\bianhao}\hfill{}   & \\ \cline{2-2}\cline{5-5}
    \end{tabular}
    }
    \par
    \vspace*{2.1cm} %����հ�
    {\songti \zihao{2} \makebox[6cm][s]{�人��ѧ}\\[3mm] \makebox[9.5cm][s]{\ifPhD ��ʿ\else ˶ʿ\fi ѧλ����}}\\
    \vspace{2.6cm}
    {\kaishu \zihao{1} \@title \par}%
%    \vspace{4cm}
     \vfill\vfill\vfill
    {\songti\zihao{4}
    \begin{tabular}{cp{5.5cm}c}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{��\hfill ��\hfill ��\hfill ��\hfill ����}} & {\songti {}\raisebox{-3ex}[0pt]{\@author}\hfill{}} & \\[3ex]  %\cline{2-2}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{ָ\hfill ��\hfill ��\hfill ʦ\hfill ��\hfill ����\hfill ְ\hfill �ƣ�}} & {\songti {}\raisebox{-3ex}[0pt]{\the\jiaoshi}\hfill{}} & \\[3ex] % \cline{2-2}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{ѧ\hfill ��\hfill ר\hfill ҵ\hfill ��\hfill �ƣ�}} & {\songti {}\raisebox{-3ex}[0pt]{\the\zhuanye}\hfill{}} & \\[3ex] %\cline{2-2}
      \raisebox{-3ex}[0pt]{\makebox[4.5cm][s]{��\hfill ��\hfill ��\hfill ��}} & {\songti{}\raisebox{-3ex}[0pt]{\the\fangxiang}\hfill{}} & \\[3ex]  %\cline{2-2}
     \end{tabular}
    }
    \par
    \vspace{2.6cm}
    {
%    {\heiti \zihao{3} \the\year~�� ~\the\month~�� ~\the\day~�� \par}%
    {\heiti \zihao{3} \@date \par}%
    }
    %\vspace*{-0.7cm}
  \end{center}%
  \null
  \cleardoublepage
  %\input{declaration}
  }
%%%=======================================================================================================
\def\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\thispagestyle{headings}%
        \contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
    }


%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{ժҪ}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{\pushziti {\heiti\zihao{-4}\cnkeywordsname��}#1\popziti}
\newcommand\cnkeywordsname{�ؼ���}
\newcommand\enkeywords[1]{\pushziti {\bfseries\zihao{-4}\enkeywordsname��}#1\popziti}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{\pushziti
    \newpage
    \chapter[\cnabstractname]{\ziju{2}{\cnabstractname}}   %%%���ڽ������ǩ��������� 2005-04-12.huangzh
    \fangsong\zihao{-4}
    \@afterheading}
    {\par\popziti}

\newenvironment{enabstract}{\pushziti
    \newpage
    \chapter{\enabstractname}
    \songti\zihao{-4}
    \@afterheading}
    {\par\popziti}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define part
\def\@part[#1]#2{%
    \thispagestyle{empty}%                       !!!
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
%org  \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
      \addcontentsline{toc}{part}{\partname\hspace{1em}#1}%   !!!
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
%org   \huge\bfseries \partname~\thepart
       \Huge\bfseries \partname%         !!!
       \par
       \vskip 20\p@
     \fi
     \Huge\bfseries #2\par}%
    \@endpart}

\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
%                    \thispagestyle{plain}%
                    \thispagestyle{headings}%     %    mzy
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

% Define chapter
\def\@chapter[#1]#2{%
                    \ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp \space \thechapter.}%
                         \addcontentsline{toc}{chapter}%
%org                               {\protect\numberline{\thechapter}#1}%
                                   {\protect\numberline{\chaptername}#1}%  !!!
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@chapapp{Chapter}%                   !!!
\def\@makechapterhead#1{%
%org  \vspace*{50\p@}%
%org  {\parindent \z@ \raggedright \normalfont
%org    \ifnum \c@secnumdepth >\m@ne
%org      \if@mainmatter
%org        \huge\bfseries \@chapapp\space \thechapter
%org        \par\nobreak
%org        \vskip 20\p@
%org      \fi
%org    \fi
%org    \interlinepenalty\@M
%org    \Huge \bfseries #1\par\nobreak
%org    \vskip 40\p@
  \vspace*{-\headsep}\vspace*{-\headheight}\vspace*{15\p@}%      !!!
  { \normalfont \centering%                                      !!!
    \ifnum \c@secnumdepth >\m@ne%                                !!!
      \if@mainmatter%                                            !!!
        \Large\bfseries \chaptername \quad #1 \par\nobreak%      !!!
      \else%                                                     !!!
        \Large\bfseries #1 \par\nobreak%                         !!!
      \fi%                                                       !!!
    \fi%                                                         !!!
    \vskip 15\p@%                                                !!!
  }}
\def\@makeschapterhead#1{%
%org  \vspace*{50\p@}%
%org  {\parindent \z@ \raggedright
%org    \normalfont
%org    \interlinepenalty\@M
%org    \Huge \bfseries  #1\par\nobreak
%org    \vskip 40\p@
  \vspace*{-\headsep}\vspace*{-\headheight}\vspace*{15\p@}%   !!!
  {\normalfont \centering%                                    !!!
    \interlinepenalty\@M%                                     !!!
    \Large \bfseries  #1\par\nobreak%                         !!!
    \vskip 15\p@%                                             !!!
  }}

% Change definition of section
\renewcommand\section{\@startsection
            {section}{2}{\z@}%   {name}{depth}{}
                {3.5ex \@plus 1ex \@minus .2ex}% positive->leave parindent
                {2.3ex \@plus.2ex}%
                {\reset@font\fontsize{13.75pt}{\baselineskip}\selectfont\bfseries\sectionformat}}
\newcommand\sectionname{\S\,\thechapter.\arabic{section}}
\newcommand\sectionformat{\centering}

% Change definition of \subsection
\renewcommand\subsection{\@startsection
            {subsection}{3}{\z@}%   {name}{depth}{}
                {1.75ex \@plus 0.5ex \@minus .1ex}% positive->leave parindent
                {1.15ex \@plus.1ex}%
                {\reset@font\normalsize\bfseries\subsectionformat}}
\newcommand\subsectionname{\thechapter.\arabic{section}.\arabic{subsection}}
\newcommand\subsectionformat{}

% Change definition of \subsubsection
\renewcommand\subsubsection{\@startsection
            {subsubsection}{4}{\z@}%   {name}{depth}{}
                {1.75ex \@plus 0.5ex \@minus .1ex}% positive->leave parindent
                {1.15ex \@plus.1ex}%
                {\reset@font\normalsize\bfseries\subsubsectionformat}}
\newcommand\subsubsectionname{\S\thechapter.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\newcommand\subsubsectionformat{}

% Set maxi. depth of numbered sections to 4 (\subsubsection).
\setcounter{secnumdepth}{4}

%
% Change definition of \appendix
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \renewcommand\@chapapp{Appendix}
  \renewcommand\thechapter{\Alph{chapter}}%
  \renewcommand\chaptername{\appendixname}}%

%----------------------- Bibliography -------------------------------
\renewcommand\bibname{�ο�����}
\renewenvironment{thebibliography}[1]
     {\def\chaptername{}\chapter[\bibname]{\ziju{0.5}\bibname}%                            !!!
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \small%                                               !!!
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
%%%%%-----------����( multicols ��ʽ)----------
  \usepackage{makeidx}
  \newcommand{\URL}[1]{\href{#1}{\texttt{\itshape #1\/}}}
  \usepackage{multicol}
  \makeatletter
  \renewenvironment{theindex}
               {\let\chapternamesave\chaptername
        \renewcommand{\chaptername}{\hskip-1em}%
        \def\chaptername{}\chapter[\indexname]{\ziju{2}\indexname} % 2005-06-15 huangzh
        %\addcontentsline{toc}{chapter}{\indexname}%   !!!
        \begin{multicols}{2}%[\chapter{\indexname}\vspace*{1cm}]
        \leftskip=2cm
                \markboth{\indexname}{\indexname}%
                \thispagestyle{plain}\parindent 0pt
                \parskip0pt plus .3pt\relax
                \let\item\@idxitem}
               {\end{multicols}\let\chaptername\chapternamesave}
  \makeatother      
%%------------------------���ú��-----------------------------------
\RequirePackage{amsmath,amssymb}
\RequirePackage[amsmath,thmmarks]{ntheorem}% AMSLaTeX���.
\RequirePackage{color,xcolor}                  %֧�ֲ�ɫ
\RequirePackage{mathrsfs}   % ��ͬ��\mathcal or \mathfrak ֮���Ӣ�Ļ�������

%%----------------------- Theorems -----------------------------------
\theoremstyle{plain}
\theoremheaderfont{\heiti}
\theorembodyfont{\songti} \theoremindent0em
\theoremseparator{\hspace{1em}} \theoremnumbering{arabic}
%\theoremsymbol{} %��������ʱ�Զ����ӵı�־
\newtheorem{theorem}{\hspace{2em}����}[section]
\newtheorem{definition}{\hspace{2em}����}[section]
\newtheorem{lemma}{\hspace{2em}����}[section]
\newtheorem{corollary}{\hspace{2em}����}[section]
\newtheorem{proposition}{\hspace{2em}����}[section]
\newtheorem{example}{\hspace{2em}��}
\newtheorem{remark}{\hspace{2em}ע}

\theoremstyle{nonumberplain}
\theoremheaderfont{\heiti}
\theorembodyfont{\normalfont \rm \songti}
\theoremindent0em \theoremseparator{\hspace{1em}}
\theoremsymbol{$\blacksquare$}
\newtheorem{proof}{\hspace{2em}֤��}

%----------------------- Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{��������Ŀ¼}\begin{thebibliography}{#1}}
  {\end{thebibliography}}

%----------------------- Acknowledgement ----------------------------
\newcommand\acknowledgement{\backmatter\chapter[��л]{\ziju{2}��л}}

\endlinechar `\^^M
\endinput