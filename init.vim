call plug#begin('~/.local/shared/nvim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'danro/rename.vim'
Plug 'bling/vim-airline'
Plug 'aswathkk/darkscene.vim'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'wvffle/vimterm'
Plug 'rakr/vim-one'

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

" Colorscheme preferences
colorscheme darkscene
set termguicolors
set showbreak=↳ " display this character in front of wrapped lines
let g:airline_theme='darkscene'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
set cursorline

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

let g:syntastic_cpp_compiler="icpc"
let g:syntastic_cpp_compiler_options="-Wall"

" Coc config
set hidden
set nobackup
set nowritebackup

" More space for displaying messages
set cmdheight=2

set updatetime=300

set shortmess+=c
if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
end

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
