\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{templateWYC}[2022/03/12]
\LoadClass[a4paper]{article}

%以下是可选项
\newif\iftpage\tpagefalse					%单独标题页
\DeclareOption{titpage}{\tpagetrue}
\newif\ifhstyle\hstylefalse					%试卷格式
\DeclareOption{homeworkstyle}{\hstyletrue}
\newif\ifchn\chntrue						%中文
\DeclareOption{eng}{\chnfalse}
\newif\iffooter\footertrue					%页脚图片
\DeclareOption{nofooter}{\footerfalse}
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax

\RequirePackage[utf8]{inputenc}     %Unicode
\RequirePackage{xeCJK}              %中文

\RequirePackage{amsmath,amssymb,amsthm}     %数学支持
\RequirePackage{bm}                         %粗斜体
\RequirePackage{thmtools}                   %定理等环境支持
\providecommand{\dif}{\,\mathrm{d}}
\providecommand{\euler}{\mathrm{e}}
\providecommand{\driv}[2]{\frac{\dif #1}{\dif #2}}
\providecommand{\ddriv}[2]{\dfrac{\dif #1}{\dif #2}}

\RequirePackage[usenames,svgnames,dvipsnames]{xcolor}	%颜色

\RequirePackage{wrapfig}            %图文混排（环绕）      
\RequirePackage{indentfirst}        %使每节第一段适用段首缩进
\RequirePackage{titlesec}           %章节标题设置
\ifhstyle
	\titleformat{\section}{\raggedright\large\bfseries}{}{}{}
	\titleformat{\subsection}{\raggedright\large\bfseries}{(\,\arabic{subsection}\,)}{1em}{}
\fi
\setlength{\parindent}{2em}     	%段首缩进量
\linespread{1.4}                	%行距倍数
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

\RequirePackage{caption}
\RequirePackage{subcaption}

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
\ifchn
	\crefname{figure}{图}{图}
	\crefname{table}{表}{表}
	\crefname{equation}{式}{式}
	\crefname{section}{节}{节}

	\renewcommand{\figurename}{图}                  
	\renewcommand{\tablename}{表}                   
	\renewcommand{\abstractname}{\large{摘要}\\} 
	\renewcommand{\today}{\number\year 年 \number\month 月 \number\day 日}
\fi

\RequirePackage{authblk}                       	%改良的作者和联系方式显示
\setlength{\affilsep}{0em}						%修改作者与联系方式间的垂直间隔
%\renewcommand*{\Affilfont}{\small}             %修改联系方式字体大小

%以下取消|\maketitle|对|\@title|的重置
%原定义参见article.cls
\makeatletter

\iftpage
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
\else
\renewcommand{\maketitle}
{	
	\par
    \begingroup
		\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
		\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
		\long\def\@makefntext##1{\parindent 1em\noindent
					\hb@xt@1.8em{%
					\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
		\if@twocolumn
        	\ifnum \col@number=\@ne
          		\@maketitle
        	\else
          		\twocolumn[\@maketitle]%
        	\fi
    	\else
			\newpage
			\global\@topnum\z@   % Prevents figures from going at top of page.
			\@maketitle
    	\fi
    	\thispagestyle{plain}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    %\global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}
\fi
\makeatother

\RequirePackage{multirow}       %表格分行
\RequirePackage{booktabs}       %三线表
\RequirePackage{longtable}		%跨页表格
%\RequirePackage{tabu}          %更灵活的表格

\RequirePackage[framemethod=TikZ]{mdframed}     %带背景色的box
%以下是几种box配置
%来自 Evan CHAN 的著作 A Infinite Napkin ，有改动
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

\ifchn
	\declaretheorem[style=thmredbox,name=讨论]{discuss}
	\declaretheorem[style=thmredbox,name=思考题]{problem}
	\declaretheorem[style=thmblackbox,name=注意]{notice}
	\renewcommand{\thenotice}{}
\else
	\declaretheorem[style=thmredbox,name=discuss]{discuss}
	\declaretheorem[style=thmredbox,name=problem]{problem}
	\declaretheorem[style=thmblackbox,name=notice]{notice}
	\renewcommand{\thenotice}{}
\fi

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
	\fancyfoot[C]{
		\raisebox{-1.5ex}{
			\ifchn 
				第 \thepage 页，共 \pageref{LastPage} 页 
			\else
				Page \thepage{} of\ \pageref{LastPage}
			\fi	
		}
	}
	\iffooter
	\fancyfoot[L]{\raisebox{-3ex}{\includegraphics[width=0.3\textwidth]{WYCwWords.pdf}}}
	\fi
}
\pagestyle{preContent}

