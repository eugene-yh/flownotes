% Identifiers
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{flownotes}

% build on top of article document class
\LoadClass[symmetric]{tufte-book}


%----languages and fonts----%
\usepackage{xeCJK}
\usepackage{xeCJKfntef}
\usepackage{fontspec}
%%%%%set Latin fonts
\setmainfont{Bembo}[Path=./fonts/latin/serif/, UprightFont=*-Regular, BoldFont=*-Bold, ItalicFont=*-Italic]
\setsansfont{GillSans}[Path=./fonts/latin/sans/,UprightFont=*-Regular, BoldFont=*-Bold, ItalicFont=*-Italic]
\setmonofont{Menlo}[Path=./fonts/latin/mono/,UprightFont=*-Regular, BoldFont=*-Bold, ItalicFont=*-Italic]

%%%%%set CJK fonts
\setCJKmainfont{SourceHanSerif}[Path=./fonts/cjk/SourceHanSerif/,Language=Chinese Simplified,UprightFont=*-Regular, BoldFont=*-Bold, ItalicFont=*-ExtraLight]
\setCJKfamilyfont{sourcehansans}[Path=./fonts/cjk/SourceHanSans/,Language=Chinese Simplified,UprightFont=*-Regular,BoldFont=*-Bold, ItalicFont=*-Light]{SourceHanSans}
\setCJKfamilyfont{sourcehanmono}[Path=./fonts/cjk/SourceHanMono/,Language=Chinese Simplified,UprightFont=*-Regular,BoldFont=*-Bold, ItalicFont=*-Light]{SourceHanMono}
\newcommand{\sansall}{\CJKfamily+{sourcehansans}}
\newcommand{\coding}{\ttfamily\CJKfamily{sourcehanmono}}
\newcommand{\sans}{\sffamily\CJKfamily{sourcehansans}}

%%%%%change CJK glyph forms
\newcommand{\jp}{\addCJKfontfeatures{Language=Japanese}}
\newcommand{\kr}{\addCJKfontfeatures{Language=Korean}}
\newcommand{\sch}{\addCJKfontfeatures{Language=Chinese Simplified}}
\newcommand{\tch}{\addCJKfontfeatures{Language=Chinese Traditional}}

%%%%%coding
\usepackage{listings}

%%%%%Japanese Furigana / Chinese Pinyin
\usepackage[CJK,overlap]{ruby}
% position of Furigana: below/right
% \renewcommand{\rubysep}{-3.9ex}
\renewcommand{\rubysep}{-0.7ex}
% \onehalfspacing
% \XeTeXlinebreaklocale &quot;ja&quot;
% \XeTeXlinebreakskip=0em plus 0.1em minus 0.01em

%%%%%Vertical CJK texts
\newcommand{\cjkvert}[3][\sch]
{
\begin{center}
    \rotatebox{-90}{
    \begin{minipage}{#2}
    #1\addCJKfontfeatures{RawFeature=vertical}
        #3
    \end{minipage}
    }
\end{center}
}



%----note boxes----%
\usepackage{tcolorbox}
\tcbuselibrary{skins}
\tcbuselibrary{breakable}
\usepackage{varwidth}
\newtcolorbox{notebox}[2][]{enhanced,skin=enhancedlast jigsaw,
breakable,
fontupper=\rmfamily,
fontlower=\rmfamily,
attach boxed title to top left={xshift=-4mm,yshift=-0.5mm},
fonttitle=\sans,varwidth boxed title=0.7\linewidth,
colbacktitle=blue!45!white,colframe=red!50!black,
colback=white,
boxed title style={empty,arc=0pt,outer arc=0pt,boxrule=0pt},
underlay boxed title={
\fill[red!65!white] (title.north west) -- (title.north east)
-- +(\tcboxedtitleheight-1mm,-\tcboxedtitleheight+1mm)
-- ([xshift=4mm,yshift=0.5mm]frame.north east) -- +(0mm,-1mm)
-- (title.south west) -- cycle;
\fill[red!45!white!50!black] ([yshift=-0.5mm]frame.north west)
-- +(-0.4,0) -- +(0,-0.3) -- cycle;
\fill[red!45!white!50!black] ([yshift=-0.5mm]frame.north east)
-- +(0,-0.3) -- +(0.4,0) -- cycle; },
subtitle style={boxrule=0pt,colback=blue!55!white},
title={#2}, #1}

%----usages of margins----%
\usepackage{tikz,xparse}
% #1 = offset downwards (optional)
% #2 = id (integer), 
% #3 = color, 
% #4 = note text
\newcommand{\rfnote}[4][0cm]
{\marginnote[5pt]{
    % place the end point of the arrow from in-text texts
    \begin{tikzpicture}[remember picture, overlay]
        \draw (-18pt,\lineskip-\dp\strutbox-0cm-#1) coordinate (inText-#2);
    \end{tikzpicture}
    % box that surrounds the note text
    \begin{tcolorbox}[colback=white,boxrule=0.2mm,left=0mm,right=0mm,top=0mm,bottom=0mm,colframe=#3!25]
        #4
    \end{tcolorbox}
    % place the end point of the arrow from in-margin texts 
    \begin{tikzpicture}[remember picture, overlay]
        \draw (-15pt,-\lineskip+\dp\strutbox+5pt) coordinate (inMargin-#2);
    \end{tikzpicture}
    }
}

% #1 = id (integer), #2 = color, #3 = highlighted text
\newcommand{\markintext}[3]
{   % highlight texts
    % \colorlet{foo}{#2!05}\sethlcolor{foo}\texthl{#3}
    \highlight[#2]{#3}
    % draw the arrow from in-text texts to an rfnote
    \begin{tikzpicture}[remember picture, overlay]
        \draw[#2!25,thick,<-] (inText-#1) -- ++(-0.#1\marginparsep,0)
        |- (-3pt,\lineskip-\dp\strutbox);
    \end{tikzpicture}
}

% #1 = id (integer), #2 = color, #3 = highlighted text
\newcommand{\markinmargin}[3]
{   % highlight texts
    \highlight[#2]{#3}
    % draw the vertical arrow from in-margin texts to an rfnote
    \begin{tikzpicture}[remember picture, overlay]
        \node (A) at (-5pt,\lineskip-\dp\strutbox+5pt) {};
        \draw[#2!25,thick,<-, to path={-| (\tikztotarget)}] (A|- inMargin-#1) edge (A);
\end{tikzpicture}
}

%----terminology/concept list----%


%----name - explanation/definition - examples----%
\newcommand{\concept}[3]
{
\begin{tcolorbox}[enhanced,skin=bicolor,boxrule=0mm,colupper=white,collower=blue!65!white,colback=blue!45!white,colbacklower=white,fontupper=\sans,fontlower=\sans,drop midday shadow,colbacktitle=red!50!white,attach boxed title to top left={yshift=-2mm, xshift=-2mm},boxed title style={boxrule=1pt,colframe=white},fonttitle=\sans,title=#1]
#2
\tcblower
#3
\end{tcolorbox}
}

%----list grouping----%
\usetikzlibrary{decorations.pathreplacing,}
\newcommand{\tikzmark}[1]{\tikz[baseline={(#1.base)},overlay,remember picture] \node[outer sep=0pt, inner sep=0pt] (#1) {\phantom{A}};}

%% syntax
%%%\mybrace{<first>}{<second>}[<Optional text>]
\NewDocumentCommand\merge{mmo}{%
\IfValueTF {#3}{%
\begin{tikzpicture}[overlay, remember picture,decoration={brace,amplitude=1ex}]
  \draw[decorate,thick] (#1.north east) -- (#2.south east) node[midway, right=0.1cm] {$=$}node[midway, right=0.5cm,text=black,text width = 2in,] {{#3}};
\end{tikzpicture}%
}%
{%
\begin{tikzpicture}[overlay, remember picture,decoration={brace,amplitude=1ex}]
  \draw[decorate,thick] (#1.north east) -- (#2.south east);
\end{tikzpicture}%
}%
}%
\newenvironment{fork}
    {\(
    \left\{ \quad
    \begin{minipage}[c]{0.3\linewidth}
    }
    { 
    \end{minipage}
    \right.
    \)
    }
%----Q&A----%
\newcommand{\qa}[3][1]
{
\begin{tcolorbox}[enhanced,skin=bicolor,boxrule=0mm,colupper=white,collower=blue!65!white,colback=blue!65!white,colbacklower=white,fontupper=\sans,fontlower=\sans,drop midday shadow]
Q#1: #2
\tcblower
A#1: #3
\end{tcolorbox}
}

%----commonly used graphs and tables----%
\usepackage{booktabs}
\usepackage{graphicx}

%----maths-----%
\usepackage{amsmath}

%----coding blocks----%
\lstnewenvironment{latexblock}[3]{\lstset{language=[LaTeX]{TeX},alsoletter={\\},emph={\\,/,#1},emphstyle=\color{lime!60!black},alsoletter={/},basicstyle=\coding,commentstyle=\color{gray},frameround=fttt,frame=trBL,morekeywords={#2},keywordstyle=\color{blue}\bfseries}#3}{}

%----text emphasis----%
\newcommand{\strikethrough}[2][red]
{\CJKsout[thickness=1pt, format=\color{#1}, height=0.3em]{#2}
}
\newcommand{\crossout}[2][red]
{\CJKxout[format=\color{#1}]{#2}
}
\renewcommand{\underline}[2][red]
{\CJKunderline[format=\color{#1}]{#2}
}
\newcommand{\underdot}[2][red]
{\CJKunderdot[format=\bfseries\color{#1}]{#2}
}
\newcommand{\underwave}[2][red]
{\CJKunderwave[format=\color{#1}]{#2}
}
\newcommand{\undertriangle}[2][red]
{\CJKunderanysymbol[sep=0.1em]{0.2em}{\color{#1}\tiny$\triangle$}{{#2}}
}
\newcommand{\undercircle}[2][red]
{\CJKunderanysymbol[sep=0.1em]{0.2em}{\color{#1}\tiny$\circ$}{{#2}}
}
\newcommand{\undercross}[2][red]
{\CJKunderanysymbol[sep=0.1em]{0.2em}{\color{#1}\tiny$\times$}{{#2}}
}
\newcommand{\highlight}[2][red]
{\CJKsout*[thickness=2.5ex, format=\color{#1!05}]{#2}
}
\newcommand{\underdbline}[2][red]
{\CJKunderdblline[format=\color{#1}]{#2}
}

%----others----%
\usepackage{lipsum}
\usepackage{metalogo} % for printing \xelatex
\usepackage{hyperref} % for \url
\newcommand{\noteurl}[2][url]
{\href{#2}{\color{magenta}\coding #1}}



%----quantum computing----%
\usepackage{braket}
