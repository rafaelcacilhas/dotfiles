
" KEYBINDING HACKS
vnoremap < <gv
vnoremap > >gv

" Yank all content
nnoremap <leader>y ggVGy<C-o>
nnoremap Y y$

" Run text from line as command
nmap Q :.!sh<CR>

" Swap line with lower line
map <leader>x ddp

" Remapping escape key
inoremap ;; <Esc>

" Disabling Escape key
" inoremap <Esc> <Nop>

" Remap za to space
" nnoremap <space> za

" Map leader
let mapleader = ";"

" Guide navigation
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" General insert command
inoremap ;g <++>

" Enable and disable spell checker
map <silent> <leader>s :setlocal spell!<CR>

"Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

"Enable and disable auto indentation
map <leader>a :setlocal autoindent<CR>
map <leader>A :setlocal noautoindent<CR>

