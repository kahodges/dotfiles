" Keyboard mappings for shortcuts
map <silent> <C-z> :undo<CR>
map <F2> :bprev<CR>
map <F3> :pnext<CR>
map <F5> :source ~/.vimrc<CR>
" Press the space bar to type the : char in command mode
nnoremap <space> :
" Press <Ctrl-q>  to force quit vim
nnoremap <silent> <C-q> :q!<CR>
" Type jj to exit insert mode quickly
inoremap jj <ESC>

set hlsearch
" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <slient> <C-l> :nohlsearch<CR>

" VIM colorscheme
colorscheme slate 
syntax on

" VIM spacing
set nu
set ruler
set cursorline
set tabstop=4
set expandtab
set shiftwidth=4
set nobackup
set showcmd
set showmode

" Enable auto completion menu after pressing TAB
set wildmenu
set wildmode=list:longest
