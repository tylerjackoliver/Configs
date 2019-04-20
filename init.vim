call plug#begin('~/.local/shared/nvim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'danro/rename.vim'
Plug 'bling/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
Plug 'wvffle/vimterm'

call plug#end()

map <C-o> :NERDTreeToggle<CR> 
map ; :CtrlP<CR>
map <C-t> <C-w>n:term<CR>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-y> <Esc>:q<CR>
map <C-y> <Esc>:q<CR>

" Move between windows
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


" Paper color colorscheme
"
"
"
 
colorscheme PaperColor
set background=dark

set showbreak=↳ " display this character in front of wrapped lines

" Backup, Undo, Swap
set noswapfile " don't keep swap files
set undofile " keep undo files

" Search
set ignorecase " ignore case in search patterns
set smartcase " ... unless pattern contains upper case charecters
set nohlsearch " don't highlight other searh matches

" Editing
set nojoinspaces " when joining lines, don't insert two spaces after punctuation

" Indentation, Linebreak
set tabstop=4 " a <Tab> is 4 characters long
set softtabstop=4 " when editing indentations, edit 4 characters at once
set shiftwidth=4 " use 4 spaces when (auto)indenting
set expandtab " on a <Tab>, insert spaces
set colorcolumn=+1 " draw a line after 'textwidth'
set breakindent " keep indentation when wrapping lines
set mouse=a " enable mouse use in all modes

" auto-indent pasted text
nnoremap p p=`]

" resize splits when the window is resized
au Vimresized * :wincmd =

" Line numbers

set number

" Fix for MacOS titling issue

set mouse=

" Fortran linting options

let g:syntastic_fortran_compiler = 'ifort'
let g:syntastic_fortran_remove_include_errors = 1
