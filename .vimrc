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
" Show search match info
set shortmess-=S

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Make * word search case sensitive always
nnoremap <expr> * ':%s/\<'.expand('<cword>').'\>\C//gn<CR>``'


colorscheme mayfield_silent

set statusline=%<\ [%n]\ %F\ %m%r
set statusline+=%=
set statusline+=\ line:\ %3l\ of\ %L,\ col:\ %2c\ (%P)\ \ 
set laststatus=2

let g:syntastic_javascript_checkers = ["eslint"]

"vim-gitgutter
set updatetime=200

" uncover the highlight groups for a symbol
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

autocmd BufEnter * :syntax sync fromstart


func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  setlocal spell spelllang=en_us
  setlocal nobackup
  setlocal noundofile
  setlocal nonumber
endfu
com! WP call WordProcessor()
