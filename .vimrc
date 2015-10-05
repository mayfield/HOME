call pathogen#infect()
filetype plugin on
set backup
set nocompatible
set backupdir=~/.vim_backups
syntax on
set hlsearch
set mousehide
set ignorecase
set smartcase
set incsearch
set history=5000
set scrolloff=4
set titlelen=200
set ruler
set ch=2
set fo-=cro
set tags=tags;/
set number
set undofile
set undodir=~/.vim/undos
set tabstop=4
set shiftwidth=4
set expandtab

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

colorscheme mayfield_silent
