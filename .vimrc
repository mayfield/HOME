filetype plugin on
syntax on
set backup
set nocompatible
set hlsearch
set mousehide
set ignorecase
set smartcase
set incsearch
set history=5000
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

set statusline=%#PmenuSbar#%<\ [%n]\ %t\ %m%r
set statusline+=%=
set statusline+=%#Folded#\ line:\ %3l\ of\ %L,\ col:\ %2c\ (%P)\ \ 
set laststatus=2
