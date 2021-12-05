\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myrep}

\LoadClass[a4paper]{article}
\RequirePackage[utf8]{inputenc}     %Unicode
\RequirePackage{xeCJK}              %中文

\RequirePackage[usenames,svgnames,dvipsnames]{xcolor}	%颜色

\RequirePackage{wrapfig}            %图文混排（环绕）      
\RequirePackage{indentfirst}        %使每节的第一段仍然适用段首缩进
%\RequirePackage{titlesec}          %章节标题设置
\setlength{\parindent}{2em}     	%段首缩进量
\linespread{1.6}                	%行距倍数
\RequirePackage{geometry}			%边距等页面设置
\geometry{
  width=150mm,
  top=25mm,
  bottom=25mm,
}
%\RequirePackage{multicols}

\RequirePackage{graphicx}				%图片
\RequirePackage{pgfplots}				%pgf绘图
\pgfplotsset{width=11cm,compat=1.17}

\RequirePackage{amsmath,amssymb,amsthm}     %数学符号和定理等环境支持
\RequirePackage{bm}                         %使用宏\bm{}显示粗斜体
\RequirePackage{thmtools}                   %定理环境支持
\providecommand{\dif}{\,\mathrm{d}}
\providecommand{\euler}{\mathrm{e}}

\RequirePackage{caption}
\RequirePackage{subcaption}

%以下为代码块设置
%原作者为 LI Qin
%见于https://github.com/godvix/ilatex
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\RequirePackage{listings}	
\lstdefinestyle{mystyle}{
  backgroundcolor=\color{backcolour},   
  commentstyle=\color{codegreen},
  keywordstyle=\color{magenta},
  numberstyle=\tiny\color{codegray},
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false, 
  breaklines=true, 
  captionpos=b,
  keepspaces=true, 
  numbers=left,
  numbersep=5pt,  
  showspaces=false,
  showstringspaces=false,
  showtabs=false,  
  tabsize=2
}
\lstset{style=mystyle}

\RequirePackage{siunitx}	%单位支持

\RequirePackage{hyperref}   %为交叉引用添加超链接
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=red,      
	urlcolor=blue,
	citecolor=green,
}
\RequirePackage{cleveref}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{式}{式}
\crefname{section}{节}{节}

\renewcommand{\figurename}{图}                  %修改图题为中文
\renewcommand{\tablename}{表}                   %修改表题为中文
\renewcommand{\abstractname}{\large{摘要}\\}    %修改摘要标题为中文
%以下修改\today为中文显示
\renewcommand{\today}{\number\year 年 \number\month 月 \number\day 日}

\RequirePackage{authblk}                       	%改良的作者和联系方式显示
\setlength{\affilsep}{0em}						%修改作者与联系方式间的垂直间隔
%\renewcommand*{\Affilfont}{\small}             %修改联系方式字体大小

%以下为修改“日期”与“作者”的垂直间隔，并取消|\maketitle|对|\@title|的重置
%原定义参见article.cls
\makeatletter
\renewcommand{\maketitle}
{	
	\begin{titlepage}
	\let\footnotesize\small
	\let\footnoterule\relax
	\let\footnote\thanks
	\null\vfil\vskip 60\p@
	\begin{center}
	  	{\LARGE \@title \par}
	  	\vskip 3em
	  	{
			\large
	   		\lineskip .75em
			\begin{tabular}[t]{c}
		  		\@author
			\end{tabular}\par
		}
		\vskip 3em					%此处vskip值原为1.5em
	  	{\large \@date \par}		%默认|\@date|以小字号显示，此处放大
	\end{center}\par
	\@thanks
	\vfil
	\null
	\end{titlepage}%
	\setcounter{footnote}{0}%
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@date\@empty
	%\global\let\@title\@empty		%此处取消对|\@title|的重置以在页眉中使用
	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\and\relax
  }
\makeatother

\RequirePackage{multirow}       %表格分行
\RequirePackage{booktabs}       %三线表
\RequirePackage{longtable}		%跨页表格
%\RequirePackage{tabu}          %更灵活的表格

\RequirePackage[framemethod=TikZ]{mdframed}     %带背景色的box
%以下是几种box配置
%来自 Evan CHAN 所著 Napkin 的公开源码，有改动
%见于https://github.com/vEnhance/napkin
\mdfdefinestyle{mdbluebox}{
	roundcorner=10pt,
	linewidth=1pt,
	skipabove=12pt,
	innerbottommargin=9pt,
	skipbelow=2pt,
	nobreak=true,
	linecolor=blue,
	backgroundcolor=TealBlue!5,
}
\declaretheoremstyle[
	headfont=\sffamily\bfseries\color{MidnightBlue},
	mdframed={style=mdbluebox},
	headpunct={\\[3pt]},
	postheadspace={0pt}
]{thmbluebox}

\mdfdefinestyle{mdredbox}{
	linewidth=0.5pt,
	skipabove=12pt,
	frametitleaboveskip=5pt,
	frametitlebelowskip=0pt,
	skipbelow=2pt,
	frametitlefont=\bfseries,
	innertopmargin=4pt,
	innerbottommargin=8pt,
	nobreak=true,
	linecolor=RawSienna,
	backgroundcolor=Salmon!5,
}
\declaretheoremstyle[
	headfont=\bfseries\color{RawSienna},
	mdframed={style=mdredbox},
	headpunct={\\[3pt]},
	postheadspace={0pt},
]{thmredbox}

\mdfdefinestyle{mdblackbox}{
	skipabove=8pt,
	linewidth=3pt,
	rightline=false,
	leftline=true,
	topline=false,
	bottomline=false,
	linecolor=black,
	backgroundcolor=RedViolet!5!gray!5,
}
\declaretheoremstyle[
	headfont=\bfseries,
	bodyfont=\normalfont\small,
	spaceabove=0pt,
	spacebelow=0pt,
	mdframed={style=mdblackbox},
	headpunct={},
]{thmblackbox}

\declaretheorem[style=thmredbox,name=讨论]{discuss}
\declaretheorem[style=thmredbox,name=思考题]{problem}
\declaretheorem[style=thmblackbox,name=注意]{notice}
\renewcommand{\thenotice}{}

\makeatletter
    \def\Title{\@title}
    \let\Author\@author
\makeatother

%以下为页眉页脚设置
%原作者为 CHEN Yilin，有改动
%见于https://github.com/singlet-Carbene/WYC-Template
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancy}
\fancypagestyle{preContent}
{
    \fancyhf{}
    \fancyhead[L]{\textbf{\Title}}
	\fancyhead[R]{\leftmark}
    \renewcommand\headrulewidth{.5pt}
	\renewcommand\footrulewidth{.5pt}
    \fancyfoot[R]{\setlength{\affilsep}{0em}\renewcommand*{\Affilfont}{\normalfont}\Author}
	\fancyfoot[C]{\raisebox{-1.5ex}{第 \thepage 页，共 \pageref{LastPage} 页}}
	\fancyfoot[L]{\raisebox{-3ex}{\includegraphics[width=0.3\textwidth]{logoofwycollegewithwords.pdf}}}
}
\pagestyle{preContent}

