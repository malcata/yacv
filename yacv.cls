\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yacv}[2012/03/14 class for cv documents]

% == Declare class options

% == Language ===
\DeclareOption{pt}{%
  \let\@language=0%
  \PassOptionsToPackage{english,portuguese}{babel}}

\DeclareOption{en}{%
  \let\@language=1%
  \PassOptionsToPackage{portuguese,english}{babel}}

% == Document Type == %
\DeclareOption{article}{%
  \let\@baseclass=0%
}
\DeclareOption{book}{%
  \let\@baseclass=1%
}

% == Layout == %
%% need to find out out to inject this option in the articles
\DeclareOption{portrait}{%
  \let\@baseclass=0%
}
\DeclareOption{landscape}{%
  \let\@baseclass=1%
}

% == Default Options ===
\ExecuteOptions{en}
\ProcessOptions

%%%

% == Load base class == %
\LoadClass[11pt,a4paper]{article}

% == Required Packages == %

\RequirePackage{ifthen}
\RequirePackage{verbatim}

\usepackage{eurosym}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{babel}

\RequirePackage{color}
\RequirePackage[usenames,dvipsnames,table]{xcolor}
\definecolor{cvcolor}{RGB}{0,130,170}
\colorlet{cvdarkcolor}{MidnightBlue!80!black}

\RequirePackage[top=2cm,bottom=3cm,inner=2cm,outer=2cm]{geometry}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\gdef\@pagestyle{fancy} %pagestyle definition

\RequirePackage{setspace}

\usepackage{enumitem}
\setlist{nolistsep} % or \setlist{noitemsep} to leave space around whole list

\RequirePackage{graphicx}

\RequirePackage[pdftex,breaklinks,hidelinks,pdfdisplaydoctitle]{hyperref}

\RequirePackage{tabularx}

% == Redefine macros for PDF integration == %
\def\title#1{%
  \gdef\@title{#1}
  \hypersetup{pdftitle={\@title}}}
\def\@title{~title \@notdefined}

\def\author#1{%
  \gdef\@author{#1}
  \hypersetup{pdfauthor={\@author}}}

\def\contenttype#1{%
  \gdef\@contenttype{#1}}

%\synctex=1

%% == Redefine titlepage == %
%\renewcommand\maketitle{
%	\thispagestyle{empty}
%%	\newpage
%	\@maketitle
%}

% == Define pagestyle == %
\pagestyle{\@pagestyle}

% == Define header and footer == %
\setlength{\headheight}{50pt}
\lhead{ \@contenttype }
\rhead{ \@author }

\cfoot{\bfseries\thepage / \pageref{LastPage}}
%%%

% == Define font family  == %
\renewcommand*{\familydefault}{\sfdefault}
\fontseries{l}

% == Define sections == %
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}

% == Paragraph settings == %%
\parindent=0pt % disables indentation
\parskip=2pt % adds vertical space between paragraphs

%% == cv highligh == %%
%% highligh elements for table headers, titles, subtitles, etc %%
\newcommand{\cvgray}{\rowcolor[gray]{.90}}

%% == cv item == %%
%% new layout item to organize data below section, 2 columns, date and content %%
\newcommand{\cvitem}[2]{\begin{minipage}[t]{0.13\textwidth}#1\end{minipage}\begin{minipage}[t]{0.87\textwidth}#2\end{minipage}\par}
%% for short dates like, from year from "1999 - 2000" or month abreviations and year "Oct. 1910" %%
\newcommand{\cvitemshort}[2]{\begin{minipage}[t]{0.13\textwidth}#1\end{minipage}\begin{minipage}[t]{0.87\textwidth}#2\end{minipage}\par}
%% for longer dates, where start month year and finish month year is required %%
\newcommand{\cvitemlong}[2]{\begin{minipage}[t]{0.23\textwidth}#1\end{minipage}\begin{minipage}[t]{0.77\textwidth}#2\end{minipage}\par}

%% == cv table == %%
%% new layout item to organize data inside sections or not, in a table like format  %%
\newcommand{\cvtable}[3]{\begin{tabularx}{0.95\textwidth}{p{194pt}X}\hline \cvgray #1 & #2\\\hline#3\hline\end{tabularx}}

%% == spacing == %%
\newcommand{\cvspace}{\vspace{.2cm}}

%% superscript macros %%
%\newcommand{\th}[0]{\textsuperscript{th}}
\newcommand{\st}[0]{\textsuperscript{st}}
\newcommand{\nd}[0]{\textsuperscript{nd}}
\newcommand{\rd}[0]{\textsuperscript{rd}}
\newcommand{\registered}[0]{\textsuperscript{\textregistered}}
\newcommand{\tm}[0]{\textsuperscript{\texttrademark}}


