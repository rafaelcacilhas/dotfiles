"							__           
" .-----.-----.-----.--.--.|__|.--------.
" |     |  -__|  _  |  |  ||  ||        |
" |__|__|_____|_____|\___/ |__||__|__|__|
" 
" Github: https://github.com/TechnicalDC

" REQUIRED {{{ 
runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required
source /home/dilip/.config/nvim/filetype.vim
source /home/dilip/.config/nvim/abbreviations.vim
source /home/dilip/.config/nvim/keybindings.vim
" }}}

" PLUGINS {{{
call plug#begin()

" APPEARANCE
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'dylanaraps/wal.vim'

" MUST HAVE
Plug 'tpope/vim-surround'    
Plug 'glepnir/dashboard-nvim'
Plug 'farmergreg/vim-lastplace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'

" Development
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/changesPlugin'

" Syntax highlighting
Plug 'vim-python/python-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'neomutt/neomutt.vim'
Plug 'vimwiki/vimwiki'

" Others
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-eunuch'

call plug#end()

" }}}

" CONFIGURATION {{{

" Settings {{{
filetype plugin indent on
syntax enable
set noswapfile
set noshowmode
set number relativenumber
set path+=**
set wildmenu
set wildmode=longest:full,list:full
set wildignore=*.o,*.obj,*.bak,*.exe,*.hi,*.dyn_hi,*.dyn_o,*.zip,*.pdf,*.gif,*.png,*.jpg,*.mp4,*mp3
set encoding=UTF-8
set nofoldenable
set foldmethod=marker
set foldtext=MyFoldText()
set foldmarker={{{,}}}
set nocursorline
set showmatch				" Show matching brackets.
set linebreak
set ignorecase				" Do case insensitive matching
set smartcase				" Do smart case matching
set clipboard+=unnamedplus	" Use System Clipboard
set mouse=a					" Enable mouse usage (all modes)
set tabstop=4     
set shiftwidth=4  
set softtabstop=4 
set spelllang=en_us
set fillchars+=vert:│,fold:\ ,eob:\ 
set nolist
set listchars=tab:│\ 
" }}}

" Styling {{{
colorscheme wal
hi Normal ctermbg=NONE

" Highlight Whitespaces
highlight Whitespace ctermfg=Grey

" Makes comments italic
" highlight Comment cterm=italic

" Customize spell check highlighting
highlight SpellBad ctermbg=Red ctermfg=White
highlight SpellCap cterm=NONE ctermbg=NONE
highlight SpellRare cterm=NONE ctermbg=NONE
highlight SpellLocal cterm=undercurl ctermbg=NONE

" Customize cursor line
highlight CursorLine cterm=NONE ctermbg=Black  ctermfg=White
highlight CursorLineNr cterm=Bold ctermbg=NONE ctermfg=Red

highlight LineNr ctermbg=NONE ctermfg=Cyan
highlight VertSplit ctermbg=NONE ctermfg=White

" Customize folds
highlight link Comment Folded 

function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
    return ''. repeat(' ', 4) . line_text . repeat(' ', fillcharcount) . ' [' . folded_line_num . ' L]'
    " return ''. repeat(' ', 4) . line_text . repeat(' ', fillcharcount) . ' [' . folded_line_num . ' L]'
endfunction
" }}}

" Autocmd {{{
autocmd VimEnter,BufEnter * :set signcolumn=yes
" }}}

" }}}

" VIMWIKI {{{

let g:vimwiki_list = [{'auto_diary_index': 1}]

" }}}

" DASHBOARD {{{
let g:dashboard_default_executive ='fzf'
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
    \'',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⢠⠀⠀⠠⡀⠀⠀⠀⠀⠀⠈⢿⣿⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀',
	\'⠀⠀⠘⣧⡀⠀⠙⣦⣀⠀⠀⠀⠀⠀⠲⣿⠿⠿⠦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡆⠀⠀⠀⠀',
	\'⠀⠀⡄⠻⠿⢦⡀⠈⠻⣷⣬⣻⣖⡤⠀⣀⣴⠄⠀⠀⢀⣆⢸⠃⠀⠀⠀⠀⣼⣿⡇⠀⠀⠀⠀',
	\'⠀⠀⢹⣆⠻⠿⠯⢷⣦⣌⣻⣿⣿⣷⣾⣿⣧⡀⠠⣄⣿⣿⣟⣼⠀⢀⡆⣰⣿⡟⠀⠀⠀⠀⠀',
	\'⢀⠀⠀⢣⡰⡟⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⣿⣿⡷⠟⠁⠀⠀⠀⠀⠀',
	\'⣦⡳⡆⠀⠙⢿⣦⣬⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣤⠀⠀⠀⠀⠀⠀',
	\'⣿⣿⡇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢹⡟⢀⠀⠀⠀⠀⠀',
	\'⣿⣿⡇⠀⠀⠀⠹⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡿⢡⣾⠀⠀⠀⢀⣤',
	\'⣿⣿⣇⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣿⣿⣋⣁⣤⣢⣴⡝⠟',
	\'⣿⣿⢹⡀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧',
	\'⠛⠁⠀⢧⠀⢀⠀⠀⠀⠀⠀⠈⠉⠛⠿⣿⣿⣿⣿⣿⡿⠋⣠⣾⣿⡿⢟⣿⣿⣿⣿⣿⣿⣿⣿',
	\'⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠋⠁⠀⣠⢻⠟⣩⣶⣿⣿⣿⣿⣿⡿⠟⠉⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠿⣴⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⡐⠁⠀⢹⣿⣿⣿⣿⡿⠉⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠁⠀⠀⢸⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠁⠀⠀⠀⠀⠀⢀⡖⠀⠀⢀⣸⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⠁⠀⠀⠀⠀⠀⣰⠏⠀⠀⣴⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⢀⡼⠁⠀⠀⣰⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⠀⠀⠞⠀⠀⠀⠠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿',
	\'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿',
    \'',
    \]

" }}}

" EMMET-VIM {{{

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_mode='a'    "enable all function in all mode.
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall

" }}}

" VIM AIRLINE THEME {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
" let g:airline_theme='murmur'
" let g:airline_theme='minimalist'
" let g:airline_theme='dracula'

" }}}

" NERD TREE CONFIG {{{

" " nnoremap <silent> tt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=30

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" }}}

" GOYO {{{

let g:goyo_width = 80
let g:goyo_height = 30
let g:goyo_liner = 0

map <silent> <leader>gy :Goyo<CR> 

" }}}

" COC {{{

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=auto
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}

" CHANGES-PLUGIN {{{
let g:changes_autocmd=1
let g:changes_respect_SignColumn=1
let g:changes_sign_text_utf8=0
let g:changes_use_icons=1

" custom signs 
let g:changes_modified_sign='!'
let g:changes_add_sign='+'
let g:changes_delete_sign='-'

let g:changes_utf8_modified_sign=''
let g:changes_utf8_add_sign=''
let g:changes_utf8_delete_sign=''

" }}}

" INDENT-LINES {{{
let g:indentLine_enabled = 0
let g:indentLine_char = '│'
let g:indentLine_defaultGroup = 'LineNr'
" }}}

" FZF {{{

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
let g:fzf_preview_window = []

" - down / up / left / right
let g:fzf_layout = { 'down': '50%' }


let g:fzf_colors =
	\ { 'fg':    ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Normal'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }
 
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>e :History<CR>

command! -bang -nargs=? -complete=dir History
			\ call fzf#vim#history({'options': ['--preview', 'batcat {} -p --color always','--pointer','>>','--prompt',' ','--layout','default']}, <bang>0)
command! -bang -nargs=? -complete=dir Files
			\ call fzf#vim#files(<q-args>, {'options': ['--preview', 'batcat {} -p --color always','--pointer','>>','--prompt',' ','--layout','default']}, <bang>0)
command! -bang -nargs=? -complete=dir GFiles
			\ call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'batcat {} -p --color always','--pointer','>>','--prompt',' ','--layout','default']}, <bang>0)

" }}}

" TABS, SPLITS AND BUFFERS {{{

" MANAGING BUFFERS
nnoremap <A-C> :bprevious<CR>
nnoremap <A-c> :bnext<CR>

" MANAGING TABS
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <A-t> :TabVifm<CR>
nnoremap <silent> <A-n> :tabnew<CR> 
nnoremap <silent> <A-,> :tabmove -<CR>
nnoremap <silent> <A-.> :tabmove +<CR>

" MANAGING SPLITS
set splitbelow splitright

" Terminal Buffer
function! TerminalSettings()
    setlocal nonumber
    setlocal norelativenumber
    normal a
endfunction

" Open terminal in split
nnoremap <leader>st :sp<space>\|<space>terminal<CR>
nnoremap <leader>vt :vs<space>\|<space>terminal<CR>

" Change splits from vertical to horizontal and vice versa
" Horizontal to vertical
map <leader>th <C-w>t<C-w>H
" Vertical to horizontal
map <leader>tk <C-w>t<C-w>K

" Remap splits navigation to just ( Ctrl + hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keybindings for split resizing
noremap <silent> <A-l> :vertical resize +2<CR>
noremap <silent> <A-h> :vertical resize -2<CR>
noremap <silent> <A-k> :resize +2<CR>
noremap <silent> <A-j> :resize -2<CR>

" }}}

" OTHER {{{

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" vimrc:fdm=marker:foldlevel=0

" }}}

" vim: fdm=marker
