\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sog}[2011/07/08 v0.2 Modified article class for standard operating procedures]
% https://stackoverflow.com/questions/581916/how-do-you-extend-article-document-class-in-latex

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

% Use Arial throughout
\usepackage{fontspec}
\setmainfont{Arial}

% Redefine the page margins
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}

% Image import
\usepackage{graphicx}
\graphicspath{ {./images/} }

% Modifications to the section titles
\RequirePackage{titlesec}
\renewcommand{\thesection}{\Roman{section}}
\titleformat{\section}{\normalfont\bfseries}
  {\makebox[3em][l]{\thesection{}.}}{0pt}{}
\titleformat{\subsection}{\normalfont\bfseries}
  {}{0pt}{}

% Modification of title block
\RequirePackage{titling}
\RequirePackage{multirow}
\newcommand{\approved}[1]{\newcommand{\theapproved}{#1}}
\newcommand{\sognumber}[1]{\newcommand{\mythenumber}{#1}}
\newcommand{\sectiontitle}[1]{\newcommand{\mysectiontitle}{#1}}
% Ref: http://tex.stackexchange.com/questions/3988/titlesec-versus-titling-mangling-thetitle
\let\oldtitle\title
\renewcommand{\title}[1]{\oldtitle{#1}\newcommand{\mythetitle}{#1}}
\renewcommand{\maketitle}{%
\begin{tabular}{|c|p{2in}|l|l|} \hline
\multirow{3}{*}{\includegraphics[width=1.5cm, height=1cm]{dfc-logo}} & \multicolumn{1}{p{2.5in}|}{\centering \textbf{Dayville Fire Company} } & \multicolumn{2}{l|}{Number: \mythenumber } \\
\cline{2-4}
& \multicolumn{1}{p{2.5in}|}{\centering Standard Operating Procedure } & \multicolumn{2}{p{2.5in}|}{Title: \mythetitle} \\ \cline{2-4}
& \multicolumn{1}{p{2.5in}|}{\centering Section: \mysectiontitle} & \multicolumn{2}{l|}{Revision Date: \theapproved} \\ \hline
\end{tabular}
}

% For "Page N of M"
\RequirePackage{lastpage}
% For easier construction of page headers/footers
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{ % for first page
\fancyhf{}
\fancyfoot[L]{\framebox{SOG: \mythenumber}}
\fancyfoot[R]{\framebox{Page: \thepage{} of \pageref*{LastPage}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

\pagestyle{fancy} % for other pages
\fancyhf{}
\fancyhead[R]{%
\begin{tabular}{|c|c|} \hline %
Revision Date: & Number: \\
\theapproved & \\ \hline
\end{tabular}%
}
\fancyfoot[L]{\framebox{\mythenumber}}
\fancyfoot[R]{\framebox{Page: \thepage{} of \pageref*{LastPage}}} % \pageref* if we use hyperref, \pageref otherwise
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% For easier customization of itemized, enumerated, and other lists
\RequirePackage{enumitem}
% For hyperlinked cross-references
\RequirePackage{hyperref}
% Ensure first page is correct style
\thispagestyle{plain}
% That's all, folks!
\endinput

