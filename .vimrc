" Vundle
"
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'ayu-theme/ayu-vim' 

call vundle#end()            " required

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" Basic =)) 
set nocompatible              " be iMproved, required
filetype plugin indent on    " required

" Colors
syntax enable " enable syntax processing

" Matching brace {}
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" Spaces and tabes
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set textwidth=79 " pep8
set autoindent
set fileformat=unix

" UI Config
set number              " show line numbers
set cursorline          " highlight current line
set cursorcolumn        " highlight current column
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
" set wildmode=list:longest,full " first tab-all, second tab- longest then change
set showmatch           " highlight matching [{()}]

" lightline
 let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'gitbranch' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
 "
" statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
:set laststatus=2
set statusline+=%*


set ic " ignore case while search

"Mouse
set mouse=a
set mousemodel=popup

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"Backup
"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup

set nobackup " Do not create backup files when saving over existing files
set noswapfile " No swap files when editing please

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default (0 -all closed 99 -all open)
set foldmethod=manual   " fold based on indent level
nnoremap <space> za " Enable folding with the spacebar

" Split
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" create a vertical split using :vsp and horizontal with :sp
set splitbelow " make the new window appear below the current window
set splitright " make the new window appear on the right

" Normal mode with enter
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Normal backspace
set bs=2

" Change mode with jj
inoremap jj <esc>

" Union mac and vim clipboard
set clipboard=unnamed

" Dont beep
set belloff=all

" NerdTree
map <Tab> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

