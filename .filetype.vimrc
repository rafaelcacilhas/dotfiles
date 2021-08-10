" PYTHON {{{


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
autocmd FileType tex inoremap ;fa \usepackage[]{geometry}<Esc>F]i

" Sections
autocmd FileType tex inoremap ;sec \section{}<Esc>i
autocmd FileType tex inoremap ;ssec \subsection{}<Esc>i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Esc>i

" Text formatting
autocmd FileType tex inoremap ;b \textbf{}<Esc>i

" Environment
autocmd FileType tex inoremap ;doc \begin{document}<Enter>\end{document}<Esc>O
autocmd FileType tex inoremap ;doc \begin{itemize}<Enter>\end{itemize}<Esc>O

" }}}
