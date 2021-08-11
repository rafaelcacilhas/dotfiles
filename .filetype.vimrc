" PYTHON {{{

autocmd FileType python nnoremap <leader>r !python3 %p

" }}}

" MARKDOWN {{{

" Headers
autocmd filetype markdown inoremap ;1 #<space>
autocmd filetype markdown inoremap ;2 ##<space>
autocmd filetype markdown inoremap ;3 ###<space>
autocmd filetype markdown inoremap ;4 ####<space>
autocmd filetype markdown inoremap ;5 #####<space>
autocmd filetype markdown inoremap ;6 ######<space>

" Text formatting
autocmd filetype markdown inoremap ;b ****<Esc>hi
autocmd filetype markdown inoremap ;i __<Esc>i
autocmd filetype markdown inoremap ;s ~~~~<Esc>hi

" Image and Link
autocmd filetype markdown inoremap ;ig ![](){#fig:<Space>}<Esc>F]i
autocmd filetype markdown inoremap ;l []()<Esc>F]i

" List
autocmd filetype markdown inoremap ;o 1.<space>
autocmd filetype markdown inoremap ;u *<space>

" Task
autocmd filetype markdown inoremap ;t -<space>[<space>]<space>

" Code block
autocmd filetype markdown inoremap ;cb ```<Enter>```<esc>O

" }}}

" VIMWIKI {{{

" Headers
autocmd filetype vimwiki inoremap ;1 =<space><space>=<esc>hi
autocmd filetype vimwiki inoremap ;2 ==<space><space>==<esc>2hi
autocmd filetype vimwiki inoremap ;3 ===<space><space>===<esc>3hi
autocmd filetype vimwiki inoremap ;4 ====<space><space>====<esc>4hi
autocmd filetype vimwiki inoremap ;5 =====<space><space>=====<esc>5hi
autocmd filetype vimwiki inoremap ;6 ======<space><space>======<esc>6hi

" Text formatting
autocmd filetype vimwiki inoremap ;b **<Esc>i
autocmd filetype vimwiki inoremap ;i __<Esc>i

" List
autocmd filetype vimwiki inoremap ;no 1)<space>
autocmd filetype vimwiki inoremap ;Ro I)<space>
autocmd filetype vimwiki inoremap ;ro i)<space>
autocmd filetype vimwiki inoremap ;Ao A)<space>
autocmd filetype vimwiki inoremap ;ao a)<space>
autocmd filetype vimwiki inoremap ;u *<space>

" Image and Link
autocmd filetype vimwiki inoremap ;ig ![](){#fig:<Space>}<Esc>F]i
autocmd filetype vimwiki inoremap ;l [[]]<Esc>hi

" Task
autocmd filetype vimwiki inoremap ;t -<space>[<space>]<space>

" Code block
autocmd filetype vimwiki inoremap ;cb {{{<Enter>}}}<esc>O

" }}}

" LATEX {{{

" Package
autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;fa \usepackage{fontawesome}<Enter>
autocmd FileType tex inoremap ;gy \usepackage[]{geometry}<Esc>F]i
autocmd FileType tex inoremap ;bt \usepackage{blindtext}
autocmd FileType tex inoremap ;fhdr \usepackage{fancyhdr}
autocmd FileType tex inoremap ;eitem \usepackage{enumitem}
autocmd FileType tex inoremap ;grx \usepackage{graphicx}
autocmd FileType tex inoremap ;tocp \usepackage{tocloft}
autocmd FileType tex inoremap ;href \usepackage{hyperref}

" Main stuffs
autocmd FileType tex inoremap ;tit \title{}<Esc>i
autocmd FileType tex inoremap ;aut \author{}<Esc>i
autocmd FileType tex inoremap ;dt \date{}<Esc>i
autocmd FileType tex inoremap ;mt \maketitle<Enter>
autocmd FileType tex inoremap ;toc \tableofcontents<Enter>

" Custom commands
autocmd FileType tex inoremap ;nc \newcommand{}{}<Esc>F}i

" Headers and Footer
autocmd FileType tex inoremap ;fh \fancyhead[]{}<Esc>F]i
autocmd FileType tex inoremap ;ff \fancyfoot[]{}<Esc>F]i

" Sections
autocmd FileType tex inoremap ;sec \section{}<Esc>i
autocmd FileType tex inoremap ;ssec \subsection{}<Esc>i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Esc>i

" Text formatting
autocmd FileType tex inoremap ;b \textbf{}<Esc>i
autocmd FileType tex inoremap ;i \textit{}<Esc>i
autocmd FileType tex inoremap ;u \underline{}<Esc>i
autocmd FileType tex inoremap ;em \emph{}<Esc>i

" Text with specific font
autocmd FileType tex inoremap ;rm \textrm{}<Esc>i
autocmd FileType tex inoremap ;sf \textsf{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Esc>i

" Alignment
autocmd FileType tex inoremap ;cen \begin{center}<Enter>\end{center}<Esc>O
autocmd FileType tex inoremap ;right \begin{flushright}<Enter>\end{flushright}<Esc>O
autocmd FileType tex inoremap ;left \begin{flushleft}<Enter>\end{flushleft}<Esc>O

" Breaks
autocmd FileType tex inoremap ;pb \pagebreak<Enter>
autocmd FileType tex inoremap ;np \newpage<Enter>

" Spacing
autocmd FileType tex inoremap ;sh \hspace{}<Esc>i
autocmd FileType tex inoremap ;sv \vspace{}<Esc>i

" Graphics
autocmd FileType tex inoremap ;img \includegraphics{}<Esc>i
autocmd FileType tex inoremap ;imgo \includegraphics[]{}<Esc>F]i

" Environment
autocmd FileType tex inoremap ;doc \begin{document}<Enter>\end{document}<Esc>O
autocmd FileType tex inoremap ;item \begin{itemize}<Enter>\end{itemize}<Esc>O
autocmd FileType tex inoremap ;enum \begin{enumerate}[]<Enter>\end{enumerate}<Esc>k$i
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\end{frame}<Esc>O
autocmd FileType tex inoremap ;tb \begin{tabular}{}<Enter>\end{tabular}<Esc>k$i

" }}}
