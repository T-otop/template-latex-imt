\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IMTA-template}
\LoadClass[12pt, a4paper]{article} % Choisir report pour un report

% ---------------------- PACKAGES ------------------------ %

\RequirePackage[export]{adjustbox}
\RequirePackage[french]{babel}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage[centertags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{titlesec} % Style des sections
\RequirePackage[numbers, comma, sort&compress]{natbib}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}
\RequirePackage{url}
\RequirePackage[titles]{tocloft}
\RequirePackage{color}
\RequirePackage{xcolor}
\RequirePackage{afterpage}
\RequirePackage{mathspec}
\RequirePackage[width=17cm, a4paper]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{setspace} 
\RequirePackage{booktabs} % for much better looking tables
\RequirePackage[labelfont={sf,bf,small},textfont={sf,small},justification=RaggedRight,margin=0pt, figurewithin=section, tablewithin=section]{caption}

% Integration des chapitres
% \RequirePackage[small, md, sc]{titlesec}
% \RequirePackage[palatino]{quotchap}
% \RequirePackage{lettrine} % big letter at start of chapter

% ---------------------- FIN PACKAGES ------------------------ %

% ------------------------- DIVERS --------------------------- %

% Définition des couleurs imt bleu et vert
\definecolor{IMTA-Blue}{HTML}{00B8DE}
\definecolor{IMTA-Green}{HTML}{A4D233}
\definecolor{chaptergrey}{HTML}{58C6EE}

% Utilisation d'hyper lien
\hypersetup{
    linktocpage,
    colorlinks,
    citecolor=IMTA-Blue,
    filecolor=black,
    linkcolor=black,
    urlcolor=IMTA-Blue,
}

% ----------------------- FIN DIVERS ------------------------- %

% ----------------------- VARIABLES -------------------------- %

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\enterprise#1{\gdef\@enterprise{#1}}
\def\enterprisedepartment#1{\gdef\@enterprisedepartment{#1}}
\def\enterprisecity#1{\gdef\@enterprisecity{#1}}
\def\enterprisestate#1{\gdef\@enterprisestate{#1}}
\def\schoollogo#1{\gdef\@schoollogo{#1}}
\def\enterpriselogo#1{\gdef\@enterpriselogo{#1}}
\def\decologo#1{\gdef\@decologo{#1}}
\def\documenttype#1{\gdef\@documenttype{#1}}
\def\@IMTAfooter{\@title}

% --------------------- FIN VARIABLES ------------------------ %

% ----------------------- STYLE PAGE ------------------------- %

\fancypagestyle{firstpage}{
    \fancyhf{}
    \fancyhead[R]{\@decologo} % Your logo/image
    \fancyhead[L]{
        \@degreemonth\ \@degreeyear \\
        \vspace{15pt}
        \theauthor
    }
    \fancyfoot[L]{\@schoollogo} % Your logo/image
    \fancyfoot[R]{\@enterpriselogo} % Your logo/image
}

% Définition du style des en-têtes et des pieds de page
\fancypagestyle{IMTAfancy}{
    \fancyhead[L]{\nouppercase{\leftmark}} % Nom de la section courante en haut à gauche
    \fancyhead[C]{} % Rien au milieu
    \fancyhead[R]{} % Rien en haut à droite
    \fancyfoot[L]{\textit{\@IMTAfooter}} % Footer personnalisé en bas à gauche
    \fancyfoot[C]{} % Rien au milieu
    \fancyfoot[R]{\thepage} % Numéro de page en bas à droite
    \renewcommand{\headrulewidth}{0.4pt} %
}

% Style des sections (gras & bleu IMT)
\titleformat{\section}
    {\Large\bfseries\color{IMTA-Blue}}
    {\thesection}{1em}{}

% Syle des sous sections (vert IMT avec 2 indentations)
\titleformat{\subsection}
    {\large\color{IMTA-Green}}
    {\hspace{2em}\thesubsection}{1em}{}

% Style des sous sous sections (italique avec 4 indentations)
\titleformat{\subsubsection}
    {\itshape} % Italique
    {\hspace{4em}\thesubsubsection}{1em}{}

% -------------------- FIN STYLE PAGES ----------------------- %

% ----------------------- COMMANDES -------------------------- %

\newcommand{\IMTAfooter}[1]{\gdef\@IMTAfooter{#1}}

% Page de de couvervture
\renewcommand{\maketitle}{
    \singlespacing
    \thispagestyle{firstpage}
    \renewcommand{\headrulewidth}{0pt}
    \begin{flushleft}
    \vspace*{320pt}
    \Huge \textcolor{IMTA-Green}{\textbf{\thetitle}} \normalsize \\
    \vspace{15pt}
    \textcolor{gray}{
    \Large
    \@documenttype \\
    \vspace{10pt}
    \@department\\
    }
    \end{flushleft} 
    \vspace*{\fill}
    \newpage
}

% Page de copyright
\newcommand{\copyrightpage}{
    \newpage \thispagestyle{empty} \vspace*{\fill}
    \sc \noindent \copyright~\textit{\@degreeyear \hspace{3pt}~- \theauthor} \\
    \noindent All rights reserved. \\
    \vspace{10pt}
    \@university\\ \@universitycity, \@universitystate \\
    \vspace{5pt}
    \@enterprise\\ \@enterprisecity, \@enterprisestate\\
    \vspace*{\fill} \newpage \rm
}

% Abstract page
\newcommand{\abstractpage}{
    \newpage
    \pagenumbering{roman}
    \setcounter{page}{3}
    \thispagestyle{fancy}
    \rhead{\@author}
    \begin{center}
    \vspace*{1pt}
    \Large \textcolor{IMTA-Green}{\textbf{\@title}} \normalsize\\
    \vspace*{15pt}
    \sc Abstract \\ \rm
    \end{center}
    \doublespace 
    \input{frontmatter/abstract}
    \doublespace 
    \newpage \lhead{} \rhead{}
    \cfoot{\thepage}
    \onehalfspacing
}

% the acknowledgments page
\newcommand{\acknowledgments}{
    \chapter*{Remerciements}
    \noindent
    \input{frontmatter/thanks}
    \vspace*{\fill} 
    \newpage
    \setcounter{page}{1}
    \pagenumbering{arabic}
}

% An environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}}

% --------------------- FIN COMMANDES ------------------------ %
