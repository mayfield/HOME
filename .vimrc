execute pathogen#infect()
filetype on
filetype plugin on
syntax on
set backup
set nocompatible
set hlsearch
set mousehide
set ignorecase
set smartcase
set incsearch
set history=10000
set scrolloff=8
set titlelen=200
set fo-=cro
set tags=tags;/
set number
set undofile
set undodir=~/.vim/undos
set backupdir=~/.vim/backups
set tabstop=4
set shiftwidth=4
set expandtab
set nofoldenable

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

colorscheme mayfield_silent

set statusline=%<\ [%n]\ %t\ %m%r
set statusline+=%=
set statusline+=\ line:\ %3l\ of\ %L,\ col:\ %2c\ (%P)\ \ 
set laststatus=2

"vim-gitgutter
set updatetime=400

" uncover the highlight groups for a symbol
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
