% --------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "lab-exercise.cls",
%     version         = "1.0",
%     date            = "01/27/2019",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, lab-exercise",
%     supported       = "jinlibao@outlook.com",
%     docstring       = "A class for MATH 3340/3341 exercise"
% ---------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lab-exercise}[2019/01/27 v1.0 lab-exercise Class]
\LoadClass[11pt,oneside,letter,twoside,usename,dvipsnames,svgnames,table]{article}

\newcommand{\semester}{\ifthenelse{\month<8}{\ifthenelse{\month<6}{Spring}{Summer}}{Fall} \the\year}
\input{meta.tex}
\makeatletter
\let\Author\@author
\let\Title\@title
\makeatother

\RequirePackage{
    afterpage,amsfonts,amsmath,amssymb,amsthm,appendix,array,booktabs,breqn,
    caption,color,enumerate,fancyhdr,float,fontspec,geometry,graphicx,grffile,
    hyperref,hyphenat,ifthen,imakeidx,indentfirst,lastpage,lipsum,listings,
    longtable,makeidx,mathtools,multicol,subcaption,tikz,tikzscale,titlesec,
    titling,verbatim,xcolor,xltxtra,xunicode,
}
% ------------------- fontspec --------------------
% \RequirePackage{fontspec}
% \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase,Numbers=OldStyle}
%\setromanfont{Palatino}
%\setsansfont{Helvetica}
\setmonofont[Scale=MatchLowercase]{Monaco}

% ------------------- algorithm2e -----------------
\RequirePackage[ruled]{algorithm2e}

% ------------------- caption ---------------------
\captionsetup{width=0.95\textwidth}

% ------------------- geometry --------------------
\geometry{
    margin = 1in
}

% ------------------- setlength -------------------
\setlength{\parindent}{0pt}

% ------------------- table alignment -------------
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

% ------------------- amsthms ---------------------
\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{lemma}{Lemma}[section]
\newtheorem{corollary}{Corollary}[section]
\newtheorem{remark}{Remark}[section]
\newtheorem{theorem}{Theorem}[section]
\newtheorem{example}{Example}[section]
\newtheorem{proposition}{Proposition}[section]
\newenvironment{solution}{\begin{proof}[\textsc{Solution}]}{\end{proof}}
\numberwithin{equation}{section}


% ------------------- define \Xint ----------------
\def\Xint#1{\mathchoice
{\XXint\displaystyle\textstyle{#1}}%
{\XXint\textstyle\scriptstyle{#1}}%
{\XXint\scriptstyle\scriptscriptstyle{#1}}%
{\XXint\scriptscriptstyle\scriptscriptstyle{#1}}%
\!\int}
\def\XXint#1#2#3{{\setbox0=\hbox{$#1{#2#3}{\int}$ }
\vcenter{\hbox{$#2#3$ }}\kern-.6\wd0}}
\def\ddashint{\Xint=}
\def\dashint{\Xint-}

% ------------------- hyperref --------------------
\hypersetup{
    %--------------- pdfinfo ------------------
    pdftitle  = {\Title},
    pdfauthor = {\Author},
    pdfsubject= {\Title},
    pdfkeywords={},
    %--------------- links --------------------
    colorlinks= {true},
    linkcolor = {red},
    citecolor = {cyan},
    bookmarks = {false},
    bookmarksnumbered = {true},
    %--------------- pagemode -----------------
    pdffitwindow={true},
    pdftoolbar= {false},
    pdfmenubar= {false},
    pdfpagelayout = {OneColumn},
    pdfstartview = {FitH},
    pdfpagemode = {UseNone},
    %pdfnonfullscreenpagemode = {UseNone}
}

% \allowdisplaybreaks

%------------------- fancyhdr ---------------------
\fancypagestyle{exercise-style}{
    \fancyhf{}
    \fancyhead[LO,RE]{\footnotesize \semester}
    \fancyhead[CO,CE]{\footnotesize \Title}
    \fancyhead[LE,RO]{\footnotesize\thepage\ of \pageref*{LastPage}}
    \pagenumbering{arabic}
}
\fancypagestyle{report-style}{
    \fancyhf{}
    \fancyhead[LO,RE]{\footnotesize \Author}
    \fancyhead[CO,CE]{\footnotesize \Title}
    \fancyhead[LE,RO]{\footnotesize\thepage\ of \pageref*{LastPage}}
    \pagenumbering{arabic}
}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{\markright{\thesubsection \ #1}}

% ------------------- titlesec --------------------
\titleformat{\section}{\scshape\Large}{\thesection}{1em}{}
\titleformat{\subsection}{\scshape\large}{\thesubsection}{1em}{}
\titleformat{\subsection}{\scshape\normalsize}{\thesubsection}{1em}{}
%\renewcommand{\thesection}{\Roman{section}}

\makeatletter
\def\@maketitle{%
  \begin{center}%
  \let \footnote \thanks
  {\bfseries\huge \course\ --- \semester \par \vskip .5em {\LARGE \@title}}
  \end{center}
  \par \vskip .5em}
\makeatother

% ------------------ lstlisting ------------------
\lstset{
    basicstyle={\ttfamily\footnotesize},
    breaklines=true,
    keywordstyle=\color{Red},
    otherkeywords={},
    morekeywords={},
    identifierstyle=\color{darkgray},
    stringstyle=\color{LightCoral},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={int,char,double,float,unsigned,auto},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language={},
}

% Define language diff (using git diff highlighting)
\newcommand{\lstbg}[3][0pt]{{\fboxsep#1\colorbox{#2}{\strut #3}}}
\lstdefinelanguage{diff}{
  basicstyle={\ttfamily\small},
  breaklines=true,
  morecomment=[f][\lstbg{red!20}]-,
  morecomment=[f][\lstbg{green!20}]+,
  morecomment=[f][\color{blue}]{@@},
}

% Define language Golang
\lstdefinelanguage{Golang}%
  {morekeywords=[1]{package,import,func,type,struct,return,defer,panic,%
     recover,select,var,const,iota,},%
   morekeywords=[2]{string,uint,uint8,uint16,uint32,uint64,int,int8,int16,%
     int32,int64,bool,float32,float64,complex64,complex128,byte,rune,uintptr,%
     error,interface},%
   morekeywords=[3]{map,slice,make,new,nil,len,cap,copy,close,true,false,%
     delete,append,real,imag,complex,chan,},%
   morekeywords=[4]{for,break,continue,range,goto,switch,case,fallthrough,if,%
     else,default,},%
   morekeywords=[5]{Println,Printf,Error,Print,},%
   sensitive=true,%
   morecomment=[l]{//},%
   morecomment=[s]{/*}{*/},%
   morestring=[b]',%
   morestring=[b]",%
   morestring=[s]{`}{`},%
}

% Define various styles for different lanuages
\lstdefinestyle{Makefile}{
    basicstyle=\ttfamily,
    breaklines=true,
    keywordstyle=\color{Red},
    otherkeywords={},
    morekeywords={},
    identifierstyle=\color{darkgray},
    stringstyle=\color{darkgray},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={int,char,double,float,unsigned,auto},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language=make,
}

\lstdefinestyle{MATLAB}{
  basicstyle={\ttfamily\small},
  breaklines=true,
  keywordstyle=\color{blue},
  otherkeywords={},
  alsoletter={...},
  morekeywords={break,case,catch,continue,elseif,else,end,for,function,global,
      if,otherwise,persistent,return,switch,try,while,methods,properties,
      events,classdef,...},
  comment=[l]\%,                              % comments
  morecomment=[l]...,                         % comments
  morecomment=[s]{\%\{}{\%\}},                % block comments
  morestring=[m],
  identifierstyle={\color{darkgray}},
  stringstyle={\color{Crimson}},
  commentstyle={\color{gray}},
  showstringspaces=false,
  numberstyle={\footnotesize \color{Black}},
  numbersep=9pt,
  numbers=left,
  emph={int,char,double,float,unsigned,auto},
  emphstyle={\color{Cerulean}},
  frame=single,
  backgroundcolor=\color{White},
  tabsize=4,
  language=MATLAB
}

\lstdefinestyle{C++}{
    basicstyle=\ttfamily,
    breaklines=true,
    keywordstyle=\color{Red},
    otherkeywords={memset},
    morekeywords={>,<,.,;,-,!,=,~},
    identifierstyle=\color{darkgray},
    stringstyle=\color{LightCoral},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={bool,int,char,double,float,unsigned,auto,string,pair,unordered_set,vector},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language=C++,
}

\lstdefinestyle{Plain}{
    basicstyle={\ttfamily\footnotesize},
    breaklines=true,
    keywordstyle=\color{Red},
    otherkeywords={},
    morekeywords={},
    identifierstyle=\color{darkgray},
    stringstyle=\color{LightCoral},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={int,char,double,float,unsigned,auto},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language={},
}

\lstdefinestyle{TeX}{
    basicstyle={\ttfamily\footnotesize},
    breaklines=true,
    keywordstyle=\color{Blue},
    otherkeywords={toprule,midrule,bottomrule},
    morekeywords={},
    identifierstyle=\color{darkgray},
    stringstyle=\color{LightCoral},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={int,char,double,float,unsigned,auto},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language=[LaTeX]{TeX},
}

\lstdefinestyle{C}{
    basicstyle={\ttfamily\footnotesize},
    breaklines=true,
    keywordstyle=\color{Red},
    otherkeywords={},
    morekeywords={},
    identifierstyle=\color{darkgray},
    stringstyle=\color{LightCoral},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={int,char,double,float,unsigned,auto},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language=C,
}

\lstdefinestyle{Python}{
    basicstyle={\ttfamily\footnotesize},
    breaklines=true,
    keywordstyle=\color{Red},
    otherkeywords={},
    morekeywords={},
    identifierstyle=\color{darkgray},
    stringstyle=\color{LightCoral},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={int,char,double,float,unsigned,auto},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language=Python,
}


\lstdefinestyle{Golang}{
    basicstyle={\ttfamily\footnotesize},
    breaklines=true,
    keywordstyle=\color{Red},
    otherkeywords={},
    morekeywords={},
    identifierstyle=\color{darkgray},
    stringstyle=\color{LightCoral},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={int,char,double,float,unsigned,auto},
    emphstyle={\color{Cerulean}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language=Golang,
}

\lstdefinestyle{diff}{
    basicstyle={\ttfamily},
    breaklines=true,
    keywordstyle=\color{black},
    otherkeywords={},
    morekeywords={},
    identifierstyle=\color{black},
    stringstyle=\color{black},
    commentstyle=\color{gray},
    showstringspaces=false,
    numberstyle={\footnotesize \color{Black}},
    numbersep=9pt,
    numbers=left,
    emph={},
    emphstyle={\color{black}},
    frame=single,
    backgroundcolor=\color{White},
    tabsize=4,
    language=diff,
}
